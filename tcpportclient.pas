unit tcpportclient;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Registry, Synaser, common, windows, DateUtils, blcksock, synsock;

type
  TThrTcpRead = class(TThread)
    private
    { Private declarations }
    protected
      procedure Execute; override;
    private
      Socket                  : ^TTCPBlockSocket;
      MutexPort               : ^THandle;
      BufThr                  : array[0..BUF_SIZE_PORT - 1] of byte;
      RB_Read                 : TRB_Read;
      MutexForRB              : THandle;
      CntLost                 : LongInt;
      CntByte                 : LongInt;
      isError                 : LongInt;
      LastError               : LongInt;
      DeltaTimeLastReadMax    : LongInt;
      DeltaTimeLastReadCur    : LongInt;
      procedure WriteInRB(buf : pByte; dt : TDateTime; len : Cardinal; MaxLen : Cardinal);
    public

  end;

  TThrTcpWrite = class(TThread)
    private
    { Private declarations }
    protected
      procedure Execute; override;
    private
      Socket       : ^TTCPBlockSocket;
      MutexPort    : ^THandle;
      BufThr       : array[0..BUF_SIZE_PORT - 1] of byte;
      RB_Write     : TRB_Write;
      MutexForWR   : THandle;
      CntLost      : LongInt;
      CntByte      : LongInt;
      isError      : LongInt;
      LastError    : LongInt;
      isBusyWrite  : LongInt;
      procedure WriteInRB(buf : pByte; len : Cardinal; MaxLen : Cardinal);
    public

  end;

  TTcpPortClient = class
    private
      PortReadThr   : TThrTcpRead;    //Поток чтения данных из порта в кольцевой буфер
      PortWriteThr  : TThrTcpWrite;   //Поток записи данных в порт
      CondOut       : TCondOut;
      BufDataTmp    : array[0..BUF_SIZE_PORT + CNT_BYTE_SEP] of byte;
      BufDTTmp      : array[0..BUF_SIZE_PORT + CNT_BYTE_SEP] of TDateTime;
      currentInfo   : string;
      Socket        : TTCPBlockSocket;                              //Порт
      MutexPort     : THandle;
      isEnablePort  : boolean;
      PortName      : string;
    public
      constructor Create(Server : string; IpPort : word);
      destructor  Destroy; override;                                                 //удаление/закрытие порта
      procedure   WritePort(buf : pByte ; len : Cardinal; MaxLen : Cardinal);        //запись данных в порт
      function    ReadPort (buf : pByte ; MaxLen: Cardinal) : TResRead;              //чтение данных из порта в соответствии с ранее заданными условиями
      function    GetCntNotRead         : Cardinal;                                  //возвращает число невычитанных байтов из порта
      function    GetIsBusyWrite        : boolean;                                   //возвращает флаг занятости порта на отправку
      procedure   ResetGlRB;                                                         //сброс буферов
      function    GetCondOut            : TCondOut;                                  //возвращает набор условий
      procedure   SetCondOut(const Cond : pCondOut);                                 //задаёт набор условий
      Function    GetLostRead           : LongInt;                                  //число потеряных байтов при чтении (вследствие переполнения приёмного буфера)
      Function    GetLostWrite          : LongInt;                                  //число потеряных байтов при передаче (вследствие переполнения передающего буфера)
      Function    GetCntRead            : LongInt;                                  //число прочитанных байтов
      Function    GetCntWrite           : LongInt;                                  //число отправленных байтов
      Function    GetIsError            : boolean;                                   //статус ошибки порта (аппаратной)
      Function    GetName               : string;                                    //получение текущего имени порта
      Function    GetDescriptor         : string;                                    //описание порта
      Function    GetTimeLastRead       : LongInt;                                   //возвращает максимальную паузу между пакетами на интервале между запросами от GUI

      Function    GetLastError          : Integer;                                   //возвращает код последней ошибки соединения


  end;

  pTcpPortClient = ^TTcpPortClient;

function  TcpClientGet(Server : string; IpPort : word) : TTcpPortClient;

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


constructor TTcpPortClient.Create(Server : string; IpPort : word);
  var
    i, j    : integer;
    MutexPortTMP : THandle;
    MutexRDTMP : THandle;
    MutexWRTMP : THandle;
  begin
    inherited Create;
    isEnablePort := false;
    Socket := TTCPBlockSocket.Create;
    if (Socket <> nil) then
      begin
        try
        Socket.Connect(Server, IntToStr(IpPort));
        currentInfo   := PChar(Server + ':' + IntToStr(IpPort));
        except
        raise Exception.Create('');
        end;
      end
    else
      begin
        raise Exception.Create('');
      end;

    if Socket.LastError <> sOK then
      begin
        Socket.CloseSocket;
        Socket.Free;
        Socket := nil;
      end;

    if Socket <> nil then
      begin
        MutexPortTMP := CreateMutex(nil, false, nil);
        MutexRDTMP   := CreateMutex(nil, false, nil);
        MutexWRTMP   := CreateMutex(nil, false, nil);

        if (MutexPortTMP <> 0) and (MutexRDTMP <> 0) and (MutexWRTMP <> 0) then
          begin
            PortReadThr             := TThrTcpRead.Create(true);
            PortWriteThr            := TThrTcpWrite.Create(true);
            PortReadThr.Socket      := @Socket;
            PortWriteThr.Socket     := @Socket;

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
            PortReadThr.DeltaTimeLastReadCur  := 0;
            PortReadThr.DeltaTimeLastReadMax  := 0;
            PortReadThr.LastError := 0;
            PortWriteThr.LastError := 0;
            PortReadThr.Resume;
            PortWriteThr.Resume;
            Sleep(5);
            PortName     := Server + ':' + IntToStr(IpPort);
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


destructor TTcpPortClient.Destroy;
  begin
    isEnablePort := false;
    if PortReadThr <> nil then
      begin
        PortReadThr.Terminate;
        Sleep(10);
      end;

    if PortWriteThr <> nil then
      begin
        PortWriteThr.Terminate;
        Sleep(10);
      end;

    if Socket <> nil then
    begin
      try
        Socket.CloseSocket;
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

    if Socket <> nil then
      FreeAndNil(Socket);

    inherited Destroy;
  end;

function TTcpPortClient.GetIsError : boolean;
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


Function TTcpPortClient.GetLostRead : LongInt;                          //число потеряных байтов при чтении
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

Function TTcpPortClient.GetLastError : Integer;
  var res : integer;
  begin
    if not isEnablePort then
      begin
        result := 123456789;
        exit;
      end;

    res := 0;

    if PortReadThr <> nil then
      res := AtomicRead(PortReadThr.LastError);

    if (res = 0) and (PortWriteThr <> nil) then
      res := AtomicRead(PortWriteThr.LastError);

    result := res;
  end;




function TTcpPortClient.GetTimeLastRead : LongInt;
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

Function TTcpPortClient.GetLostWrite : LongInt;                          //число потеряных байтов при запихивании в буфер на отправку
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


Function TTcpPortClient.GetName : string;                          //Имя порта
  begin
    if not isEnablePort then
      begin
        result := '';
        exit;
      end;

    result := PortName;
  end;

Function TTcpPortClient.GetDescriptor : string;                    //описание порта
  begin
    if not isEnablePort then
      begin
        result := '';
        exit;
      end;

    result := Socket.SocksIP;
  end;


Function  TTcpPortClient.GetCntRead : LongInt;                          //число прочитанных байтов
  var res : cardinal;
  begin
    if not isEnablePort then
      begin
        result := 0;
        exit;
      end;

    res := 0;
    if Socket <> nil then
      if PortReadThr <> nil then
        res := AtomicRead(PortReadThr.CntByte);
    result := res;
  end;

Function  TTcpPortClient.GetCntWrite : LongInt;                          //число отправленных байтов
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

function  TTcpPortClient.GetCondOut : TCondOut;                           //возвращает набор условий
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

procedure TTcpPortClient.SetCondOut(const Cond : pCondOut);                     //задаёт набор условий
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


procedure TTcpPortClient.ResetGlRB;
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


function TTcpPortClient.GetCntNotRead : Cardinal;
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



function TTcpPortClient.GetIsBusyWrite : boolean;
  begin
    if not isEnablePort then
      begin
        result := true;
        exit;
      end;
    result := AtomicRead(PortWriteThr.isBusyWrite) > 0;// .isBusy;
  end;


procedure TTcpPortClient.WritePort(buf : pByte; len : Cardinal; MaxLen : Cardinal);
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

function TTcpPortClient.ReadPort(buf : pByte; MaxLen : Cardinal) : TResRead;
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
procedure TThrTcpRead.WriteInRB(buf : pByte; dt : TDateTime; len : Cardinal; MaxLen : Cardinal);
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


procedure TThrTcpWrite.WriteInRB(buf : pByte; len : Cardinal; MaxLen : Cardinal);
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

procedure TThrTcpRead.Execute;
  var
    cntRead  : Cardinal;
    TimeRead : TDateTime;
  begin
    TimeRead := now;
    while not Terminated do
      begin
        if (Socket^ <> nil) and (AtomicRead(isError) <> 1) then
          begin
            try
            if (Socket^.LastError = 0) or (Socket^.LastError = WSAETIMEDOUT) then
              begin
                //cntRead := 0;
                //if Socket^.WaitingData > 0 then
                cntRead := Socket^.RecvBufferEx(@BufThr, SizeOf(BufThr), 100);
                if Socket^.LastError <> 0 then
                  AtomicWrite(LastError, Socket^.LastError);

                if cntRead > 0 then
                  begin
                    if cntRead > BUF_SIZE_PORT then
                      cntRead := BUF_SIZE_PORT;

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
                AtomicWrite(LastError, Socket^.LastError);
                AtomicWrite(isError, 1);
                Sleep(10);
              end;
            except
              AtomicWrite(LastError, Socket^.LastError);
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

procedure TThrTcpWrite.Execute;
  var
    i : integer;
  begin
    AtomicWrite(isBusyWrite, 0);
    while not Terminated do
      begin
        if (Socket^ <> nil) and (AtomicRead(isError) <> 1) then
          begin
            try
            if (Socket^.LastError = 0) or (Socket^.LastError = WSAETIMEDOUT) then
              begin
                //while (Port^.SendingData > 0) and not Terminated do Sleep(1);
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
                    if AtomicRead(RB_Write.Cnt) > 0 then
                      AtomicWrite(isBusyWrite, 1)
                    else
                      AtomicWrite(isBusyWrite, 0);

                    Socket^.SendBuffer(@BufThr, i);

                    if Socket^.LastError <> 0 then
                      AtomicWrite(LastError, Socket^.LastError);

                    if AtomicRead(RB_Write.Cnt) > 0 then
                      AtomicWrite(isBusyWrite, 1)
                    else
                      AtomicWrite(isBusyWrite, 0);

                    AtomicInc(CntByte, i);
                  end
                else
                  begin
                    sleep(10);
                  end;
              end
            else
              begin
                AtomicWrite(LastError, Socket^.LastError);
                AtomicWrite(isError, 1);
                AtomicWrite(isBusyWrite, 0);
                Sleep(10);
              end;
            except
              AtomicWrite(LastError, Socket^.LastError);
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

function  TcpClientGet(Server : string; IpPort : word) : TTcpPortClient;
var
  res : TTcpPortClient;
begin
  if Server = '' then
    begin
      result := nil;
      exit;
    end;

  try
    res := TTcpPortClient.Create(Server, IpPort);
  except
    res := nil;
  end;
  result := res;
end;

end.



