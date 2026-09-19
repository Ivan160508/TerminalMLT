unit ReadFile;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, Common,  SysUtils, windows;

type
  TReadFileThr = class(TThread)
  private
    fName : string;
    CntByte      : LongInt;
    isError      : LongInt;
    isTruncFile  : LongInt;
    isCancelSend : LongInt;
    isStop       : LongInt;
    buf          : pByte;
    CntReadCur   : LongInt;
    MaxLenBuf    : Cardinal;
  protected
    procedure Execute; override;

  public
    constructor Create(FileName : string; data : pByte; MaxSize : Cardinal);
    function GetCntByte : LongInt;
    function GetIsError : boolean;
    function GetIsTruncFile : boolean;

    function GetCntReadCur : LongInt;
    procedure SetIsCancelSend;
    function GetIsCancelSend : boolean;
    function GetIsStop : boolean;

    destructor  Destroy; override;
  end;

implementation

function AtomicRead(var V: LongInt): LongInt;
begin
  Result := InterlockedCompareExchange(V, 0, 0);
end;

procedure AtomicWrite(var V: LongInt; NewValue: LongInt);
begin
  InterlockedExchange(V, NewValue);
end;

destructor TReadFileThr.Destroy;
begin
  Terminate;
  SetIsCancelSend;

  if GetCurrentThreadID <> ThreadID then
    WaitFor;

  inherited Destroy;
end;

function TReadFileThr.GetCntReadCur : LongInt;
begin
  result := AtomicRead(CntReadCur);
end;


function TReadFileThr.GetIsError : boolean;
begin
  result := AtomicRead(isError) > 0;
end;

function TReadFileThr.GetIsTruncFile : boolean;
begin
  result := AtomicRead(isTruncFile) > 0;
end;



function TReadFileThr.GetCntByte : LongInt;
begin
  result := AtomicRead(CntByte);
end;

procedure TReadFileThr.SetIsCancelSend;
begin
  AtomicWrite(isCancelSend, 1);
end;

function TReadFileThr.GetIsCancelSend : boolean;
begin
  result := AtomicRead(isCancelSend) > 0;
end;

function TReadFileThr.GetIsStop : boolean;
begin
  result := AtomicRead(isStop) > 0;
end;


constructor TReadFileThr.Create(FileName : string; data : pByte; MaxSize : Cardinal);
begin
  if (data = nil) then
     raise Exception.Create('Передан нулевой указатель на буфер');
  inherited Create(true);
  fName := FileName;
  buf   := data;
  CntByte      := 0;
  isCancelSend := 0;
  isError      := 0;
  isTruncFile  := 0;
  isStop       := 0;
  MaxLenBuf    := MaxSize;
  CntReadCur   := 0;
  Start;
end;

procedure TReadFileThr.Execute;
var
  I: Cardinal;
  FileSend: file of Byte;
  IsOpen: Boolean;
  isEofFile : boolean;
begin
  i := 0;
  IsOpen := False;
  isEofFile := false;
  try
    try
      AssignFile(FileSend, FName);
      Reset(FileSend);
      IsOpen := True;

      while (not isEofFile)                and
            (not Terminated)               and
            (AtomicRead(isCancelSend) = 0) and
            (i < MaxLenBuf) do
        begin
          Read(FileSend, Buf[i]);
          Inc(i);
          AtomicWrite(CntReadCur, LongInt(I));
          isEofFile := EOF(FileSend);
        end;

    except
      AtomicWrite(isError, 1);
    end;
  finally
    if IsOpen then
    begin
      try
        CloseFile(FileSend);
      except
        AtomicWrite(isError, 1);
      end;
    end;

    if (i = MaxLenBuf) and (not isEofFile) then
      AtomicWrite(isTruncFile, 1);

    AtomicWrite(CntByte, LongInt(i));
    AtomicWrite(isStop, 1);
  end;
end;

end.

