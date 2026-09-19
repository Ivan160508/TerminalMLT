unit ComPort;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Registry, Synaser, common, windows, DateUtils;

type
  TThrRead = class(TThread)
    private
    { Private declarations }
    protected
      procedure Execute; override;
    private
      Port                    : ^TBlockSerial;
      MutexPort               : ^THandle;
      isHalfDuplex            : ^boolean;
      BufThr                  : array[0..BUF_SIZE_PORT - 1] of byte;
      RB_Read                 : TRB_Read;
      MutexForRB              : THandle;
      CntLost                 : LongInt;
      CntByte                 : LongInt;
      isError                 : LongInt;
      DeltaTimeLastReadMax    : LongInt;
      DeltaTimeLastReadCur    : LongInt;
      procedure WriteInRB(buf : pByte; dt : TDateTime; len : Cardinal; MaxLen : Cardinal);
    public

  end;

  TThrWrite = class(TThread)
    private
    { Private declarations }
    protected
      procedure Execute; override;
    private
      Port         : ^TBlockSerial;
      MutexPort    : ^THandle;
      isHalfDuplex : ^boolean;
      BufThr       : array[0..BUF_SIZE_PORT - 1] of byte;
      RB_Write     : TRB_Write;
      MutexForWR   : THandle;
      CntLost      : LongInt;
      CntByte      : LongInt;
      isError      : LongInt;
      isBusyWrite  : LongInt;
      procedure WriteInRB(buf : pByte; len : Cardinal; MaxLen : Cardinal);
    public

  end;

  TComPort = class
    private
      PortReadThr   : TThrRead;    //Поток чтения данных из порта в кольцевой буфер
      PortWriteThr  : TThrWrite;   //Поток записи данных в порт
      CondOut       : TCondOut;
      BufDataTmp    : array[0..BUF_SIZE_PORT + CNT_BYTE_SEP] of byte;
      BufDTTmp      : array[0..BUF_SIZE_PORT + CNT_BYTE_SEP] of TDateTime;
      currentComPort : string;
      Port          : TBlockSerial;                              //Порт
      isHalfDuplex  : boolean;
      MutexPort     : THandle;
      isEnablePort  : boolean;
      PortName      : string;
    public
      constructor Create(name : string; BaudRate : Cardinal; bits: integer; Parity : TParity; StopBits: TStopBits; softflow, hardflow: boolean);
      destructor  Destroy; override;                                                 //удаление/закрытие порта
      procedure   WritePort(buf : pByte ; len : Cardinal; MaxLen : Cardinal);        //запись данных в порт
      function    ReadPort (buf : pByte ; MaxLen: Cardinal) : TResRead;              //чтение данных из порта в соответствии с ранее заданными условиями
      function    GetCntNotRead         : Cardinal;                                  //возвращает число невычитанных байтов из порта
      function    GetIsBusyWrite        : boolean;                                   //возвращает флаг занятости порта на отправку
      procedure   ResetGlRB;                                                         //сброс буферов
      function    GetCondOut            : TCondOut;                                  //возвращает набор условий
      procedure   SetCondOut(const Cond : pCondOut);                                 //задаёт набор условий
      Function    GetLostRead           : Cardinal;                                  //число потеряных байтов при чтении (вследствие переполнения приёмного буфера)
      Function    GetLostWrite          : Cardinal;                                  //число потеряных байтов при передаче (вследствие переполнения передающего буфера)
      Function    GetCntRead            : Cardinal;                                  //число прочитанных байтов
      Function    GetCntWrite           : Cardinal;                                  //число отправленных байтов
      Function    GetIsError            : boolean;                                   //статус ошибки порта (аппаратной)
      Function    GetName               : string;                                    //получение текущего имени порта
      Function    GetDescriptor         : string;                                    //описание порта
      Function    GetTimeLastRead       : LongInt;                                   //возвращает максимальную паузу между пакетами на интервале между запросами от GUI
  end;

  pComPort = ^TComPort;

function  ComPortGet(name : string; BaudRate : Cardinal; bits: integer; Parity : TParity; StopBits: TStopBits; softflow, hardflow: boolean) : TComPort;
//Возвращает указатель на созданный объект порта

function  ComPortSearsch  : TStringList;  
//Возвращает список доступных COM-портов из реестра Windows
//Пример применения:
//procedure UpdListPorts;
//var
//  PortList    : TStringList;
//begin
//  try
//    PortList    := ComPortSearsch;
//    FormMain.CBPortName.Items := PortList;
//  finally
//    PortList.Free;
//  end;
//end;



implementation

function AtomicRead(var V: LongInt): LongInt;
begin
  Result := InterlockedCompareExchange(V, 0, 0);
end;

procedure AtomicWrite(var V: LongInt; NewValue: LongInt);
begin
  InterlockedExchange(V, NewValue);
end;

function AtomicBoolRead(var V: LongInt): Boolean;
begin
  Result := AtomicRead(V) <> 0;
end;

procedure AtomicBoolWrite(var V: LongInt; NewValue: Boolean);
begin
  if NewValue then
    AtomicWrite(V, 1)
  else
    AtomicWrite(V, 0);
end;

procedure AtomicInc(var V: LongInt; Delta: LongInt);
begin
  InterlockedExchangeAdd(V, Delta);
end;

procedure AtomicDec(var V: LongInt; Delta: LongInt);
begin
  InterlockedExchangeAdd(V, Delta * (-1));
end;


constructor TComPort.Create(name : string; BaudRate : Cardinal; bits: integer; Parity : TParity; StopBits: TStopBits; softflow, hardflow: boolean);
  var
    i, j    : integer;
    MutexPortTMP : THandle;
    MutexRDTMP : THandle;
    MutexWRTMP : THandle;
  begin
    isEnablePort := false;
    Port := TBlockSerial.Create;
    if (Port <> nil) then
      begin
        Port.RaiseExcept := false;
        Port.LinuxLock   := False; // это требуется для Linux. Если это не установить, то не удастся открыть порт.
        currentComPort   := PChar('\\.\' + name);
        try
        Port.Connect(CurrentComPort); // открытие порта
        except
        Free;
        raise Exception.Create('');
        end;
      end
    else
      begin
        Free;
        raise Exception.Create('');
      end;

    if Port.LastError = sOK then
      Port.Config(BaudRate, bits, Char(Parity), integer(StopBits), softflow, hardflow);  // указываем параметры передачи данных

    if Port.LastError <> sOK then
      begin
        Port.CloseSocket;
        Port.BeforeDestruction;
        Port.Free;
        Port := nil;
      end;

    if Port <> nil then
      begin
        Randomize;
        MutexPortTMP := CreateMutex(nil, false, nil);
        MutexRDTMP   := CreateMutex(nil, false, nil);
        MutexWRTMP   := CreateMutex(nil, false, nil);

        if (MutexPortTMP <> 0) and (MutexRDTMP <> 0) and (MutexWRTMP <> 0) then
          begin
            PortReadThr             := TThrRead.Create(true);
            PortWriteThr            := TThrWrite.Create(true);
            PortReadThr.Port        := @Port;
            PortWriteThr.Port       := @Port;

            PortReadThr.Priority    := tpIdle;
            PortWriteThr.Priority   := tpIdle;

            MutexPort               := MutexPortTMP;
            PortReadThr.MutexForRB  := MutexRDTMP;
            PortWriteThr.MutexForWR := MutexWRTMP;

            PortReadThr.MutexPort   := @MutexPort;
            PortWriteThr.MutexPort  := @MutexPort;

            ZeroMemory(@PortReadThr.RB_Read, SizeOf(TRB_Read));
            ZeroMemory(@PortReadThr.BufThr,  BUF_SIZE_PORT);
            PortReadThr.CntLost     := 0;
            PortReadThr.CntByte     := 0;

            ZeroMemory(@PortWriteThr.RB_Write, SizeOf(TRB_Write));
            ZeroMemory(@PortWriteThr.BufThr,  BUF_SIZE_PORT);
            PortWriteThr.CntLost    := 0;
            PortWriteThr.CntByte    := 0;
            ResetGlRB;
            ZeroMemory(@CondOut, SizeOf(TCondOut));
            for j := 1 to CNT_SEC_COND do
              for i := 0 to CNT_BYTE_SEP - 1 do
                begin
                  CondOut.buf_before[j, i] := SYMBOL_EMPT;
                  CondOut.buf_after[j, i] := SYMBOL_EMPT;
                end;
            PortWriteThr.isHalfDuplex := @isHalfDuplex;
            PortReadThr.isHalfDuplex  := @isHalfDuplex;
            PortReadThr.DeltaTimeLastReadCur  := 0;
            PortReadThr.DeltaTimeLastReadMax := 0;
            PortReadThr.Resume;
            PortWriteThr.Resume;
            Sleep(5);
            PortName     := name;
            isEnablePort := true;
          end
        else
          begin
            if MutexPortTMP <> 0 then CloseHandle(MutexPortTMP);
            if MutexRDTMP   <> 0 then CloseHandle(MutexRDTMP);
            if MutexWRTMP   <> 0 then CloseHandle(MutexWRTMP);
            raise Exception.Create('');
          end;
      end
    else
      begin
        raise Exception.Create('');
      end;
  end;


destructor TComPort.Destroy;
  begin
    isEnablePort := false;
    if PortReadThr <> nil then PortReadThr.Terminate;
    if PortWriteThr <> nil then PortWriteThr.Terminate;

    if Port <> nil then
    begin
      try
        Port.CloseSocket; // только прервать I/O
      finally
      end;
    end;

    if PortWriteThr <> nil then
      PortWriteThr.WaitFor;

    if PortReadThr <> nil then
      PortReadThr.WaitFor;

    if PortWriteThr <> nil then
      if PortWriteThr.MutexForWR <> 0 then
        CloseHandle(PortWriteThr.MutexForWR);

    if PortReadThr <> nil then
      if PortReadThr.MutexForRB <> 0 then
        CloseHandle(PortReadThr.MutexForRB);

    if MutexPort <> 0 then
      CloseHandle(MutexPort);

    if PortWriteThr <> nil then
      FreeAndNil(PortWriteThr);

    if PortReadThr <> nil then
      FreeAndNil(PortReadThr);

    if Port <> nil then
      FreeAndNil(Port);
    inherited Destroy;
  end;

function TComPort.GetIsError : boolean;
  begin
    if not isEnablePort then
      begin
        result := true;
        exit;
      end;
    if (PortReadThr <> nil) and (PortWriteThr <> nil) then
      result := (AtomicRead(PortReadThr.isError) = 1) or (AtomicRead(PortWriteThr.isError) = 1)
    else
      result := false;
  end;


Function TComPort.GetLostRead : Cardinal;                          //число потеряных байтов при чтении
  begin
    if not isEnablePort then
      begin
        result := 0;
        exit;
      end;

    if PortReadThr <> nil then
      result := AtomicRead(PortReadThr.CntLost)
    else
      result := 0;
  end;

function TComPort.GetTimeLastRead : LongInt;
var
  Cur, Max : LongInt;
begin
  if (not isEnablePort) or (PortReadThr = nil) then
    begin
      result := 0;
      exit;
    end;

  Cur := AtomicRead(PortReadThr.DeltaTimeLastReadCur);
  Max := AtomicRead(PortReadThr.DeltaTimeLastReadMax);
  AtomicWrite(PortReadThr.DeltaTimeLastReadMax, 0);

  if Max > Cur then
    Result := Max
  Else
    result := Cur;
end;

Function TComPort.GetLostWrite : Cardinal;                          //число потеряных байтов при запихивании в буфер на отправку
  begin
    if not isEnablePort then
      begin
        result := 0;
        exit;
      end;

    if PortWriteThr <> nil then
      result := AtomicRead(PortWriteThr.CntLost)
    else
      result := 0;
  end;


Function TComPort.GetName : string;                          //Имя порта
  begin
    if not isEnablePort then
      begin
        result := '';
        exit;
      end;

    result := PortName;
  end;

Function TComPort.GetDescriptor : string;                    //описание порта
  begin
    if not isEnablePort then
      begin
        result := '';
        exit;
      end;

    result := Port.Device;
  end;


Function  TComPort.GetCntRead : Cardinal;                          //число прочитанных байтов
  var res : cardinal;
  begin
    if not isEnablePort then
      begin
        result := 0;
        exit;
      end;

    res := 0;
    if Port <> nil then
      if PortReadThr <> nil then
        res := AtomicRead(PortReadThr.CntByte);
    result := res;
  end;

Function  TComPort.GetCntWrite : Cardinal;                          //число отправленных байтов
begin
  if not isEnablePort then
      begin
        result := 0;
        exit;
      end;

  if PortWriteThr <> nil then
    result := AtomicRead(PortWriteThr.CntByte)
  else
    result := 0;
end;

function  TComPort.GetCondOut : TCondOut;                           //возвращает набор условий
begin
  if WaitForSingleObject(PortReadThr.MutexForRB, INFINITE) = WAIT_OBJECT_0 then
    begin
      try
      result := CondOut;
      finally
      ReleaseMutex(PortReadThr.MutexForRB);
      end;
    end;
end;

procedure TComPort.SetCondOut(const Cond : pCondOut);                     //задаёт набор условий
var
  CondOutTmp : TCondOut;
  i, j, k, z : Cardinal;
  buftmp : array[0..CNT_BYTE_SEP - 1] of word;
begin
  if not isEnablePort then
      begin
        exit;
      end;

  if Cond = nil then Exit;
  if WaitForSingleObject(PortReadThr.MutexForRB, INFINITE) = WAIT_OBJECT_0 then
    begin
      try
      CondOutTmp := Cond^;

      for i := 1 to CNT_SEC_COND do
        begin
          CondOutTmp.CntA[i] := 0;
          CondOutTmp.CntB[i] := 0;

          for j := 0 to CNT_BYTE_SEP - 1 do
            begin
              if CondOutTmp.buf_after[i,j] <> SYMBOL_EMPT then
                inc(CondOutTmp.CntA[i]);
              if CondOutTmp.buf_before[i,j] <> SYMBOL_EMPT then
                inc(CondOutTmp.CntB[i]);
            end;


          for z := 0 to CNT_BYTE_SEP - 1 do
            buftmp[z] := SYMBOL_EMPT;

          k := 0;
          for z := 0 to CNT_BYTE_SEP - 1 do
            if CondOutTmp.buf_after[i,z] <> SYMBOL_EMPT then
              begin
                buftmp[k] := CondOutTmp.buf_after[i,z];
                inc(k);
              end;

          for z := 0 to CNT_BYTE_SEP - 1 do
            CondOutTmp.buf_after[i,z] := buftmp[z];


          for z := 0 to CNT_BYTE_SEP - 1 do
            buftmp[z] := SYMBOL_EMPT;

          k := 0;
          for z := 0 to CNT_BYTE_SEP - 1 do
            if CondOutTmp.buf_before[i,z] <> SYMBOL_EMPT then
              begin
                buftmp[k] := CondOutTmp.buf_before[i,z];
                inc(k);
              end;

          for z := 0 to CNT_BYTE_SEP - 1 do
            CondOutTmp.buf_before[i,z] := buftmp[z];



          for j := 0 to CNT_BYTE_SEP - 1 do
            begin
              if (j + 1) > CondOutTmp.CntA[i] then
                CondOutTmp.buf_after[i,j] := SYMBOL_EMPT;
              if (j + 1) > CondOutTmp.CntB[i] then
                CondOutTmp.buf_before[i,j] := SYMBOL_EMPT;
            end;
        end;

      CondOut := CondOutTmp;
      finally
      ReleaseMutex(PortReadThr.MutexForRB);
      end;
  end;
end;


procedure TComPort.ResetGlRB;
begin
  if not isEnablePort then
    begin
      exit;
    end;

  if WaitForSingleObject(PortReadThr.MutexForRB, INFINITE) = WAIT_OBJECT_0 then
    begin
      try
      PortReadThr.RB_Read.Head := 0;
      PortReadThr.RB_Read.Tail := 0;
      PortReadThr.RB_Read.Cnt  := 0;
      finally
      ReleaseMutex(PortReadThr.MutexForRB);
      end;
    end;

  if WaitForSingleObject(PortWriteThr.MutexForWR, INFINITE) = WAIT_OBJECT_0 then
    begin
      try
      PortWriteThr.RB_Write.Head := 0;
      PortWriteThr.RB_Write.Tail := 0;
      PortWriteThr.RB_Write.Cnt  := 0;
      finally
      ReleaseMutex(PortWriteThr.MutexForWR);
      end;
    end;
end;


function TComPort.GetCntNotRead : Cardinal;
begin
  if not isEnablePort then
    begin
      result := 0;
      exit;
    end;
  try
    result := AtomicRead(PortReadThr.RB_Read.Cnt);
  except
    result := 0;
  end;
end;



function TComPort.GetIsBusyWrite : boolean;
  begin
    if not isEnablePort then
      begin
        result := true;
        exit;
      end;
    result := AtomicRead(PortWriteThr.isBusyWrite) > 0;// .isBusy;
  end;


procedure TComPort.WritePort(buf : pByte; len : Cardinal; MaxLen : Cardinal);
  begin
    if not isEnablePort then
      begin
        exit;
      end;

    if PortWriteThr <> nil then
      begin
        if WaitForSingleObject(PortWriteThr.MutexForWR, INFINITE) = WAIT_OBJECT_0 then
          begin
            try
            PortWriteThr.WriteInRB(buf, len, MaxLen);
            finally
            ReleaseMutex(PortWriteThr.MutexForWR);
            end;
          end;
      end;
  end;

function TComPort.ReadPort(buf : pByte; MaxLen : Cardinal) : TResRead;
  var
    res, cnt, i, j : integer;
    tmpRbTail    : cardinal;
    tmpRbCnt     : cardinal;
    isSend       : boolean;
    isDT         : boolean;
    ResRead      : TResRead;
    NumSecCond   : Cardinal;
  begin
    res := 0;
    cnt := 0;
    i   := 0;
    ResRead.DT  := 0;
    ResRead.Cnt := 0;

    if not isEnablePort then
      begin
        result := ResRead;
        exit;
      end;



    if (buf = nil) or (MaxLen = 0) then
      begin
        result := ResRead;
        exit;
      end;

    isSend := false;

    if PortReadThr <> nil then
      begin
        if WaitForSingleObject(PortReadThr.MutexForRB, INFINITE) = WAIT_OBJECT_0 then
          begin
            try
            tmpRbCnt  := AtomicRead(PortReadThr.RB_Read.Cnt);
            tmpRbTail := PortReadThr.RB_Read.Tail;

            if tmpRbCnt > MaxLen then
              tmpRbCnt := MaxLen;

            while tmpRbCnt > 0 do
              begin
                BufDataTmp[i] := PortReadThr.RB_Read.Buf[tmpRbTail];
                BufDTTmp[i]   := PortReadThr.RB_Read.DT[tmpRbTail];
                inc(cnt);
                inc(tmpRbTail);
                tmpRbTail := tmpRbTail and (BUF_SIZE_PORT - 1);
                dec(tmpRbCnt);
                inc(i);
              end;

            if cnt > 0 then
              begin
                if (not isSend) and CondOut.isCntByte and (cnt >= CondOut.CntByte) and (CondOut.CntByte > 0) then   //по числу байт
                  begin
                    res := CondOut.CntByte;
                    isSend := true;
                  end;

                if (not isSend) and CondOut.isTimeOut then                                                          //по таймауту
                  begin
                    res := 0;
                    i := 0;
                    isDT := false;
                    if cnt > 1 then
                      begin
                        while (i < (cnt - 1)) and (not isDT) do
                          begin
                            isDT := MilliSecondsBetween(BufDTTmp[i], BufDTTmp[i + 1]) > CondOut.TimeOut;
                            if not isDT then
                              inc(i);
                          end;
                        if not isDT then
                          isDT := MilliSecondsBetween(BufDTTmp[i], now) > CondOut.TimeOut;
                      end
                    else
                      isDT := MilliSecondsBetween(BufDTTmp[i], now) > CondOut.TimeOut;
                    if isDT then
                      res := i + 1;
                    isSend := res > 0;
                  end;

                NumSecCond := 1;
                while (NumSecCond <= CNT_SEC_COND) and (not isSend) do
                  begin
                    if (not isSend) and CondOut.isAfter[NumSecCond] and (CondOut.CntA[NumSecCond] > 0) then                  //по последовательности байт в конце 1
                      if ((cnt > CondOut.CntA[NumSecCond] - 1) and (CondOut.CntA[NumSecCond] <= CNT_BYTE_SEP)) then
                        begin
                          i := 0;
                          while (not isSend) and (i < cnt - (CondOut.CntA[NumSecCond] - 1)) do
                            begin
                              isSend := true;
                              for j := 0 to CondOut.CntA[NumSecCond] - 1 do
                                isSend := isSend and ((CondOut.buf_after[NumSecCond, j] = SYMBOL_ANY) or (CondOut.buf_after[NumSecCond, j] = BufDataTmp[i + j]));
                              inc(i);
                            end;
                          if isSend then
                            res := i + CondOut.CntA[NumSecCond] - 1;
                        end;
                    inc(NumSecCond);
                  end;

                NumSecCond := 1;

                while (NumSecCond <= CNT_SEC_COND) and (not isSend) do
                  begin
                    if (not isSend) and CondOut.isBefore[NumSecCond] and (CondOut.CntB[NumSecCond] > 0) then                  //перед последовательностью байтов 1
                      if ((cnt > CondOut.CntB[NumSecCond]) and (CondOut.CntB[NumSecCond] <= CNT_BYTE_SEP)) then
                        begin
                          i := 0;
                          while (not isSend) and (i < cnt - (CondOut.CntB[NumSecCond] - 1)) do
                            begin
                              isSend := true;
                              for j := 0 to CondOut.CntB[NumSecCond] - 1 do
                                if i + j < BUF_SIZE_PORT then
                                  isSend := isSend and ((CondOut.buf_before[NumSecCond, j] = SYMBOL_ANY) or (CondOut.buf_before[NumSecCond, j] = BufDataTmp[i + j])) and (i > 0);
                              inc(i);
                            end;
                          if isSend then
                            res := i - 1;
                        end;
                    inc(NumSecCond);
                  end;

            //=============================================================================================================================


                if (res > 0) and isSend then
                  begin
                    for i := 0 to res - 1 do
                      begin
                        buf^ := BufDataTmp[i];
                        inc(buf);
                        AtomicDec(PortReadThr.RB_Read.Cnt, 1);
                        Inc(PortReadThr.RB_Read.Tail);
                        PortReadThr.RB_Read.Tail := PortReadThr.RB_Read.Tail and (BUF_SIZE_PORT - 1);
                      end;
                    ResRead.Cnt := res;
                    ResRead.DT  := BufDTTmp[res - 1];
                    isSend := true;
                  end;
              end;
            finally
            ReleaseMutex(PortReadThr.MutexForRB);
            end;
          end;
      end;
    result := ResRead;
  end;


//-------------------------------------------------------------------------------------------------
procedure TThrRead.WriteInRB(buf : pByte; dt : TDateTime; len : Cardinal; MaxLen : Cardinal);
begin
  if buf = nil then exit;
  if Len > MaxLen then
    Len := MaxLen;
  while Len > 0 do
    begin
      RB_Read.Buf[RB_Read.Head] := buf^;
      RB_Read.DT[RB_Read.Head]  := dt;
      inc(buf);
      inc(RB_Read.Head);
      RB_Read.Head := RB_Read.Head and (BUF_SIZE_PORT - 1);
      if AtomicRead(RB_Read.Cnt) < BUF_SIZE_PORT then
        AtomicInc(RB_Read.Cnt, 1);
      if (RB_Read.Head = RB_Read.Tail) and (AtomicRead(RB_Read.Cnt) = BUF_SIZE_PORT) then
        begin
          AtomicInc(CntLost, 1);
          inc(RB_Read.Tail);
          RB_Read.Tail := RB_Read.Tail and (BUF_SIZE_PORT - 1);
          AtomicDec(RB_Read.Cnt, 1);
        end;
      dec(len);
    end;
end;


procedure TThrWrite.WriteInRB(buf : pByte; len : Cardinal; MaxLen : Cardinal);
begin
  if buf = nil then exit;
  if Len > MaxLen then
    Len := MaxLen;

  if Len > 0 then
    AtomicWrite(isBusyWrite, 1);

  while Len > 0 do
    begin
      RB_Write.Buf[RB_Write.Head] := buf^;
      inc(buf);
      inc(RB_Write.Head);
      RB_Write.Head := RB_Write.Head and (BUF_SIZE_PORT - 1);
      if AtomicRead(RB_Write.Cnt) < BUF_SIZE_PORT then
        AtomicInc(RB_Write.Cnt, 1);
      if (RB_Write.Head = RB_Write.Tail) and (AtomicRead(RB_Write.Cnt) = BUF_SIZE_PORT) then
        begin
          AtomicInc(CntLost, 1);
          inc(RB_Write.Tail);
          RB_Write.Tail := RB_Write.Tail and (BUF_SIZE_PORT - 1);
          AtomicDec(RB_Write.Cnt, 1);
        end;
      dec(len);
    end;
end;

procedure TThrRead.Execute;
  var
    cntRead  : Cardinal;
    TimeRead : TDateTime;
  begin
    TimeRead := now;
    while not Terminated do
      begin
        if (Port^ <> nil) and (AtomicRead(isError) <> 1) then
          begin
            try
            if Port^.LastError = 0 then
              begin
                if Port^.WaitingData > 0 then
                  begin
                    cntRead := Port^.WaitingData;
                    if cntRead > BUF_SIZE_PORT then
                      cntRead := BUF_SIZE_PORT;

                    if isHalfDuplex^ then
                      begin
                        if WaitForSingleObject(MutexPort^, INFINITE) = WAIT_OBJECT_0 then
                          begin
                            try
                            Port^.RecvBuffer(@BufThr, cntRead);
                            finally
                            ReleaseMutex(MutexPort^);
                            end;
                          end;
                      end
                    else
                      begin
                        Port^.RecvBuffer(@BufThr, cntRead);
                      end;
                    TimeRead := now;

                    if WaitForSingleObject(MutexForRB, INFINITE) = WAIT_OBJECT_0 then
                      begin
                        try
                        WriteInRB(@BufThr, now, cntRead, BUF_SIZE_PORT);
                        AtomicInc(CntByte, cntRead);
                        finally
                        ReleaseMutex(MutexForRB);
                        end;
                      end;
                  end;
                AtomicWrite(DeltaTimeLastReadCur, LongInt(MilliSecondsBetween(now, TimeRead)));  //Сохраняем максимальную
                if AtomicRead(DeltaTimeLastReadCur) > AtomicRead(DeltaTimeLastReadMax) then      //пауза между пакетами
                  AtomicWrite(DeltaTimeLastReadMax, DeltaTimeLastReadCur);                       //на время между запросами значения паузы
              end
            else
              begin
                AtomicWrite(isError, 1);
                Sleep(10);
              end;
            except
              AtomicWrite(isError, 1);
              sleep(10);
            end;
          end
        else
          begin
            sleep(10);
          end;
        Sleep(1);
      end;
  end;

procedure TThrWrite.Execute;
  var
    i : integer;
  begin
    AtomicWrite(isBusyWrite, 0);
    while not Terminated do
      begin
        if (Port^ <> nil) and (AtomicRead(isError) <> 1) then
          begin
            try
            if Port^.LastError = 0 then
              begin
                while (Port^.SendingData > 0) and not Terminated do Sleep(1);
                i := 0;
                if AtomicRead(RB_Write.Cnt) = 0 then sleep(1);
                if WaitForSingleObject(MutexForWR, INFINITE) = WAIT_OBJECT_0 then
                  begin
                    try
                    while (AtomicRead(RB_Write.Cnt) > 0) and (i < MAX_PARTSIZE_SEND) do
                      begin
                        BufThr[i] := RB_Write.Buf[RB_Write.Tail];
                        inc(RB_Write.Tail);
                        RB_Write.Tail := RB_Write.Tail and (BUF_SIZE_PORT - 1);
                        inc(i);
                        AtomicDec(RB_Write.Cnt, 1);
                      end;
                    finally
                    ReleaseMutex(MutexForWR);
                    end;
                  end;

                if i > 0 then
                  begin
                    if isHalfDuplex^ then
                      begin
                        if WaitForSingleObject(MutexPort^, INFINITE) = WAIT_OBJECT_0 then
                          begin
                            try
                            if AtomicRead(RB_Write.Cnt) > 0 then
                              AtomicWrite(isBusyWrite, 1)
                            else
                              AtomicWrite(isBusyWrite, 0);
                            Port^.SendBuffer(@BufThr, i);
                            while (Port^.SendingData > 0) and not Terminated do Sleep(1);
                            if AtomicRead(RB_Write.Cnt) > 0 then
                              AtomicWrite(isBusyWrite, 1)
                            else
                              AtomicWrite(isBusyWrite, 0);
                            finally
                            ReleaseMutex(MutexPort^);
                            AtomicWrite(isBusyWrite, 0);
                            end;
                          end;
                      end
                    else
                      begin
                        if AtomicRead(RB_Write.Cnt) > 0 then
                          AtomicWrite(isBusyWrite, 1)
                        else
                          AtomicWrite(isBusyWrite, 0);

                        Port^.SendBuffer(@BufThr, i);
                        while (Port^.SendingData > 0) and not Terminated do Sleep(1);
                        if AtomicRead(RB_Write.Cnt) > 0 then
                          AtomicWrite(isBusyWrite, 1)
                        else
                          AtomicWrite(isBusyWrite, 0);
                      end;
                    AtomicInc(CntByte, i);
                  end;
              end
            else
              begin
                AtomicWrite(isError, 1);
                AtomicWrite(isBusyWrite, 0);
                Sleep(10);
              end;
            except
              AtomicWrite(isError, 1);
              AtomicWrite(isBusyWrite, 0);
              Sleep(10);
            end;
          end
        else
          begin
            Sleep(10);
          end;
      end;
  end;


//----------------------------------------------------------------------------------------

function ComPortSearsch : TStringList;
  var reg      : TRegistry;
      l        : TStringList;
      i        : integer;
      PortList : TStringList;
  begin
    l        := TStringList.Create;
    PortList := TStringList.Create;
    reg      := TRegistry.Create;

    try
      reg.RootKey := HKEY_LOCAL_MACHINE;
      reg.OpenKeyReadOnly('HARDWARE\DEVICEMAP\SERIALCOMM');
      reg.GetValueNames(l);
      for i:=0 to l.Count-1 do
        PortList.Add(reg.ReadString(l[i]));
    finally
      reg.Free;
      l.Free;
    end;
    result := PortList;
  end;

function  ComPortGet(name : string; BaudRate : Cardinal; bits: integer; Parity : TParity; StopBits: TStopBits; softflow, hardflow: boolean) : TComPort;
var
  res : TComPort;
begin
  if name = '' then
    begin
      result := nil;
      exit;
    end;

  if (Pos('COM', name) = 0) and (Pos('CNC', name) = 0)  then
    begin
      result := nil;
      exit;
    end;

  try
    res := TComPort.Create(name, BaudRate, bits, Parity, StopBits, softflow, hardflow);
  except
    res := nil;
  end;
  result := res;
end;

end.



