unit TMBOld;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;


type
  TTypeSendMode = (SendASCII = 0, SendHEX = 1, SendDEC = 2);

type
  TTypeReadMode = (ReadASCII = 0, ReadHEX = 1, ReadDEC = 2, ReadCUSTOM = 3);

type
TPresetTMB = record
  NameList: string[151];
  CmdData: array[1..48] of string[251];
  CmdName: array[1..48] of string[51];
  NameHelp: array[1..48, 1..12] of string[151];
  TailStr: string[101];
  CmdStr: string[251];
  FiltrStr: array[1..20] of string[251];
  AutoClrStrHEX: string[251];
  AutoClrStrASCII: string[251];
  AutoExpStr: string[251];
  NStr4: string[251];
  NStr5: string[251];
  NStr6: string[251];
  NStr7: string[251];
  NStr8: string[251];
  NStr9: string[251];
  NStr10: string[251];
  NStr11: string[251];
  NStr12: string[251];
  NStr13: string[251];
  NStr14: string[251];
  NStr15: string[251];
  NStr16: string[251];
  NStr17: string[251];
  NStr18: string[251];
  NStr19: string[251];
  NStr20: string[251];

  Marker: Cardinal;
  TimeOutAnsRX: Cardinal;
  CntExpBytes: Cardinal;
  SepBytes: Cardinal;
  SepSymbol: Cardinal;
  TimeAutoExpanNoData: Cardinal;
  CntClrBytesLog: Cardinal;

  SepBefSymbol1: Cardinal;

  SepBefSymbol2: Cardinal;

  HK1_4: Cardinal;
  HK5_8: Cardinal;
  HK9_12: Cardinal;
  HK13_16: Cardinal;
  HK17_20: Cardinal;
  HK21_24: Cardinal;
  HK25_28: Cardinal;
  HK29_32: Cardinal;
  HK33_36: Cardinal;
  HK37_40: Cardinal;
  HK41_44: Cardinal;
  HK45_48: Cardinal;
  J01_02: Cardinal;
  J03_04: Cardinal;
  J05_06: Cardinal;
  J07_08: Cardinal;
  J09_10: Cardinal;
  J11_12: Cardinal;
  J13_14: Cardinal;
  J15_16: Cardinal;
  J17_18: Cardinal;
  J19_20: Cardinal;
  J21_22: Cardinal;
  J23_24: Cardinal;
  J25_26: Cardinal;
  J27_28: Cardinal;
  J29_30: Cardinal;
  J31_32: Cardinal;
  J33_34: Cardinal;
  J35_36: Cardinal;
  J37_38: Cardinal;
  J39_40: Cardinal;
  J41_42: Cardinal;
  J43_44: Cardinal;
  J45_46: Cardinal;
  J47_48: Cardinal;

  SepSymbol2: Cardinal;
  SeqSymbols1_4: Cardinal;
  SeqSymbols1_3: Cardinal;
  SeqSymbols1_2: Cardinal;
  SeqSymbols2_4: Cardinal;
  SeqSymbols2_3: Cardinal;
  SeqSymbols2_2: Cardinal;
  NParam53: Cardinal;
  NParam54: Cardinal;
  NParam55: Cardinal;
  NParam56: Cardinal;
  NParam57: Cardinal;
  NParam58: Cardinal;
  NParam59: Cardinal;
  NParam60: Cardinal;

  SendMode: TTypeSendMode;
  ReadMode: TTypeReadMode;
  isVisTime: Boolean;
  isVisCnt: Boolean;

  isSep0D: Boolean;
  isSep0A: Boolean;
  isSep00: Boolean;
  isSep0D0A: Boolean;
  isSepTime: Boolean;
  isSepBytes: Boolean;
  isSepSymbol: Boolean;
  isResetFifo: Boolean;
  isAutoExpandNoInData: Boolean;
  isAutoExpStr: Boolean;
  isCntExpBytes: Boolean;
  isExpWin: Boolean;
  isFileSendOK: Boolean;
  isAutoClrStrHEX: Boolean;
  isAutoClrStrASCII: Boolean;
  isClrLogWhSend: Boolean;

  isAddASCII: Boolean;
  isAddHEX: Boolean;
  isADDTX: Boolean;
  isAddRX: Boolean;
  isAddIgnFlt: Boolean;
  isShowMode: Boolean;

  isSepBefSymbol1: Boolean;
  isSepBefSymbol2: Boolean;
  isUseHotKey: Boolean;
  isSepSymbol2: Boolean;
  isSepAftSeq1_4: Boolean;
  isSepAftSeq1_3: Boolean;
  isSepAftSeq1_2: Boolean;
  isSepAftSeq2_4: Boolean;
  isSepAftSeq2_3: Boolean;
  isSepAftSeq2_2: Boolean;
  isVisPort: Boolean;
  isVisDir: Boolean;
  isAddDec: Boolean;
  isAddCust: Boolean;
  isFlag41: Boolean;
  isFlag42: Boolean;
  isFlag43: Boolean;
  isFlag44: Boolean;
  isFlag45: Boolean;
  isFlag46: Boolean;
  isFlag47: Boolean;
  isFlag48: Boolean;
  isFlag49: Boolean;
  isFlag50: Boolean;
  isFlag51: Boolean;
  isFlag52: Boolean;
  isFlag53: Boolean;
  isFlag54: Boolean;
  isFlag55: Boolean;
  isFlag56: Boolean;
  isFlag57: Boolean;
  isFlag58: Boolean;
  isFlag59: Boolean;
  isFlag60: Boolean;
end;


implementation

end.

