unit Common;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, synaser;


Const
    COLOR_DEFAULT = $9F9F9F;
    COLOR_PUSH    = $7F7FFF;
    COLOR_PUSH_DELAY = $7F7FDF;
    COLOR_DATA_SEND       = $0080FF;
    COLOR_DATA_NO_SEND    = $000000;
    COLOR_DATA_SEND_F     = $FF7F00;
    COLOR_DATA_NO_SEND_F  = $FFFFFF;

    COLOR_OK              = $80FF80;
    COLOR_WARN            = $00FFFF;
    COLOR_ALARM           = $1010FF;
    CONFIG_FILE_NAME_XML  = 'Cfg.xml';
    CONFIG_FILE_NAME_DUMP = 'CfgDump';

    TIMEOUT_HELP          = 10;

    VERSION_MLT          = 'TerminalMLT v1.033 Test (17.08.2026)';
    EMAIL_T              = 'Ivan160508@yandex.ru';
    DONAT_MLT            = 'MIR: 2200 0117 9913 3484 GazPromBank';




const HexToIntTabl : array[0..255] of byte=(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0, 0, 0, 0,
                                            0,10,11,12,13,14,15, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0,10,11,12,13,14,15, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

const ByteToAsciiTablNP : array[0..255] of string=('','','','','','','','','','','','','','','','',
                                                   '','','','','','','','','','','','','','','','',
                                                   ' '    ,'!'    ,'"'    ,'#'    ,'$'    ,'%'    ,'&'    ,''''   ,'(',')','*','+',',','-','.','/',
                                                   '0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?',
                                                   '@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
                                                   'P','Q','R','S','T','U','V','W','X','Y','Z','[','\',']','^','_',
                                                   '`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
                                                   'p','q','r','s','t','u','v','w','x','y','z','{','|','}','~','⌂',
                                                   'А','Б','В','Г','Д','Е','Ж','З','И','Й','К','Л','М','Н','О','П',
                                                   'Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я',
                                                   'а','б','в','г','д','е','ж','з','и','й','к','л','м','н','о','п',
                                                   '░','▒','▓','│','↕','╡','╢','╖','╕','╣','║','╗','╝','╜','╛','┐',
                                                   '└','┴','┬','├','─','┼','╞','╟','╚','╔','╩','╦','╠','═','╬','╧',
                                                   '╨','╤','╥','╙','╘','╒','╓','╫','╪','┘','┌','█','▄','▌','▐','▀',
                                                   'р','с','т','у','ф','х','ц','ч','ш','щ','ъ','ы','ь','э','ю','я',
                                                   'Ё','ё','Є','є','Ї','ї','Ў','ў','°','∙','·','√','№','¤','■',' '
                                                   );


const ByteToAsciiTabl : array[0..255] of string=('[$00]','[$01]','[$02]','[$03]','[$04]','[$05]','[$06]','[$07]','[$08]','[$09]','[$0A]','[$0B]','[$0C]','[$0D]','[$0E]','[$0F]',
                                                 '[$10]','[$11]','[$12]','[$13]','[$14]','[$15]','[$16]','[$17]','[$18]','[$19]','[$1A]','[$1B]','[$1C]','[$1D]','[$1E]','[$1F]',
                                                 ' '    ,'!'    ,'"'    ,'#'    ,'$'    ,'%'    ,'&'    ,''''   ,'(',')','*','+',',','-','.','/',
                                                 '0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?',
                                                 '@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
                                                 'P','Q','R','S','T','U','V','W','X','Y','Z','[','\',']','^','_',
                                                 '`','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
                                                 'p','q','r','s','t','u','v','w','x','y','z','{','|','}','~','⌂',
                                                 'А','Б','В','Г','Д','Е','Ж','З','И','Й','К','Л','М','Н','О','П',
                                                 'Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я',
                                                 'а','б','в','г','д','е','ж','з','и','й','к','л','м','н','о','п',
                                                 '░','▒','▓','│','↕','╡','╢','╖','╕','╣','║','╗','╝','╜','╛','┐',
                                                 '└','┴','┬','├','─','┼','╞','╟','╚','╔','╩','╦','╠','═','╬','╧',
                                                 '╨','╤','╥','╙','╘','╒','╓','╫','╪','┘','┌','█','▄','▌','▐','▀',
                                                 'р','с','т','у','ф','х','ц','ч','ш','щ','ъ','ы','ь','э','ю','я',
                                                 'Ё','ё','Є','є','Ї','ї','Ў','ў','°','∙','·','√','№','¤','■',' '
                                                 );

type TItemDecodeCustom = record
  StrDecode : string[10];
end;

type
  pTBlockSerial = ^TBlockSerial;
  pByte         = ^byte;
  pTItemDecodeCustom = ^TItemDecodeCustom;

type TFilterLog     = (FL_NoFilter = 0, FL_Out = 1, FL_NoOut = 2, FL_Capture = 3);
type TDecodeMode    = (TDAscii = 0, TDHex = 1, TDDec = 2);
type TOutMode       = (TOutManual = 0, TOutClickMacros = 1, TOutPeriod = 2, TOutAfterAns = 3, TOutByteToByte = 4);
type TReadMode      = (TReadAscii = 1, TReadHex = 2, TReadDec = 4, TReadCustom = 8);
type TOutLogMode    = (TOutLogTxt = 0, TOutLogRtf = 1);
type TShowHelpMode  = (TShowHelpMacros = 0, TShowStatPort = 1);
type TStrInLog      = (TStrRx = 0, TStrTx = 1, TStrEv = 2);

type TConnect       = (TConnCom = 0, TConnTcpClient = 1, TConnTcpServer = 2);



const
  BUF_SIZE_PORT     = $400000; //65536;
  SYMBOL_ANY        = $100;
  SYMBOL_EMPT       = $200;
  MAX_PARTSIZE_SEND = 1024;  //размер блока, отправляемого в течение 30 секунд на скорости 300 бит в секунду. Для более высоких скоростей блок можно увеличивать
  CNT_BYTE_SEP      = 8;     //число байт в последовательностях
  CNT_SEC_COND      = 4;     //число последовательностей обоих типов

type TRB_Read = record
  Buf  : array[0..BUF_SIZE_PORT - 1] of byte;
  DT   : array[0..BUF_SIZE_PORT - 1] of TDateTime;
  Head : LongInt;
  Tail : LongInt;
  Cnt  : LongInt;
  end;

type TRB_Write = record
  Buf  : array[0..BUF_SIZE_PORT - 1] of byte;
  Head : LongInt;
  Tail : LongInt;
  Cnt  : LongInt;
  end;


type TStopBits = (   {:stopbit value for 1 stopbit}
                     SB1 = 0,
                     {:stopbi'','','','','','','','','','','','','','','','',
                                                 t value for 1.5 stopbit}
                     SB1andHalf = 1,
                     {:stopbit value for 2 stopbits}
                     SB2 = 2
                 );

type TParity = (PNone = 'N' , POdd = 'O', Even = 'E', Mark = 'M', PSpace = 'S');


type TResRead = record
  Cnt : Cardinal;
  DT  : TDateTime;
  end;

type TCondOut = record
  isCntByte    : boolean;                                            //разделение по числу байт
  isTimeOut    : boolean;                                            //разделение по временному интервалу между байтами

  CntByte      : Cardinal;                                           //число байт в подпакете при разбиении
  TimeOut      : Cardinal;                                           //временной промежуток между байтами для разделения на подпакеты

  isAfter  : array[1..CNT_SEC_COND] of boolean;                      //флаг для разбиения на подпакеты после последовательности
  isBefore : array[1..CNT_SEC_COND] of boolean;                      //флаг для разбиения на подпакеты перед последовательностью

  CntA : array[1..CNT_SEC_COND] of byte;                             //число задействованных байтов в постпоследовательности
  CntB : array[1..CNT_SEC_COND] of byte;                             //число задействованных байтов в предпоследовательности

  buf_after  : array[1..CNT_SEC_COND, 0..CNT_BYTE_SEP - 1] of word;  //постпоследовательность
  buf_before : array[1..CNT_SEC_COND, 0..CNT_BYTE_SEP - 1] of word;  //предпоследовательность

end;

type pCondOut = ^TCondOut;



function CheckHexKey(Key : Char) : Char;
function StrToHex(str : string) : byte;
function SetFirstItemInListString(Item : string; sl: TStringList) : TStringList;
function BoolToString(const Value: Boolean): string;
function GetDateTimeStr(dt : TDateTime; isDateAdd :boolean) : string;
function GetDateTimeStrForNameFile(dt : TDateTime) : string;


implementation


function GetDateTimeStr(dt : TDateTime; isDateAdd : boolean) : string;
var
  res : string;
begin
  if isDateAdd then
    DateTimeToString(res, '[yyyy.mm.dd hh:nn:ss.zzz]', dt)
  else
    DateTimeToString(res, '[hh:nn:ss.zzz]', dt);
  result := res;
end;

function GetDateTimeStrForNameFile(dt : TDateTime) : string;
var
  res : string;
begin
  DateTimeToString(res, 'yyyy_mm_dd hh_nn_ss_zzz', dt);
  result := res;
end;


function BoolToString(const Value: Boolean): string;
begin
  if Value then
    Result := 'true'
  else
    Result := 'false';
end;

function CheckHexKey(Key : Char) : Char;
begin
  if not (Key in ['0'..'9', 'A'..'F', 'a'..'f', #8]) then
    Result := #0
  else
    Result := Key;
end;


function HexToInt(Hex: Char) : byte;
  begin
    result := HexToIntTabl[Ord(Hex)];
  end;

function StrToHex(str : string) : byte;
var
  S: string[3];
begin
  if length(str) = 2 then
    begin
      S := str;
      result:= HexToInt(S[1]) * 16 + HexToInt(S[2]);
    end
  else if length(str) = 1 then
    begin
      S := str;
      result:= HexToInt(S[1]);
    end
  else
    result := 0;
end;

function SetFirstItemInListString(Item : string; sl: TStringList) : TStringList;
  var
    res : TStringList;
    i   : integer;
  begin
    try
      res := TStringList.Create;
      res.Clear;
      for i := 0 to sl.Count - 1 do
        if Item = sl.Strings[i] then
          res.Add(Item);
      for i := 0 to sl.Count - 1 do
        if Item <> sl.Strings[i] then
          res.Add(sl.Strings[i]);

      sl.Clear;
      for i := 0 to res.Count - 1 do
        sl.Add(res.Strings[i]);
    finally
      res.Free;
    end;

    result := sl;
  end;

end.


