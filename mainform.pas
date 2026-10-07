unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls, SendFileForm, DateUtils, FormSelectPreset,
  StdCtrls, ComCtrls, comport, RichMemo, common, LazUTF8,  Clipbrd,  Windows, FormSendMode, FormNewLogFile,
  FormSetLog, FormSetColors, readfile, formdecodecustom, formoldcmd, FormMacrosEdit, TMBOld, FormAbout, tcpportclient, tcpportserver, LCLProc;

type

  { TFormMain }

  TFormMain = class(TForm)
    BtnMacros10: TButton;
    BtnMacros11: TButton;
    BtnMacros12: TButton;
    BtnMacros13: TButton;
    BtnMacros14: TButton;
    BtnMacros15: TButton;
    BtnMacros16: TButton;
    BtnMacros17: TButton;
    BtnMacros18: TButton;
    BtnMacros19: TButton;
    BtnMacros2: TButton;
    BtnMacros20: TButton;
    BtnMacros21: TButton;
    BtnMacros22: TButton;
    BtnMacros23: TButton;
    BtnMacros24: TButton;
    BtnMacros25: TButton;
    BtnMacros26: TButton;
    BtnMacros27: TButton;
    BtnMacros28: TButton;
    BtnMacros29: TButton;
    BtnMacros3: TButton;
    BtnMacros30: TButton;
    BtnMacros31: TButton;
    BtnMacros32: TButton;
    BtnMacros33: TButton;
    BtnMacros34: TButton;
    BtnMacros35: TButton;
    BtnMacros36: TButton;
    BtnMacros37: TButton;
    BtnMacros38: TButton;
    BtnMacros39: TButton;
    BtnMacros4: TButton;
    BtnMacros40: TButton;
    BtnMacros41: TButton;
    BtnMacros42: TButton;
    BtnMacros43: TButton;
    BtnMacros44: TButton;
    BtnMacros45: TButton;
    BtnMacros46: TButton;
    BtnMacros47: TButton;
    BtnMacros48: TButton;
    BtnMacros49: TButton;
    BtnMacros5: TButton;
    BtnMacros50: TButton;
    BtnMacros51: TButton;
    BtnMacros52: TButton;
    BtnMacros53: TButton;
    BtnMacros54: TButton;
    BtnMacros55: TButton;
    BtnMacros56: TButton;
    BtnMacros57: TButton;
    BtnMacros58: TButton;
    BtnMacros59: TButton;
    BtnMacros6: TButton;
    BtnMacros60: TButton;
    BtnMacros61: TButton;
    BtnMacros62: TButton;
    BtnMacros63: TButton;
    BtnMacros64: TButton;
    BtnMacros7: TButton;
    BtnMacros8: TButton;
    BtnMacros9: TButton;
    BtnConnect: TButton;
    BtnPort: TButton;
    BtnCopyLog: TButton;
    BtnClearLog: TButton;
    BtnLineSep: TButton;
    BtnCmdList: TButton;
    BtnSend: TButton;
    BtnSendFile: TButton;
    BtnUpdPort: TButton;
    BtnPauseLog: TButton;
    BtnWrite: TButton;
    BTModeOutLOg: TButton;
    BtnMacros1: TButton;
    CBAfter1: TCheckBox;
    CBAfter2: TCheckBox;
    CBAfter3: TCheckBox;
    CBAfter4: TCheckBox;
    CBAutoConnect: TCheckBox;
    CBBef1: TCheckBox;
    CBBef2: TCheckBox;
    CBBef3: TCheckBox;
    CBBef4: TCheckBox;
    CBBits: TComboBox;
    CBCntByte: TCheckBox;
    CBComParity: TComboBox;
    CBHF: TCheckBox;
    CBPortBaudRate: TComboBox;
    CBPortM: TCheckBox;
    CBPortB7: TCheckBox;
    CBPortB8: TCheckBox;
    CBPortB9: TCheckBox;
    CBPortB10: TCheckBox;
    CBPortB11: TCheckBox;
    CBPortB12: TCheckBox;
    CBPortB13: TCheckBox;
    CBPortB14: TCheckBox;
    CBPortB15: TCheckBox;
    CBPortB16: TCheckBox;
    CBPortA1: TCheckBox;
    CBPortA2: TCheckBox;
    CBPortB1: TCheckBox;
    CBPortB2: TCheckBox;
    CBPortB3: TCheckBox;
    CBPortB4: TCheckBox;
    CBPortB5: TCheckBox;
    CBPortB6: TCheckBox;
    CBPortName: TComboBox;
    CBSF: TCheckBox;
    CBStopBits: TComboBox;
    CBTimeOut: TCheckBox;
    CHCnt: TCheckBox;
    CHDir: TCheckBox;
    CBSkipReps: TCheckBox;
    CBLoop: TCheckBox;
    CHMode: TCheckBox;
    CHTime: TCheckBox;
    CHPort: TCheckBox;
    CBCondFilter: TComboBox;
    EdtPortS: TEdit;
    EdtServerC: TEdit;
    EdtMacros25: TEdit;
    EdtMacros34: TEdit;
    EdtMacros35: TEdit;
    EdtMacros36: TEdit;
    EdtMacros37: TEdit;
    EdtMacros38: TEdit;
    EdtMacros39: TEdit;
    EdtMacros40: TEdit;
    EdtMacros41: TEdit;
    EdtMacros42: TEdit;
    EdtMacros43: TEdit;
    EdtMacros26: TEdit;
    EdtMacros44: TEdit;
    EdtMacros45: TEdit;
    EdtMacros46: TEdit;
    EdtMacros47: TEdit;
    EdtMacros48: TEdit;
    EdtMacros49: TEdit;
    EdtMacros50: TEdit;
    EdtMacros51: TEdit;
    EdtMacros52: TEdit;
    EdtMacros53: TEdit;
    EdtMacros27: TEdit;
    EdtMacros54: TEdit;
    EdtMacros55: TEdit;
    EdtMacros56: TEdit;
    EdtMacros57: TEdit;
    EdtMacros58: TEdit;
    EdtMacros59: TEdit;
    EdtMacros60: TEdit;
    EdtMacros61: TEdit;
    EdtMacros62: TEdit;
    EdtMacros63: TEdit;
    EdtMacros28: TEdit;
    EdtMacros64: TEdit;
    EdtMacros29: TEdit;
    EdtMacros30: TEdit;
    EdtMacros31: TEdit;
    EdtMacros32: TEdit;
    EdtMacros33: TEdit;
    EdtMacros9: TEdit;
    EdtMacros18: TEdit;
    EdtMacros19: TEdit;
    EdtMacros20: TEdit;
    EdtMacros21: TEdit;
    EdtMacros22: TEdit;
    EdtMacros23: TEdit;
    EdtMacros24: TEdit;
    EdtMacros10: TEdit;
    EdtMacros11: TEdit;
    EdtMacros12: TEdit;
    EdtMacros13: TEdit;
    EdtMacros14: TEdit;
    EdtMacros15: TEdit;
    EdtMacros16: TEdit;
    EdtMacros17: TEdit;
    EdtMacros6: TEdit;
    EdtMacros7: TEdit;
    EdtMacros8: TEdit;
    EdtMacros5: TEdit;
    EdtMacros4: TEdit;
    EdtMacros3: TEdit;
    EdtMacros2: TEdit;
    EdtMacros1: TEdit;
    EdtA1_1: TEdit;
    EdtA1_2: TEdit;
    EdtA1_3: TEdit;
    EdtA1_4: TEdit;
    EdtA1_5: TEdit;
    EdtA1_6: TEdit;
    EdtA1_7: TEdit;
    EdtA1_8: TEdit;
    EdtA2_1: TEdit;
    EdtA2_2: TEdit;
    EdtA2_3: TEdit;
    EdtA2_4: TEdit;
    EdtA2_5: TEdit;
    EdtA2_6: TEdit;
    EdtA2_7: TEdit;
    EdtA2_8: TEdit;
    EdtA3_1: TEdit;
    EdtA3_2: TEdit;
    EdtA3_3: TEdit;
    EdtA3_4: TEdit;
    EdtA3_5: TEdit;
    EdtA3_6: TEdit;
    EdtA3_7: TEdit;
    EdtA3_8: TEdit;
    EdtA4_1: TEdit;
    EdtA4_2: TEdit;
    EdtA4_3: TEdit;
    EdtA4_4: TEdit;
    EdtA4_5: TEdit;
    EdtA4_6: TEdit;
    EdtA4_7: TEdit;
    EdtA4_8: TEdit;
    EdtB1_1: TEdit;
    EdtB1_2: TEdit;
    EdtB1_3: TEdit;
    EdtB1_4: TEdit;
    EdtB1_5: TEdit;
    EdtB1_6: TEdit;
    EdtB1_7: TEdit;
    EdtB1_8: TEdit;
    EdtB2_1: TEdit;
    EdtB2_2: TEdit;
    EdtB2_3: TEdit;
    EdtB2_4: TEdit;
    EdtB2_5: TEdit;
    EdtB2_6: TEdit;
    EdtB2_7: TEdit;
    EdtB2_8: TEdit;
    EdtB3_1: TEdit;
    EdtB3_2: TEdit;
    EdtB3_3: TEdit;
    EdtB3_4: TEdit;
    EdtB3_5: TEdit;
    EdtB3_6: TEdit;
    EdtB3_7: TEdit;
    EdtB3_8: TEdit;
    EdtB4_1: TEdit;
    EdtB4_2: TEdit;
    EdtB4_3: TEdit;
    EdtB4_4: TEdit;
    EdtB4_5: TEdit;
    EdtB4_6: TEdit;
    EdtB4_7: TEdit;
    EdtB4_8: TEdit;
    EdtCntByte: TEdit;
    EdtNameList: TEdit;
    EdtPortC: TEdit;
    EdtServerS: TEdit;
    EdtSubString: TEdit;
    EdtCli: TEdit;
    EdtTail: TEdit;
    EdtTimeOut: TEdit;
    GBApn: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LblSendCod: TLabel;
    LblSendMode: TLabel;
    LblSendMode1: TLabel;
    LBCommands: TListBox;
    LPortB: TLabel;
    LPortsA: TLabel;
    MainMenu: TMainMenu;
    MColors: TMenuItem;
    MAddPorts: TMenuItem;
    MAddPorts2: TMenuItem;
    MAddPorts16: TMenuItem;
    MCmdListMode: TMenuItem;
    MByteCounters: TMenuItem;
    MAdd: TMenuItem;
    MAsciiTable: TMenuItem;
    MAbout: TMenuItem;
    LoadCfgDialog: TOpenDialog;
    MCustomDecode: TMenuItem;
    MCfgTmb: TMenuItem;
    MSelPresets: TMenuItem;
    MLogStopBin: TMenuItem;
    MLogPauseBin: TMenuItem;
    MLogStartBin: TMenuItem;
    MLogNewBin: TMenuItem;
    MLogBin: TMenuItem;
    MLogNewTxt: TMenuItem;
    OpenFileDialog: TOpenDialog;
    Panel1: TPanel;
    PnlBtSend: TPanel;
    PnlStatistics: TPanel;
    RBTcpC: TRadioButton;
    RBCom: TRadioButton;
    RBStat: TRadioButton;
    RBHelp: TRadioButton;
    RBTcpS: TRadioButton;
    SaveCfgDialog: TSaveDialog;
    StReadUTF8: TStaticText;
    STWorkTime: TStaticText;
    STSendAscii: TStaticText;
    STSendDec: TStaticText;
    STSendHex: TStaticText;
    STTextLog: TStaticText;
    STBinLog: TStaticText;
    ST_NoDataReadMS: TStaticText;
    ST_CntPacketWrite: TStaticText;
    ST_CntLostTXBytes: TStaticText;
    ST_CntOutTXBytes: TStaticText;
    ST_CntSendTXBytes: TStaticText;
    ST_CntPortREconnect: TStaticText;
    ST_EmptyLine: TStaticText;
    ST_CntLostRXBytes: TStaticText;
    ST_CntInBufRXBytes: TStaticText;
    ST_CntPacketRead: TStaticText;
    ST_CntSubStrPackets: TStaticText;
    ST_CntReadRXBytes: TStaticText;
    ST_CntOutRXBytes: TStaticText;
    TimerConvertXML: TTimer;
    TimerPeriodSend: TTimer;
    TmrCheckStatus: TTimer;
    TmrUpdStatistics: TTimer;
    TMAddLog: TMemo;
    TMMainLog: TMemo;
    MHelpEdit: TMemo;
    MHelp: TMemo;
    MNumberGenerators: TMenuItem;
    MFilesCompare: TMenuItem;
    MPacketFiltering: TMenuItem;
    MParserTEXT: TMenuItem;
    MParserHex: TMenuItem;
    MPacketGenerator: TMenuItem;
    MUtilites: TMenuItem;
    MLogSettings: TMenuItem;
    MSettings: TMenuItem;
    MLogStopTxt: TMenuItem;
    MLogPauseTxt: TMenuItem;
    MLogStartTxt: TMenuItem;
    MLogTxt: TMenuItem;
    MenuPreset: TMenuItem;
    MPreSetLoad: TMenuItem;
    MPreSetSave: TMenuItem;
    MPreSetSaveAs: TMenuItem;
    PnlAdd: TPanel;
    PnlCtrlSendRead: TPanel;
    PnlLineSep: TPanel;
    PnlLogStat: TPanel;
    PnlPort: TPanel;
    PnlStat: TPanel;
    PnlAddPorts: TPanel;
    PnlLog: TPanel;
    PnlMacros: TPanel;
    PnlCtrlLog: TPanel;
    RBCmd: TRadioButton;
    RBName: TRadioButton;
    RMAddLog: TRichMemo;
    RMMainLog: TRichMemo;
    STNumList: TStaticText;
    STPeriodSend: TStaticText;
    STReadHex: TStaticText;
    STReadDec: TStaticText;
    StReadCustom: TStaticText;
    STOutMode: TStaticText;
    STReadAscii: TStaticText;
    STTime: TStaticText;
    STNameList: TStaticText;
    TmrTimeStamp: TTimer;
    TmrClearHelp: TTimer;
    TmrAutoConnect: TTimer;
    TmrReadPort: TTimer;
    ToggleEdtMacros: TToggleBox;
    UpChangeList: TUpDown;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    procedure BTModeOutLOgClick(Sender: TObject);
    procedure BtnClearLogClick(Sender: TObject);
    procedure BtnCmdListClick(Sender: TObject);
    procedure BtnCopyLogClick(Sender: TObject);
    procedure BtnMacrosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure BtnMacrosClick(Sender: TObject);
    procedure BtnConnectClick(Sender: TObject);
    procedure BtnLineSepClick(Sender: TObject);
    procedure BtnPauseLogClick(Sender: TObject);
    procedure BtnPortClick(Sender: TObject);
    procedure BtnReadClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure BtnSendFileClick(Sender: TObject);
    procedure BtnSendKeyPress(Sender: TObject; var Key: char);
    procedure BtnSendMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BtnUpdPortClick(Sender: TObject);
    procedure BtnWriteClick(Sender: TObject);
    procedure CBAfter1Click(Sender: TObject);
    procedure CBAfter2Click(Sender: TObject);
    procedure CBAfter3Click(Sender: TObject);
    procedure CBAfter4Click(Sender: TObject);
    procedure CBAutoConnectChange(Sender: TObject);
    procedure CBAutoConnectClick(Sender: TObject);
    procedure CBBef1Click(Sender: TObject);
    procedure CBBef2Click(Sender: TObject);
    procedure CBBef3Click(Sender: TObject);
    procedure CBBef4Click(Sender: TObject);
    procedure CBCntByteClick(Sender: TObject);
    procedure CBCondFilterChange(Sender: TObject);
    procedure CBEmptLineClick(Sender: TObject);
    procedure CBLoopChange(Sender: TObject);
    procedure CBLoopClick(Sender: TObject);
    procedure CBPortBaudRateKeyPress(Sender: TObject; var Key: char);
    procedure CBSkipRepsClick(Sender: TObject);
    procedure CBTimeOutClick(Sender: TObject);
    procedure CHCntClick(Sender: TObject);
    procedure CHDirClick(Sender: TObject);
    procedure CHModeClick(Sender: TObject);
    procedure CHPortClick(Sender: TObject);
    procedure CHTimeClick(Sender: TObject);
    procedure ConnectClick(Sender: TObject);
    procedure EdtCliChange(Sender: TObject);
    procedure EdtCliKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdtCntByteChange(Sender: TObject);
    procedure EdtCntByteClick(Sender: TObject);
    procedure EdtMacrosDblClick(Sender: TObject);
    procedure EdtMacrosChange(Sender: TObject);
    procedure EdtNameListChange(Sender: TObject);
    procedure EdtMacrosClick(Sender: TObject);
    procedure EdtPortCChange(Sender: TObject);
    procedure EdtPortSChange(Sender: TObject);
    procedure EdtServerCChange(Sender: TObject);
    procedure EdtServerSChange(Sender: TObject);
    procedure EdtSubStringChange(Sender: TObject);
    procedure EdtTailChange(Sender: TObject);
    procedure EdtTimeOutChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LBCommandsClick(Sender: TObject);
    procedure LBCommandsDblClick(Sender: TObject);
    procedure MAboutClick(Sender: TObject);
    procedure MCfgTmbClick(Sender: TObject);
    procedure MColorsClick(Sender: TObject);
    procedure MCustomDecodeClick(Sender: TObject);
    procedure MHelpEditChange(Sender: TObject);
    procedure MHelpEditClick(Sender: TObject);
    procedure MHelpKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MHelpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MLogNewBinClick(Sender: TObject);
    procedure MLogNewTxtClick(Sender: TObject);
    procedure MLogPauseBinClick(Sender: TObject);
    procedure EdtByteCondChange(Sender: TObject);

    procedure MLogPauseTxtClick(Sender: TObject);
    procedure MLogSettingsClick(Sender: TObject);
    procedure MLogStartBinClick(Sender: TObject);
    procedure MLogStartTxtClick(Sender: TObject);
    procedure MLogStopBinClick(Sender: TObject);
    procedure MLogStopTxtClick(Sender: TObject);
    procedure MPortSettingsClick(Sender: TObject);
    procedure MPreSetLoadClick(Sender: TObject);
    procedure MPreSetSaveAsClick(Sender: TObject);
    procedure MPreSetSaveClick(Sender: TObject);
    procedure MSelPresetsClick(Sender: TObject);
    procedure PnlLineSepClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure PnlLogStatResize(Sender: TObject);
    procedure PnlMacrosClick(Sender: TObject);
    procedure PnlMacrosResize(Sender: TObject);
    procedure RBComChange(Sender: TObject);
    procedure RBComClick(Sender: TObject);
    procedure RBHelpClick(Sender: TObject);
    procedure RBStatClick(Sender: TObject);
    procedure RBTcpCClick(Sender: TObject);
    procedure RBTcpSClick(Sender: TObject);
    procedure SettingsClick(Sender: TObject);
    procedure RBCmdChange(Sender: TObject);
    procedure RBNameClick(Sender: TObject);
    procedure STBinLogDblClick(Sender: TObject);
    procedure STNameListClick(Sender: TObject);
    procedure STNumListClick(Sender: TObject);
    procedure STOutModeClick(Sender: TObject);
    procedure STOutModeDblClick(Sender: TObject);
    procedure STReadAsciiClick(Sender: TObject);
    procedure STEditMacrosClick(Sender: TObject);
    procedure StReadCustomClick(Sender: TObject);
    procedure StReadCustomDblClick(Sender: TObject);
    procedure STReadDecClick(Sender: TObject);
    procedure STReadHexClick(Sender: TObject);
    procedure StReadUTF8Click(Sender: TObject);
    procedure STSendAsciiClick(Sender: TObject);
    procedure STSendDecClick(Sender: TObject);
    procedure STSendHexClick(Sender: TObject);
    procedure STTextLogDblClick(Sender: TObject);
    procedure ST_EmptyLineClick(Sender: TObject);
    procedure TimerClrHelpTimer(Sender: TObject);
    procedure TimerConvertXMLTimer(Sender: TObject);
    procedure TimerPeriodSendTimer(Sender: TObject);
    procedure TMAddLogChange(Sender: TObject);
    procedure TmrCheckStatusTimer(Sender: TObject);
    procedure TmrAutoConnectTimer(Sender: TObject);
    procedure TmrClearHelpTimer(Sender: TObject);
    procedure TmrReadPortTimer(Sender: TObject);
    procedure TmrTimeStampTimer(Sender: TObject);
    procedure TBModeOutLogChange(Sender: TObject);
    procedure TBModeOutLogClick(Sender: TObject);
    procedure TmrUpdStatisticsTimer(Sender: TObject);
    procedure ToggleEdtMacrosChange(Sender: TObject);
    procedure ToggleEdtMacrosClick(Sender: TObject);
    procedure UpChangeListClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private

  public

  end;


const
  VCFG             = 'V1_';
  MAX_CNT_LIST     = 100;
  CNT_MACROS       = 64;
  MAX_CNT_LAST_CMD = 100;
  MAX_CNT_STR_XML  = 200000;
  MAX_CNT_BAUDRATES = 50;

type TPreset = record
  IP_C           : string[254];
  IPPortC             : word;
  IP_S           : string[254];
  IPPortS             : word;
  BaudRate           : Cardinal;
  BaudRateS          : Array[0..MAX_CNT_BAUDRATES - 1] of Cardinal;
  bits               : integer;
  Parity             : TParity;
  StopBits           : TStopBits;
  softflow           : boolean;
  hardflow           : boolean;
  isAutoConnect      : boolean;
  FilterStr          : string[255];
  CondFilter         : TFilterLog;
  isSkipReps         : boolean;
  isAutoScroll       : boolean;
  CondOut            : TCondOut;
  CmdStr             : string[255];
  LastCmdList        : array[0..MAX_CNT_LAST_CMD - 1] of string[255];
  isShowPort         : boolean;
  isShowTime         : boolean;
  isShowCnt          : boolean;
  isShowMode         : boolean;
  isShowDir          : boolean;
  isInsertEmptLine   : boolean;
  DecodeMode         : TDecodeMode;

  OutMode            : TOutMode;
  PeriodSend         : Cardinal;

  ReadMode           : byte;//TReadMode;
  OutLogMode         : TOutLogMode;
  ShowHelpMode       : TShowHelpMode;
  TailStr            : string[255];
  MacrosCmd          : array[1..CNT_MACROS] of string[255];
  MacrosName         : array[1..CNT_MACROS] of string[255];
  MacrosHelp         : array[1..CNT_MACROS] of string[255];
  ItCustDecode       : array[0..255]        of TItemDecodeCustom;
  NameMacrosList     : string[255];

  isSendPortM        : boolean;
  isSendPortA        : array[1..2]  of boolean;
  isSendPortB        : array[1..16] of boolean;

  isAlarmConnectLost : boolean;
  ColorBG_ConnectLost: TColor;
  ColorBG_TXT        : Tcolor;
  ColorBG_RTF        : Tcolor;
  ColorBG_PAUSE_TXT  : Tcolor;
  ColorBG_PAUSE_RTF  : Tcolor;

  ColorFont_TXT      : TColor;
  ColorFont_Send     : TColor;
  ColorFont_RA       : TColor;
  ColorFont_RH       : TColor;
  ColorFont_RD       : TColor;
  ColorFont_RC       : TColor;
  ColorFont_RU       : TColor;


  ColorFont_EL       : TColor;
  ColorFont_SM       : TColor;
  FontSizeLog        : byte;
  EmptyLine          : string[255];
  MaxLenLog          : Cardinal;
  IsClearLogEnter    : boolean;

  isControlPauseRX   : boolean;
  PauseRXms          : Cardinal;
  ColorPauseRX       : Tcolor;
  isDateInTimeStamp  : boolean;
  isNonPrintASCII    : boolean;

end;

type TDiagData = record
  CntStart         : Cardinal;
  CntCloseOK       : Cardinal;
end;

type TSettings = record
  NameSettings     : string[255];
  PortName         : string[255];
  NameLogBin       : String[255];
  NameLogTxt       : String[255];
  Connect          : TConnect;

  isTxBinLog       : boolean;
  isRxBinLog       : boolean;
  isTxTxtLog       : boolean;
  isRxTxtLog       : boolean;
  isEvTxtLog       : boolean;
  isAutoStartLogTxt: boolean;
  isAutoStartLogBin: boolean;
  isNewLogTxt      : boolean;
  isNewLogBin      : boolean;
  NameFolderLog    : String[255];
  NumListMacros    : byte;
  Preset           : array[1..MAX_CNT_LIST] of TPreset;
  DiagData         : TDiagData;
  CSumCfg          : Cardinal;
end;

type
  pSettings = ^TSettings;

type TModeMacros = (MM_Name = 0, MM_Command = 1);


var
  FormMain: TFormMain;
  ModeMacros       : TModeMacros;
  BtnMacros        : array[1..CNT_MACROS] of TButton;
  EdtMacros        : array[1..CNT_MACROS] of TEdit;
  isModeEditMacros : boolean;

  Port  : Pointer;



  ThrReadFile: TReadFileThr;
  CBAfter  : array[1..CNT_SEC_COND] of TCheckBox;                      //флаг для разбиения на подпакеты после последовательности
  CBBefore : array[1..CNT_SEC_COND] of TCheckBox;                      //флаг для разбиения на подпакеты перед последовательностью

  EdtBufAfter  : array[1..CNT_SEC_COND, 0..CNT_BYTE_SEP - 1] of TEdit;  //постпоследовательность
  EdtBufBefore : array[1..CNT_SEC_COND, 0..CNT_BYTE_SEP - 1] of TEdit;  //предпоследовательность

  ResRead    : TResRead;
  ResReadOld : TResRead;

  BufRead    : array[0..BUF_SIZE_PORT - 1] of byte;
  BufReadOld : array[0..BUF_SIZE_PORT - 1] of byte;

  BufWrite   : array[0..BUF_SIZE_PORT - 1] of byte;


  ConfigFile : textfile;
  TextFileLog : textfile;
  BinFileLog : file of byte;

  NumCurMacros : byte;

  Settings         : TSettings;
  TimeOutClearHelp : Cardinal;
  StrOutAscii      : string;
  StrOutHex        : string;
  StrOutDec        : string;
  StrOutCustom     : string;
  StrOutUTF        : string;
  StrAddInfo       : string;
  StrAddTmp        : string;
  StrLogOld        : string;

  StrCmd, StrTail : string;

  CntShowRxBytes : Cardinal;
  CntShowTxBytes : Cardinal;

  CntRXPackets  : Cardinal;
  CntTXPackets  : Cardinal;
  CntPortReconnect : Cardinal;

  CntMathSubstr : Cardinal;


  isPauseLog     : boolean;
  isPauseFileLogTxt : boolean;
  isPauseFileLogBin : boolean;

  isSendFileProcess : boolean;


  isLogTxt       : boolean;
  isLogBin       : boolean;
  curNameFileBinLog : string;
  curNameFileTxtLog : string;
  PauseRxMax     : Cardinal;
  isEventNoRx     : boolean;
  NumCmdInList    : Cardinal;
  CntCmdInList    : Cardinal;
  isModeListCmd   : boolean;
  isSendLoop      : BOOLEAN;
  DTStart         : TDateTime;



  /////
  TRP_i      : cardinal;
  TRP_isSubStrAscii  : boolean;
  TRP_isSubStrHex    : boolean;
  TRP_isSubStrDec    : boolean;
  TRP_isSubStrCustom : boolean;
  TRP_isOutInLog     : boolean;
  TRP_isOutLine      : boolean;
  TRP_TimeStamp      : string;


  Timestr            : string;

  XmlStr             : array[0..MAX_CNT_STR_XML] of string;
  iXmlStr, cntXmlStr : Cardinal;

implementation

{$R *.lfm}

{ TFormMain }



procedure MakeRounded(Control: TWinControl);
var
  R: TRect;
  Rgn: HRGN;
begin
  with Control do
  begin
    // Получаем прямоугольник клиентской области
    R := ClientRect;
    // Создаём регион с закруглёнными углами (радиус 20 пикселей)
    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, 10, 10);
    // Устанавливаем этот регион для окна компонента
    SetWindowRgn(Handle, rgn, True);
    // Запрашиваем перерисовку
    Invalidate;
  end;
end;

function PrepareBufToSend(buf :pByte; cmd : string; tail : string; mode : TDecodeMode) : Cardinal;
var
  i, pos, lenCmd, lenTail : Cardinal;
  len : Cardinal;
  tmp : string;
  isSpace : boolean;
begin
  pos := 0;
  if mode = TDecodeMode.TDAscii then
    begin
      tmp := cmd + tail;
      i := 0;
      pos := 0;
      len := Length(tmp);
      i := 1;
      while i <= len do
        begin
          if tmp[i] <> '$' then
            begin
              buf[pos] := Ord(tmp[i]);
              inc(pos);
              inc(i);
            end
          else if len >= (pos + 3) then
            begin
              buf[pos] := StrToHex(tmp[i+1] + tmp[i+2]);
              inc(pos);
              i := i + 3;
            end
          else
            begin
              buf[pos] := Ord(tmp[i]);
              inc(pos);
              inc(i);
            end;
        end;
    end;

  if mode = TDecodeMode.TDHex then
    begin
      cmd    := trim(cmd);
      tail   := trim(tail);

      lenCmd := Length(cmd);

      i   := 1;
      pos := 0;
      tmp := '';

      if lenCmd > 0 then
        repeat
          if (length(tmp) = 0) and (cmd[i] <> ' ') then
            tmp := tmp + cmd[i]
          else if (length(tmp) = 1) and (cmd[i] <> ' ') then
            tmp := tmp + cmd[i];

          isSpace := false;

          if i < lenCmd then
            isSpace := cmd[i + 1] = ' ';

          if (length(tmp) = 1) and (isSpace or (i = lenCmd)) then
            begin
              buf[pos] := StrToHex(tmp);
              inc(pos);
              tmp := '';
            end;

          if (length(tmp) = 2) then
            begin
              buf[pos] := StrToHex(tmp);
              inc(pos);
              tmp := '';
            end;

          inc(i);
        until i > lenCmd;

      lenTail := Length(tail);

      i   := 1;
      tmp := '';

      if lenTail > 0 then
        repeat
          if (length(tmp) = 0) and (tail[i] <> ' ') then
            tmp := tmp + tail[i]
          else if (length(tmp) = 1) and (tail[i] <> ' ') then
            tmp := tmp + tail[i];

          isSpace := false;

          if i < lenTail then
            isSpace := tail[i + 1] = ' ';


          if (length(tmp) = 1) and (isSpace or (i = lenTail)) then
            begin
              buf[pos] := StrToHex(tmp);
              inc(pos);
              tmp := '';
            end;

          if (length(tmp) = 2) then
            begin
              buf[pos] := StrToHex(tmp);
              inc(pos);
              tmp := '';
            end;

          inc(i);
        until i > lenTail;
    end;


  if mode = TDecodeMode.TDDec then
     begin
      cmd    := trim(cmd);
      tail   := trim(tail);

      lenCmd := Length(cmd);

      i   := 1;
      pos := 0;
      tmp := '';

      if lenCmd > 0 then
        repeat
          if (length(tmp) < 3) and (cmd[i] <> ' ') then
            tmp := tmp + cmd[i];
          if (length(tmp) > 0) and ((cmd[i] = ' ') or (i = lenCmd) or (length(tmp) = 3)) then
            begin
              try
                buf[pos] := StrToInt(tmp) and $FF;
              except
                buf[pos] := 0;
              end;
              inc(pos);
              tmp := '';
            end;
          inc(i);
        until i > lenCmd;

      i   := 1;
      tmp := '';

      lenTail := Length(tail);

      if lenTail > 0 then
        repeat
          if (length(tmp) < 3) and (tail[i] <> ' ') then
            tmp := tmp + tail[i];
          if (length(tmp) > 0) and ((tail[i] = ' ') or (i = lenTail) or (length(tmp) = 3)) then
            begin
              try
                buf[pos] := StrToInt(tmp) and $FF;
              except
                buf[pos] := 0;
              end;
              inc(pos);
              tmp := '';
            end;
          inc(i);
        until i > lenTail;
    end;
  result := pos;
end;


function SendDataInPort(pPort : Pointer; Connect: TConnect; Buf : pByte; len: Cardinal) : boolean;
var res : boolean;
    DstCom       : pComPort;
    DstTCPClient : pTcpPortClient;
    DstTCPServer : pTcpPortServer;

begin
  res := false;
  DstCom       := nil;
  DstTCPClient := nil;
  DstTCPServer := nil;

  case Connect of
    TConnect.TConnCom       : DstCom       := pComPort(pPort);
    TConnect.TConnTcpClient : DstTCPClient := pTcpPortClient(pPort);
    TConnect.TConnTcpServer : DstTCPServer := pTcpPortServer(pPort);
  end;

  if pPort <> nil then
    begin
      if DstCom <> nil then
        begin
          if (DstCom^ <> nil) and (len > 0) then
            begin
              if not DstCom^.GetIsBusyWrite then
                begin
                  DstCom^.WritePort(Buf, len, BUF_SIZE_PORT);
                  res := true;
                end;
            end;
        end
      else if DstTCPClient <> nil then
        begin
          if (DstTCPClient^ <> nil) and (len > 0) then
            begin
              if not DstTCPClient^.GetIsBusyWrite then
                begin
                  DstTCPClient^.WritePort(Buf, len, BUF_SIZE_PORT);
                  res := true;
                end;
            end;
        end
      else if DstTCPServer <> nil then
        begin
          if (DstTCPServer^ <> nil) and (len > 0) then
            begin
              if not DstTCPServer^.GetIsBusyWrite then
                begin
                  DstTCPServer^.WritePort(Buf, len, BUF_SIZE_PORT);
                  res := true;
                end;
            end;
        end;

      if res then
        CntShowTXBytes := CntShowTXBytes + len;

    end;
  result := res;
end;


function SendDataInComPort1(pPort : pComPort;  Buf : pByte; len: Cardinal) : boolean;
var res : boolean;
begin
  res := false;
  if (pPort^ <> nil) and (len > 0) then
    begin
      if not pPort^.GetIsBusyWrite then
        begin
          pPort^.WritePort(Buf, len, BUF_SIZE_PORT);
          CntShowTXBytes := CntShowTXBytes + len;
          res := true;
        end;
    end;
  result := res;
end;

function SendDataInTcpClient1(pClient : pTcpPortClient;  Buf : pByte; len: Cardinal) : boolean;
var res : boolean;
begin
  res := false;
  if (pClient^ <> nil) and (len > 0) then
    begin
      if not pClient^.GetIsBusyWrite then
        begin
          pClient^.WritePort(Buf, len, BUF_SIZE_PORT);
          CntShowTXBytes := CntShowTXBytes + len;
          res := true;
        end;
    end;
  result := res;
end;

function SendDataInTcpServer1(pServer : pTcpPortServer;  Buf : pByte; len: Cardinal) : boolean;
var res : boolean;
begin
  res := false;
  if (pServer^ <> nil) and (len > 0) then
    begin
      if not pServer^.GetIsBusyWrite then
        begin
          pServer^.WritePort(Buf, len, BUF_SIZE_PORT);
          CntShowTXBytes := CntShowTXBytes + len;
          res := true;
        end;
    end;
  result := res;
end;






procedure TFormMain.ConnectClick(Sender: TObject);
begin

end;

procedure TFormMain.EdtCliChange(Sender: TObject);
begin
  if Length((Sender as TEdit).Text) < 255 then
    Settings.Preset[Settings.NumListMacros].CmdStr := (Sender as TEdit).Text;
end;

Procedure ByteToByteSend;
  var i, len : integer;
  clitmp, tailtmp : string;
begin
  StrCmd  := FormMain.EdtCli.Text;
  StrTail := FormMain.EdtTail.Text;
  clitmp  := '';
  tailtmp := '';

  if StrCmd <> '' then
    begin
      len := PrepareBufToSend(@BufWrite, StrCmd,  '', Settings.Preset[Settings.NumListMacros].DecodeMode);
      case Settings.Preset[Settings.NumListMacros].DecodeMode of
        TDecodeMode.TDAscii : StrCmd := Chr(BufWrite[0]);
        TDecodeMode.TDHex   : StrCmd := IntToHex(BufWrite[0], 2) + ' ';
        TDecodeMode.TDDec   : StrCmd := Format('%03d ', [BufWrite[0]]);
      end;

      for i := 2 to len do
        begin
          case Settings.Preset[Settings.NumListMacros].DecodeMode of
            TDecodeMode.TDAscii : clitmp := clitmp + Chr(BufWrite[i - 1]);
            TDecodeMode.TDHex   : clitmp := clitmp + IntToHex(BufWrite[i - 1], 2) + ' ';
            TDecodeMode.TDDec   : clitmp := clitmp + Format('%03d ', [BufWrite[i - 1]]);
          end;
        end;
      FormMain.EdtCli.Text := clitmp;
      StrTail := '';
    end
  else if StrTail <> '' then
    begin
      len := PrepareBufToSend(@BufWrite, '',  StrTail, Settings.Preset[Settings.NumListMacros].DecodeMode);

      case Settings.Preset[Settings.NumListMacros].DecodeMode of
        TDecodeMode.TDAscii : StrTail := Chr(BufWrite[0]);
        TDecodeMode.TDHex   : StrTail := IntToHex(BufWrite[0], 2) + ' ';
        TDecodeMode.TDDec   : StrTail := Format('%03d ', [BufWrite[0]]);
      end;

      for i := 2 to len do
        begin
          case Settings.Preset[Settings.NumListMacros].DecodeMode of
            TDecodeMode.TDAscii : tailtmp := tailtmp + Chr(BufWrite[i - 1]);
            TDecodeMode.TDHex   : tailtmp := tailtmp + IntToHex(BufWrite[i - 1], 2) + ' ';
            TDecodeMode.TDDec   : tailtmp := tailtmp + Format('%03d ', [BufWrite[i - 1]]);
          end;
        end;
      FormMain.EdtTail.Text := tailtmp;
      StrCmd := '';
    end;
end;

procedure ConvertCliToSend;
var
  isBtB : boolean;
begin
  if (Settings.Preset[Settings.NumListMacros].OutMode = TOutMode.TOutAfterAns)    or
     (Settings.Preset[Settings.NumListMacros].OutMode = TOutMode.TOutClickMacros) or
     (Settings.Preset[Settings.NumListMacros].OutMode = TOutMode.TOutManual)      or
     (Settings.Preset[Settings.NumListMacros].OutMode = TOutMode.TOutPeriod) then
    begin
      StrCmd  := FormMain.EdtCli.Text;
      StrTail := FormMain.EdtTail.Text;
    end;

  if Settings.Preset[Settings.NumListMacros].OutMode = TOutMode.TOutByteToByte then
    begin
      isBtB := false;
      if Port <> nil then
        begin
          case Settings.Connect of
            TConnect.TConnCom       : if not TComPort(Port).GetIsBusyWrite       then isBtB := true;
            TConnect.TConnTcpClient : if not TTcpPortClient(Port).GetIsBusyWrite then isBtB := true;
            TConnect.TConnTcpServer : if not TTcpPortServer(Port).GetIsBusyWrite then isBtB := true;
          end;
        end;

      if isBtB then
        ByteToByteSend;
    end;

end;


procedure AddLogLine(const AText: string; AColor: TColor; StrInLog : TStrInLog);
var
  StartPos: Integer;
begin
  if isLogTxt and
     ((Settings.isRxTxtLog and (StrInLog = TStrInLog.TStrRx)) or
      (Settings.isTxTxtLog and (StrInLog = TStrInLog.TStrTx)) or
      (Settings.isEvTxtLog and (StrInLog = TStrInLog.TStrEv))) and
     not isPauseFileLogTxt then
    WriteLn(TextFileLog, AText);

  if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogTxt then
    begin
      if FormMain.TMMainLog.GetTextLen > Settings.Preset[Settings.NumListMacros].MaxLenLog then
        FormMain.TMMainLog.Clear;
      FormMain.TMMainLog.Lines.Add(Atext);
    end
  else
    begin
      if FormMain.RMMainLog.GetTextLen > Settings.Preset[Settings.NumListMacros].MaxLenLog then
        FormMain.RMMainLog.Clear;
    // 1. Вычисляем точную позицию ДО добавления текста
      StartPos := FormMain.RMMainLog.GetTextLen; // Метод GetTextLen точнее, чем Length()

    // 2. Смещаем курсор в конец и снимаем выделение
      FormMain.RMMainLog.SelStart := StartPos;
      FormMain.RMMainLog.SelLength := 0;

    // 3. Вставляем текст (он принимает текущий стандартный цвет)
      FormMain.RMMainLog.SelText := AText + sLineBreak;

    // 4. Раскрашиваем строго добавленный кусок текста
    // Внутренний счетчик символов Lazarus корректно отработает UTF-8 в UTF8Length()
      FormMain.RMMainLog.SetRangeColor(StartPos, UTF8Length(AText + sLineBreak), AColor);
      FormMain.RMMainLog.SelLength := 0;
    end;
end;

function SendPacket(pPort : Pointer; Connect: TConnect; cmd : string; tail: string) : boolean;
  var i, len : cardinal;
      res : boolean;
      isSend : boolean;
      PortName : string;
      strTmp : string;
      isUTF  : boolean;
  begin
    res := true;
    if (cmd <> '') or (tail <> '') then
      begin
        res := false;
        len := PrepareBufToSend(@BufWrite, cmd,  tail, Settings.Preset[Settings.NumListMacros].DecodeMode);
        isSend := false;

        if pPort <> nil then
          isSend := SendDataInPort(pPort, Connect, @BufWrite, len);

        if isSend then
          begin
            inc(CntTXPackets);
            StrAddInfo := '';

            if Settings.Preset[Settings.NumListMacros].isShowTime then
              StrAddInfo := GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp);
            if Settings.Preset[Settings.NumListMacros].isShowPort then
              begin
                if Port <> nil then
                  begin
                    case Settings.Connect of
                      TConnect.TConnCom       : PortName := TComPort(Port).GetName;
                      TConnect.TConnTcpClient : PortName := TTcpPortClient(Port).GetName;
                      TConnect.TConnTcpServer : PortName := TTcpPortServer(Port).GetName;
                    end;
                    StrAddInfo := Format('[%08s]', [PortName]) + StrAddInfo;
                  end;
              end;

            if Settings.Preset[Settings.NumListMacros].isShowCnt then
              StrAddInfo := StrAddInfo + Format('[%03d]', [len]);

            if Settings.Preset[Settings.NumListMacros].isShowMode then
              begin
                case Settings.Preset[Settings.NumListMacros].DEcodeMode of
                  TDecodeMode.TDAscii : StrAddInfo := StrAddInfo + '[A]';
                  TDecodeMode.TDHex   : StrAddInfo := StrAddInfo + '[H]';
                  TDecodeMode.TDDec   : StrAddInfo := StrAddInfo + '[D]';
                end;
              end;

            if Settings.Preset[Settings.NumListMacros].isShowDir then
              StrAddInfo := StrAddInfo + '< '
            else
              StrAddInfo := StrAddInfo + ' ';

            //SetString(StrTmp, PAnsiChar(@BufWrite[0]), Len);
            isUTF := false;
            strTmp := StrAddInfo;

            for i := 1 to len do
              begin
                isUTF := isUTF or (BufWrite[i - 1] > 127);
                case Settings.Preset[Settings.NumListMacros].DecodeMode of
                  TDecodeMode.TDAscii :
                    if Settings.Preset[Settings.NumListMacros].isNonPrintASCII then
                      StrAddInfo := StrAddInfo + ByteToAsciiTabl[BufWrite[i - 1]]
                    else
                      StrAddInfo := StrAddInfo + ByteToAsciiTablNP[BufWrite[i - 1]];

                  TDecodeMode.TDHex   : StrAddInfo := StrAddInfo + IntToHex(BufWrite[i - 1], 2) + ' ';
                  TDecodeMode.TDDec   : StrAddInfo := StrAddInfo + Format('%03d ', [BufWrite[i - 1]]);
                end;
                if isLogBin and Settings.isTxBinLog and not isPauseFileLogBin then
                  Write(BinFileLog, BufWrite[i-1]);
              end;

            if isUTF and (Settings.Preset[Settings.NumListMacros].DecodeMode = TDecodeMode.TDAscii) then
              begin
                StrAddInfo := strTmp;
                SetString(StrTmp, PAnsiChar(@BufWrite[0]), Len);
                StrAddInfo := StrAddInfo + StrTmp;
              end;

            AddLogLine(StrAddInfo, Settings.Preset[Settings.NumListMacros].ColorFont_Send, TStrInLog.TStrTx);
            res := true;

            if Settings.Preset[Settings.NumListMacros].IsClearLogEnter then
              begin
                FormMain.TMMainLog.Clear;
                FormMain.RMMainLog.Clear;
              end;
          end;
      end;
    result := res;
  end;



procedure SetLastCmdInList(LastCmd : string);
var
  i : integer;
  mi : integer;
  bufstr : string;
begin
  if (LastCmd <> '') and (Length(LastCmd) < 255) then
    begin
      i := 0;

      mi := MAX_CNT_LAST_CMD - 1;

      while i < mi do
        begin
          if LastCmd = Settings.Preset[Settings.NumListMacros].LastCmdList[i] then
            mi := i
          else
            inc(i);
        end;


      while i > 0 do
        begin
          Settings.Preset[Settings.NumListMacros].LastCmdList[i] := Settings.Preset[Settings.NumListMacros].LastCmdList[i-1];
          dec(i);
        end;
      Settings.Preset[Settings.NumListMacros].LastCmdList[i] := LastCmd;
    end;
end;

procedure TFormMain.EdtCliKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : integer;
  cnt : integer;
  isEnSend : boolean;
begin
  isEnSend := false;
  if (Key = 13) and (Settings.Preset[Settings.NumListMacros].OutMode <> TOutMode.TOutPeriod) then
    begin
      if Port <> nil then
        begin
          case Settings.Connect of
            TConnect.TConnCom       : isEnSend := not TComPort(Port).GetIsBusyWrite;
            TConnect.TConnTcpClient : isEnSend := not TTcpPortClient(Port).GetIsBusyWrite;
            TConnect.TConnTcpServer : isEnSend := not TTcpPortServer(Port).GetIsBusyWrite;
          end;
          if isEnSend then
            begin
              ConvertCliToSend;
              if SendPacket(@Port, Settings.Connect, StrCmd, StrTail) and (Shift <> [ssCtrl]) then
                (Sender as TEdit).Clear;
              SetLastCmdInList(StrCmd);
            end;
        end;
      Key := 0;
    end;

  if Key = 27 then
    begin
      (Sender as TEdit).Clear;
      Key := 0;
    end;

  if Key = 40 then
    begin
      Oldcmdform.LBOldCmd.Clear;
      Oldcmdform.LBOldCmd.Font.Size := Settings.Preset[Settings.NumListMacros].FontSizeLog;
      Oldcmdform.Caption := 'Previously sent packets [ ' + Settings.Preset[Settings.NumListMacros].NameMacrosList + ' ]'  ;

      cnt := 0;
      for i := 0 to MAX_CNT_LAST_CMD - 1 do
        if ((Settings.Preset[Settings.NumListMacros].LastCmdList[i] <> '') and (((Sender as TEdit).Text = '') or (Pos((Sender as TEdit).Text, Settings.Preset[Settings.NumListMacros].LastCmdList[i]) = 1))) then
          begin
            Oldcmdform.LBOldCmd.Items.Add(Settings.Preset[Settings.NumListMacros].LastCmdList[i]);
            inc(Cnt);
          end;
      if cnt > 0 then
        begin
          Oldcmdform.ShowModal;
          if Oldcmdform.isClear then
            begin
              for i := 0 to MAX_CNT_LAST_CMD - 1 do
                Settings.Preset[Settings.NumListMacros].LastCmdList[i] := '';
            end;
          (Sender as TEdit).Text := Oldcmdform.select;
        end;
      Key := 0;
    end;
end;

procedure TFormMain.EdtCntByteChange(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.EdtCntByteClick(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.EdtByteCondChange(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.EdtMacrosDblClick(Sender: TObject);
var
  nMacros : integer;
begin
  nMacros := (Sender as TEdit).Tag;
  FormEditMacros.CmdName := Settings.Preset[Settings.NumListMacros].MacrosName[nMacros];
  FormEditMacros.CmdLine := Settings.Preset[Settings.NumListMacros].MacrosCmd[nMacros];
  FormEditMacros.CmdHelp := Settings.Preset[Settings.NumListMacros].MacrosHelp[nMacros];

  (Sender as TEdit).Color:= clLime;
  FormEditMacros.ShowModal;
  Settings.Preset[Settings.NumListMacros].MacrosName[nMacros] := FormEditMacros.CmdName;
  Settings.Preset[Settings.NumListMacros].MacrosCmd[nMacros]  := FormEditMacros.CmdLine;
  Settings.Preset[Settings.NumListMacros].MacrosHelp[nMacros] := StringReplace(FormEditMacros.CmdHelp, '[$0D$0A]', #13#10, [rfReplaceAll]);

  (Sender as TEdit).Color:= clWindow;

  if ModeMacros = MM_Command then
    (Sender as TEdit).Text := Settings.Preset[Settings.NumListMacros].MacrosCmd[nMacros];

  if ModeMacros = MM_Name then
    (Sender as TEdit).Text := Settings.Preset[Settings.NumListMacros].MacrosName[nMacros];

  MHelpEdit.Text := Settings.Preset[Settings.NumListMacros].MacrosHelp[nMacros];

end;







procedure SendData;
  var
    isEnSend : boolean;
  begin
    if Port = nil then exit;

    isEnSend := false;

    if not isModeListCmd then
      begin
        case Settings.Connect of
          TConnect.TConnCom       : isEnSend := not TComPort(Port).GetIsBusyWrite;
          TConnect.TConnTcpClient : isEnSend := not TTcpPortClient(Port).GetIsBusyWrite;
          TConnect.TConnTcpServer : isEnSend := not TTcpPortServer(Port).GetIsBusyWrite;
        end;

        if isEnSend then
          begin
            ConvertCliToSend;
            SendPacket(@Port, Settings.Connect, StrCmd, StrTail);
          end;
      end
    else
      begin
        if NumCmdInList < CntCmdInList then
          begin
            StrCmd  := FormMain.LBCommands.Items[NumCmdInList];
            FormMain.LBCommands.Selected[NumCmdInList] := true;
            StrTail := FormMain.EdtTail.Text;

            case Settings.Connect of
              TConnect.TConnCom       : isEnSend := not TComPort(Port).GetIsBusyWrite;
              TConnect.TConnTcpClient : isEnSend := not TTcpPortClient(Port).GetIsBusyWrite;
              TConnect.TConnTcpServer : isEnSend := not TTcpPortServer(Port).GetIsBusyWrite;
            end;

            if isEnSend then
              begin
                if SendPacket(@Port, Settings.Connect, StrCmd, StrTail) then
                  inc(NumCmdInList);
              end;

            if isSendLoop and (NumCmdInList = CntCmdInList) then
              NumCmdInList := 0;
          end;
      end;
  end;


procedure TFormMain.BtnSendClick(Sender: TObject);
begin
  SendData;
  SetLastCmdInList(FormMain.EdtCli.Text);
end;

procedure TFormMain.BtnSendFileClick(Sender: TObject);
var
  FileSend: File of byte;
  i : Cardinal;
  isEnSend : boolean;
begin
  if ThrReadFile <> nil then
    begin
      FormSendFile.ShowModal;
      exit;
    end;

  if isSendFileProcess then
    begin
      case Settings.Connect of
        TConnect.TConnCom       : TComPort(Port).ResetGlRB;
        TConnect.TConnTcpClient : TTcpPortClient(Port).ResetGlRB;
        TConnect.TConnTcpServer : TTcpPortServer(Port).ResetGlRB;
      end;
      isSendFileProcess := false;
      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: File sending was interrupted by the user ', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
      (Sender as TButton).Caption := 'Send file';
    end
  else if OpenFileDialog.Execute then
    begin
      isEnSend := false;
      if Port <> nil then
        begin
          case Settings.Connect of
            TConnect.TConnCom       : isEnSend := not TComPort(Port).GetIsBusyWrite;
            TConnect.TConnTcpClient : isEnSend := not TTcpPortClient(Port).GetIsBusyWrite;
            TConnect.TConnTcpServer : isEnSend := not TTcpPortServer(Port).GetIsBusyWrite;
          end;
        end;

      if isEnSend then
        begin
          if ThrReadFile <> nil then
            begin
              ThrReadFile.Free;
              ThrReadFile := nil;
            end;
          ThrReadFile := TReadFileThr.create(OpenFileDialog.FileName, @BufWrite, BUF_SIZE_PORT);
          if ThrReadFile <> nil then
            begin
              AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Start read file for send ' + '"' + OpenFileDialog.FileName + '"', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
              FormSendFile.rf := @ThrReadFile;
              FormSendFile.ShowModal;
            end;
        end;
    end;
end;


procedure TFormMain.BtnMacrosMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  strtmp : string;
  NumMacros : integer;
begin
  NumMacros := (Sender as TButton).Tag;
  strtmp := StringReplace(Settings.Preset[Settings.NumListMacros].MacrosHelp[NumMacros], '[$0D$0A]', #13#10, [rfReplaceAll]);
  MHelp.Text     := strtmp;
  TimeOutClearHelp     := TIMEOUT_HELP;
  TmrClearHelp.Enabled := true;
end;

procedure TFormMain.BtnClearLogClick(Sender: TObject);
begin
  RMMainLog.Clear;
  RMAddLog.Clear;
  TMMainLog.Clear;
  TMAddLog.Clear;

end;

procedure TFormMain.BtnCmdListClick(Sender: TObject);
var
  fcmd: TextFile;
  cmd: string;
  isErrFile : boolean;
begin
  isErrFile := false;
  if not isModeListCmd then
    begin
      If OpenFileDialog.Execute then
         begin
           LBCommands.Clear;
           assignfile(fcmd, OpenFileDialog.FileName);
           try
             Reset(fcmd);
             NumCmdInList    := 0;
             CntCmdInList    := 0;

             while not Eof(fcmd) do
               begin
                 ReadLn(fcmd, cmd);
                 LBCommands.Items.Add(cmd);
                 inc(CntCmdInList);
               end;
             CloseFile(fcmd);
           except
             isErrFile := true;
           end;

           if not isErrFile then
             begin
               isModeListCmd := true;
               LBCommands.Selected[NumCmdInList] := true;
               StrCmd  := '';
               StrTail := '';
             end;
         end;
    end
  else
    begin
      isModeListCmd := false;
    end;

  LBCommands.Visible := isModeListCmd;
  CBLoop.Visible     := isModeListCmd;
  if isModeListCmd then
    (Sender as TButton).Caption := 'Macros mode'
  else
    (Sender as TButton).Caption := 'CmdList mode';

  if isErrFile then
    AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: File open ERROR' , Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);

end;

function PauseLog(isPause : boolean) : boolean;
begin
  if not isPause then
    begin

      if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogRtf then
        begin
          FormMain.RMAddLog.Clear;
          FormMain.RMAddLog.rtf := FormMain.RMMainLog.rtf;
        end
      else if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogTxt then
        begin
          FormMain.TMAddLog.Clear;
          FormMain.TMAddLog.Text := FormMain.TMMainLog.Text;
        end;

      FormMain.BtnPauseLog.Caption := '>';
    end
  else
    begin
      FormMain.BtnPauseLog.Caption := '||';
    end;

  if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogRtf then
    begin
      FormMain.RMMainLog.Visible := isPause;
      FormMain.RMAddLog.Visible  := not isPause;
    end
  else if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogTxt then
    begin
      FormMain.TMMainLog.Visible := isPause;
      FormMain.TMAddLog.Visible  := not isPause;
    end;

  result := not isPause;
end;


function SetOutLogMode(OutLogMode : TOutlogMode) : TOutlogMode;
begin
  FormMain.RMAddLog.Visible    := false;
  FormMain.TMAddLog.Visible    := false;

  FormMain.RMAddLog.Clear;
  FormMain.TMAddLog.Clear;
  FormMain.RMMainLog.Clear;
  FormMain.TMMainLog.Clear;


  if isPauseLog then
    isPauseLog := PauseLog(isPauseLog);

  if OutLogMode = TOutLogMode.TOutLogTxt then
    begin
      OutLogMode := TOutLogMode.TOutLogRtf;
      FormMain.RMMainLog.Visible   := true;
      FormMain.TMMainLog.Visible   := false;
      FormMain.BTModeOutLog.Caption:= 'TXT';
      FormMain.BTModeOutLog.Hint   := 'Switch to TXT log output mode';
    end
  else
    begin
      OutLogMode := TOutLogMode.TOutLogTxt;
      FormMain.RMMainLog.Visible   := false;
      FormMain.TMMainLog.Visible   := True;
      FormMain.BTModeOutLog.Caption:= 'RTF';
      FormMain.BTModeOutLog.Hint   := 'Switch to RTF log output mode';
    end;

  isEventNoRx := false;
  result := OutLogMode;
end;


procedure TFormMain.BTModeOutLOgClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].OutLogMode := SetOutLogMode(Settings.Preset[Settings.NumListMacros].OutLogMode);
end;

procedure TFormMain.BtnCopyLogClick(Sender: TObject);
begin
  if isPauseLog then
    begin
      if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogRtf then
        Clipboard.AsText := RMAddLog.text
      else if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogRtf then
        Clipboard.AsText := TMAddLog.text;
    end
  else
    begin
      if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogRtf then
        Clipboard.AsText := RMMainLog.text
      else if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogRtf then
        Clipboard.AsText := TMMainLog.text;
    end
end;

procedure TFormMain.BtnMacrosClick(Sender: TObject);
var
  num : integer;
begin
  num := (Sender as Tbutton).Tag;

  case Settings.Preset[Settings.NumListMacros].OutMode of
    TOutMode.TOutByteToByte,
    TOutMode.TOutAfterAns,
    TOutMode.TOutPeriod,
    TOutMode.TOutManual      : begin
                                 EdtCli.Text := Settings.Preset[Settings.NumListMacros].MacrosCmd[num];
                               end;
    TOutMode.TOutClickMacros : begin
                                 if Port <> nil then
                                   begin
                                     StrCmd  := Settings.Preset[Settings.NumListMacros].MacrosCmd[num];
                                     StrTail := EdtTail.Text;
                                     SendPacket(@Port, Settings.Connect, StrCmd, StrTail);
                                   end;
                               end;
  end;

end;

function SetStrParamCfg(nSpace : Cardinal; Tag : string; param : string) : string;
  var
    res : string;
  begin
    res := '';
    while nSpace > 0 do
      begin
        res := res + ' ';
        dec(nSpace);
      end;
    result := res + '<' + Tag + '>' + param + '</' + Tag + '>';
  end;


function GetTagValue(const S, Tag: string): string;
var
  P1, P2: Integer;
  OpenTag, CloseTag: string;
begin
  Result := '';

  OpenTag := '<' + Tag + '>';
  CloseTag := '</' + Tag + '>';

  P1 := Pos(OpenTag, S);
  if P1 = 0 then Exit;

  P1 := P1 + Length(OpenTag);

  P2 := Pos(CloseTag, S);
  if P2 = 0 then Exit;

  Result := Copy(S, P1, P2 - P1);
end;

procedure SetParam(StrCfg, nameFile : string; SDef : pSEttings);
var
  Tag     : string;
  ItemCfg : string;
  nMacros : Cardinal;
  nList   : Cardinal;
  isOK    : boolean;
  isGet   : boolean;
  i, j    : integer;
begin
  isOK  := false;
  isGet := StrCfg <> 'NO';
  if not isGet and (SDef = nil) then
    exit;

  if not isGet then
    begin
      assignfile(ConfigFile, nameFile);
      Rewrite(ConfigFile);
    end;

  Tag := 'NameSettings';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.NameSettings := Trim(GetTagValue(StrCfg, Tag));
          isOK             := true;
          Exit;
        end;
    end
  else if Settings.NameSettings <> SDef^.NameSettings then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, Settings.NameSettings);
      WriteLn(ConfigFile, ItemCfg);
    end;

  //.............................................

  Tag := VCFG + 'NameFolderLog';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.NameFolderLog := Trim(GetTagValue(StrCfg, Tag));
          isOK             := true;
          Exit;
        end;
    end
  else if Settings.NameFolderLog <> SDef^.NameFolderLog then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, Settings.NameFolderLog);
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................



  Tag := VCFG + 'IsEventsTxtLog';
    if isGet then
      begin
        if (Pos(Tag, StrCfg) > 0) and not isOK then
          begin
            Settings.isEvTxtLog := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
            isOK                 := true;
            Exit;
          end;
      end
    else if Settings.isEvTxtLog <> SDef^.isEvTxtLog then
      begin
        ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isEvTxtLog));
        WriteLn(ConfigFile, ItemCfg);
      end;
//.............................................


  Tag := VCFG + 'IsAutoStartLogTxt';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.isAutoStartLogTxt := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
          isOK                 := true;
          Exit;
        end;
    end
  else if Settings.isAutoStartLogTxt <> SDef^.isAutoStartLogTxt then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isAutoStartLogTxt));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................



  Tag := VCFG + 'IsAutoStartLogBin';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.isAutoStartLogBin := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
          isOK                 := true;
          Exit;
        end;
    end
  else if Settings.isAutoStartLogBin <> SDef^.isAutoStartLogBin then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isAutoStartLogbin));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................



  Tag := VCFG + 'IsNewLogTxt';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.isNewLogTxt := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
          isOK                 := true;
          Exit;
        end;
    end
  else if Settings.isNewLogTxt <> SDef^.isNewLogTxt then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isNewLogTxt));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................

  Tag := VCFG + 'IsNewLogBin';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.isNewLogBin := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
          isOK                 := true;
          Exit;
        end;
    end
  else if Settings.isNewLogBin <> SDef^.isNewLogBin then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isNewLogBin));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................


  Tag := VCFG + 'IsRxTxtLog';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.isRxTxtLog := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
          isOK                 := true;
          Exit;
        end;
    end
  else if Settings.isRxTxtLog <> SDef^.isRxTxtLog then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isRxTxtLog));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................


  Tag := VCFG + 'IsTxTxtLog';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.isTxTxtLog := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
          isOK                 := true;
          Exit;
        end;
    end
  else if Settings.isTxTxtLog <> SDef^.isTxTxtLog then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isTxTxtLog));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................


  Tag := VCFG + 'IsRxBinLog';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.isRxBinLog := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
          isOK                 := true;
          Exit;
        end;
    end
  else if Settings.isRxBinLog <> SDef^.isRxBinLog then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isRxBinLog));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................


  Tag := VCFG + 'IsTxBinLog';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.isTxBinLog := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
          isOK                 := true;
          Exit;
        end;
    end
  else if Settings.isTxBinLog <> SDef^.isTxBinLog then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.isTxBinLog));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................


  Tag := VCFG + 'NameLogTxt';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.NameLogTxt := Trim(GetTagValue(StrCfg, Tag));
          isOK             := true;
          Exit;
        end;
    end
  else if Settings.NameLogTxt <> SDef^.NameLogTxt then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, Settings.NameLogTxt);
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................

  Tag := VCFG + 'NameLogBin';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.NameLogBin := Trim(GetTagValue(StrCfg, Tag));
          isOK             := true;
          Exit;
        end;
    end
  else if Settings.NameLogBin <> SDef^.NameLogBin then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, Settings.NameLogBin);
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................

  Tag := VCFG + 'PortName';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.PortName := Trim(GetTagValue(StrCfg, Tag));
          isOK             := true;
          Exit;
        end;
    end
  else if Settings.PortName <> SDef^.PortName then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, Settings.PortName);
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................

  Tag := VCFG + 'TypeConnect';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.Connect := TConnect(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
          isOK := true;
          Exit;
        end;
    end
  else if Settings.Connect <> SDef^.Connect then
    begin
       ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Connect)));
       WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................


  Tag := VCFG + 'NumListMacros';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.NumListMacros := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
          isOK := true;
          Exit;
        end;
    end
  else if Settings.NumListMacros <> SDef^.NumListMacros then
    begin
       ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.NumListMacros));
       WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................

  Tag := VCFG + 'Diag_CntStart';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.DiagData.CntStart := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
          isOK := true;
          Exit;
        end;
    end
  else if Settings.NumListMacros <> SDef^.DiagData.CntStart then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.DiagData.CntStart));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................

  Tag := VCFG + 'Diag_CntCloseOK';
  if isGet then
    begin
      if (Pos(Tag, StrCfg) > 0) and not isOK then
        begin
          Settings.DiagData.CntCloseOK := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
          isOK := true;
          Exit;
        end;
    end
  else if Settings.NumListMacros <> SDef^.DiagData.CntCloseOK then
    begin
      ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.DiagData.CntCloseOK));
      WriteLn(ConfigFile, ItemCfg);
    end;
//.............................................




  for nList := 1 to MAX_CNT_LIST do
    begin
      ////////////////////////
      Tag := VCFG + Format('%.3d', [nList]) + '_IPPortClient';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].IPPortC := word(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
              isOK := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].IPPortC <> SDef^.Preset[nList].IPPortC then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].IPPortC)));
          WriteLn(ConfigFile, ItemCfg);
        end;

      Tag := VCFG + Format('%.3d', [nList]) + '_IPPortServer';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].IPPortS := word(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
              isOK := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].IPPortS <> SDef^.Preset[nList].IPPortS then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].IPPortS)));
          WriteLn(ConfigFile, ItemCfg);
        end;


      Tag := VCFG + Format('%.3d', [nList]) + '_ServerIP_C';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].IP_C := Trim(GetTagValue(StrCfg, Tag));
              isOK                      := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].IP_C <> SDef^.Preset[nList].IP_C then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].IP_C);
          WriteLn(ConfigFile, ItemCfg);
        end;


      Tag := VCFG + Format('%.3d', [nList]) + '_ServerIP_S';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].IP_S := Trim(GetTagValue(StrCfg, Tag));
              isOK                      := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].IP_S <> SDef^.Preset[nList].IP_S then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].IP_S);
          WriteLn(ConfigFile, ItemCfg);
        end;


      Tag := VCFG + Format('%.3d', [nList]) + '_OutLogMode';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].OutLogMode := TOutLogMode(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
              isOK := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].OutLogMode <> SDef^.Preset[nList].OutLogMode then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].OutLogMode)));
          WriteLn(ConfigFile, ItemCfg);
        end;
//.............................................

      Tag := VCFG + Format('%.3d', [nList]) + '_InsertEmptLineInLog';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].isInsertEmptLine := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
              isOK                      := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].isInsertEmptLine <> SDef^.Preset[nList].isInsertEmptLine then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isInsertEmptLine));
          WriteLn(ConfigFile, ItemCfg);
        end;
//.............................................


      Tag := VCFG + Format('%.3d', [nList]) + '_SkipRepsInLog';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].isSkipReps := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
              isOK                      := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].isSkipReps <> SDef^.Preset[nList].isSkipReps then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isSkipReps));
          WriteLn(ConfigFile, ItemCfg);
        end;
//.............................................


      Tag := VCFG + Format('%.3d', [nList]) + '_EmptyLine';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].EmptyLine := Trim(GetTagValue(StrCfg, Tag));
              isOK             := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].EmptyLine <> SDef^.Preset[nList].EmptyLine then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].EmptyLine);
          WriteLn(ConfigFile, ItemCfg);
        end;
      //.............................................



        Tag := VCFG + Format('%.3d', [nList]) + '_IsControlPauseRX';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].isControlPauseRX := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].isControlPauseRX <> SDef^.Preset[nList].isControlPauseRX then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isControlPauseRX));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_IsAlarmLostConnect';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].isAlarmConnectLost := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].isAlarmConnectLost <> SDef^.Preset[nList].isAlarmConnectLost then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isAlarmConnectLost));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorAlarmLostConnect';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorBG_ConnectLost := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                                (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                                (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                                (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorBG_ConnectLost <> SDef^.Preset[nList].ColorBG_ConnectLost then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorBG_ConnectLost),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
    //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorPauseRX';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorPauseRX := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                  (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                  (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                  (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorPauseRX <> SDef^.Preset[nList].ColorPauseRX then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorPauseRX),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_PauseRXms';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].PauseRXms := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                isOK                 := true;
              end;
          end
        else if Settings.Preset[nList].PauseRXms <> SDef^.Preset[nList].PauseRXms then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.Preset[nList].PauseRXms));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................



        Tag := VCFG + Format('%.3d', [nList]) + '_IsClearLogEnter';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].IsClearLogEnter := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].IsClearLogEnter <> SDef^.Preset[nList].IsClearLogEnter then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].IsClearLogEnter));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_SM';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_SM := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                  (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                  (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                  (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_SM <> SDef^.Preset[nList].ColorFont_SM then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_SM),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_EL';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_EL := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_EL <> SDef^.Preset[nList].ColorFont_EL then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_EL),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_RC';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_RC := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_RC <> SDef^.Preset[nList].ColorFont_RC then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_RC),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_RU';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_RU := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                                (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                                (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                                (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_RU <> SDef^.Preset[nList].ColorFont_RU then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_RU),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_RD';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_RD := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_RD <> SDef^.Preset[nList].ColorFont_RD then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_RD),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_RH';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_RH := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_RH <> SDef^.Preset[nList].ColorFont_RH then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_RH),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_RA';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_RA := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_RA <> SDef^.Preset[nList].ColorFont_RA then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_RA),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_Send';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_Send := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_Send <> SDef^.Preset[nList].ColorFont_Send then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_Send),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................



        Tag := VCFG + Format('%.3d', [nList]) + '_ColorFont_TXT';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorFont_TXT := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorFont_TXT <> SDef^.Preset[nList].ColorFont_TXT then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorFont_TXT),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorBG_PAUSE_TXT';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorBG_PAUSE_TXT := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorBG_PAUSE_TXT <> SDef^.Preset[nList].ColorBG_PAUSE_TXT then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorBG_PAUSE_TXT),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_ColorBG_PAUSE_RTF';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorBG_PAUSE_RTF := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorBG_PAUSE_RTF <> SDef^.Preset[nList].ColorBG_PAUSE_RTF then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorBG_PAUSE_RTF),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorBG_RTF';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorBG_RTF := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorBG_RTF <> SDef^.Preset[nList].ColorBG_RTF then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorBG_RTF),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_ColorBG_TXT';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                ItemCfg := Trim(GetTagValue(StrCfg, Tag));
                if ItemCfg[1] = '$' then
                  Settings.Preset[nList].ColorBG_TXT := TColor((StrToHex(ItemCfg[2] + ItemCfg[3]) shl 24) or
                                                 (StrToHex(ItemCfg[4] + ItemCfg[5]) shl 16) or
                                                 (StrToHex(ItemCfg[6] + ItemCfg[7]) shl  8) or
                                                 (StrToHex(ItemCfg[8] + ItemCfg[9]) shl  0));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ColorBG_TXT <> SDef^.Preset[nList].ColorBG_TXT then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, '$' + IntToHex(Integer(Settings.Preset[nList].ColorBG_TXT),8));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_PortBaudRate';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].BaudRate := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].BaudRate <> SDef^.Preset[nList].BaudRate then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.Preset[nList].BaudRate));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................
        for i := 10 to MAX_CNT_BAUDRATES - 1 do
          begin
            Tag := VCFG + Format('%.3d', [nList]) + '_' + Format('%.3d', [i]) + '_UserPortBaudRate';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].BaudRateS[i] := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                    isOK                 := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].BaudRateS[i] <> SDef^.Preset[nList].BaudRateS[i] then
              begin
                ItemCfg := SetStrParamCfg(5, Tag, IntToStr(Settings.Preset[nList].BaudRateS[i]));
                WriteLn(ConfigFile, ItemCfg);
              end;
          end;
      //.............................................





        Tag := VCFG + Format('%.3d', [nList]) + '_MaxLenLog';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].MaxLenLog := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].MaxLenLog <> SDef^.Preset[nList].MaxLenLog then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.Preset[nList].MaxLenLog));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_PortBits';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].bits := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                isOK             := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].bits <> SDef^.Preset[nList].bits then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.Preset[nList].bits));
            WriteLn(ConfigFile, ItemCfg);
          end;
      //.............................................



        Tag := VCFG + Format('%.3d', [nList]) + '_PortParity';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].Parity := TParity(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
                isOK := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].Parity <> SDef^.Preset[nList].Parity  then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, IntToStr(byte(Settings.Preset[nList].Parity)));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................


        Tag := VCFG + Format('%.3d', [nList]) + '_PortStopBits';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].StopBits := TStopBits(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].StopBits <> SDef^.Preset[nList].StopBits then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].StopBits)));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_ReadMode';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].ReadMode := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].ReadMode <> SDef^.Preset[nList].ReadMode then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].ReadMode)));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_PortSF';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].softflow := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].softflow <> SDef^.Preset[nList].softflow then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].softflow));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_PortHF';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].hardflow := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                isOK                 := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].hardflow <> SDef^.Preset[nList].hardflow then
          begin
            ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].hardflow));
            WriteLn(ConfigFile, ItemCfg);
          end;
        //.............................................

        Tag := VCFG + Format('%.3d', [nList]) + '_AutoConnect';
        if isGet then
          begin
            if (Pos(Tag, StrCfg) > 0) and not isOK then
              begin
                Settings.Preset[nList].isAutoConnect := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                isOK := true;
                Exit;
              end;
          end
        else if Settings.Preset[nList].isAutoConnect <> SDef^.Preset[nList].isAutoConnect then
          begin
             ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isAutoConnect));
             WriteLn(ConfigFile, ItemCfg);
          end;
      //............................................



      ////////////////////////

      Tag := VCFG + Format('%.3d', [nList]) + '_MacrosListName';
      if isGet then
        begin
          if (Pos(Tag, StrCfg) > 0) and not isOK then
            begin
              Settings.Preset[nList].NameMacrosList := Trim(GetTagValue(StrCfg, Tag));
              isOK := true;
              Exit;
            end;
        end
      else if Settings.Preset[nList].NameMacrosList <> SDef^.Preset[nList].NameMacrosList then
        begin
          ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].NameMacrosList);
          WriteLn(ConfigFile, ItemCfg);
        end;

      for i := 0 to MAX_CNT_LAST_CMD - 1 do
        begin
          Tag := VCFG + Format('%.3d', [nList]) + '_LC_' + Format('%.3d', [i]);
          if isGet then
            begin
              if (Pos(Tag, StrCfg) > 0) and not isOK then
                begin
                  Settings.Preset[nList].LastCmdList[i] := Trim(GetTagValue(StrCfg, Tag));
                  isOK := true;
                  Exit;
                end;
            end
          else if Settings.Preset[nList].LastCmdList[i] <> SDef^.Preset[nList].LastCmdList[i] then
            begin
              ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].LastCmdList[i]);
              WriteLn(ConfigFile, ItemCfg);
            end;
        end;

      for i := 0 to 255 do
        begin
          Tag := VCFG + Format('%.3d', [nList]) + '_CD_' + Format('%.3d', [i]);
          if isGet then
            begin
              if (Pos(Tag, StrCfg) > 0) and not isOK then
                begin
                  Settings.Preset[nList].ItCustDecode[i].StrDecode := Trim(GetTagValue(StrCfg, Tag));
                  isOK             := true;
                  Exit;
                end;
            end
          else if Settings.Preset[nList].ItCustDecode[i].StrDecode <> SDef^.Preset[nList].ItCustDecode[i].StrDecode then
            begin
              ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].ItCustDecode[i].StrDecode);
              WriteLn(ConfigFile, ItemCfg);
            end;
      //.............................................
        end;



      for nMacros := 1 to CNT_MACROS do
        begin
          Tag := VCFG + Format('%.3d', [nList]) + '_MacrosName' + Format('%.3d', [nMacros]);
          if isGet then
            begin
              if (Pos(Tag, StrCfg) > 0) and not isOK then
                begin
                  Settings.Preset[nList].MacrosName[nMacros] := Trim(GetTagValue(StrCfg, Tag));
                  isOK := true;
                  Exit;
                end;
            end
          else if Settings.Preset[nList].MacrosName[nMacros] <> SDef^.Preset[nList].MacrosName[nMacros] then
            begin
              ItemCfg := SetStrParamCfg(1, Tag, Settings.Preset[nList].MacrosName[nMacros]);
              WriteLn(ConfigFile, ItemCfg);
            end;


          Tag := VCFG + Format('%.3d', [nList]) + '_MacrosCmd' + Format('%.3d', [nMacros]);
          if isGet then
            begin
              if (Pos(Tag, StrCfg) > 0) and not isOK then
                begin
                  Settings.Preset[nList].MacrosCmd[nMacros] := GetTagValue(StrCfg, Tag);
                  isOK := true;
                  Exit;
                end;
            end
          else if Settings.Preset[nList].MacrosCmd[nMacros] <> SDef^.Preset[nList].MacrosCmd[nMacros] then
            begin
              ItemCfg := SetStrParamCfg(2, Tag, Settings.Preset[nList].MacrosCmd[nMacros]);
              WriteLn(ConfigFile, ItemCfg);
            end;

          Tag := VCFG + Format('%.3d', [nList]) + '_MacrosHelp' + Format('%.3d', [nMacros]);
          if isGet then
            begin
              if (Pos(Tag, StrCfg) > 0) and not isOK then
                begin
                  Settings.Preset[nList].MacrosHelp[nMacros] := GetTagValue(StrCfg, Tag);
                  isOK := true;
                  Exit;
                end;
            end
          else if Settings.Preset[nList].MacrosHelp[nMacros] <> SDef^.Preset[nList].MacrosHelp[nMacros] then
            begin
              ItemCfg := SetStrParamCfg(3, Tag, Settings.Preset[nList].MacrosHelp[nMacros]);
              WriteLn(ConfigFile, ItemCfg);
            end;
        end;

            Tag := VCFG + Format('%.3d', [nList]) + '_ShowCntInLog';
            if isGet then
              begin
                  if (Pos(Tag, StrCfg) > 0) and not isOK then
                    begin
                      Settings.Preset[nList].isShowCnt := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                      isOK                 := true;
                      Exit;
                    end;
                end
              else if Settings.Preset[nList].isShowCnt <> SDef^.Preset[nList].isShowCnt then
                begin
                  ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isShowCnt));
                  WriteLn(ConfigFile, ItemCfg);
                end;
             //.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_ShowPortInLog';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                   begin
                     Settings.Preset[nList].isShowPort := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                     isOK                 := true;
                     Exit;
                   end;
              end
            else if Settings.Preset[nList].isShowPort <> SDef^.Preset[nList].isShowPort then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isShowPort));
                WriteLn(ConfigFile, ItemCfg);
              end;
            //.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_ShowDirInLog';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].isShowDir := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                    isOK                 := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].isShowDir <> SDef^.Preset[nList].isShowDir then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isShowDir));
                WriteLn(ConfigFile, ItemCfg);
              end;
            //.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_ShowModeInLog';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].isShowMode := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                    isOK                 := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].isShowMode <> SDef^.Preset[nList].isShowMode then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isShowMode));
                WriteLn(ConfigFile, ItemCfg);
              end;
           //.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_DisplayDateInTimeStamp';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].isDateInTimeStamp := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                    isOK                 := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].isDateInTimeStamp <> SDef^.Preset[nList].isDateInTimeStamp then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isDateInTimeStamp));
                WriteLn(ConfigFile, ItemCfg);
              end;
           //.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_DisplayNonPrintASCII';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].isNonPrintASCII := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                    isOK                 := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].isNonPrintASCII <> SDef^.Preset[nList].isNonPrintASCII then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isNonPrintASCII));
                WriteLn(ConfigFile, ItemCfg);
              end;
           //.............................................




            Tag := VCFG + Format('%.3d', [nList]) + '_ShowTimeInLog';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].isShowTime := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                    isOK                 := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].isShowTime <> SDef^.Preset[nList].isShowTime then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].isShowTime));
                WriteLn(ConfigFile, ItemCfg);
              end;
           //.............................................



            Tag := VCFG + Format('%.3d', [nList]) + '_SendOutMode';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].OutMode := TOutMode(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
                    isOK := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].OutMode <> SDef^.Preset[nList].OutMode then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].OutMode)));
                WriteLn(ConfigFile, ItemCfg);
              end;
//.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_SendOutPeriod';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].PeriodSend := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                    isOK := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].PeriodSend <> SDef^.Preset[nList].PeriodSend then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.Preset[nList].PeriodSend));
                WriteLn(ConfigFile, ItemCfg);
              end;


            Tag := VCFG + Format('%.3d', [nList]) + '_ShowHelpMode';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].ShowHelpMode := TShowHelpMode(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
                    isOK := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].ShowHelpMode <> SDef^.Preset[nList].ShowHelpMode then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].ShowHelpMode)));
                WriteLn(ConfigFile, ItemCfg);
              end;
//.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_DecodeSendInPortMode';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].DecodeMode := TDecodeMode(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
                    isOK := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].DecodeMode <> SDef^.Preset[nList].DecodeMode then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].DecodeMode)));
                WriteLn(ConfigFile, ItemCfg);
              end;
//.............................................
            Tag := VCFG + Format('%.3d', [nList]) + '_FilterSubString';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].FilterStr := Trim(GetTagValue(StrCfg, Tag));
                    isOK               := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].FilterStr <> SDef^.Preset[nList].FilterStr then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].FilterStr);
                WriteLn(ConfigFile, ItemCfg);
              end;
  //.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_CommandString';
              if isGet then
                begin
                  if (Pos(Tag, StrCfg) > 0) and not isOK then
                    begin
                      Settings.Preset[nList].CmdStr := Trim(GetTagValue(StrCfg, Tag));
                      isOK               := true;
                      Exit;
                    end;
                end
              else if Settings.Preset[nList].CmdStr <> SDef^.Preset[nList].CmdStr then
                begin
                  ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].CmdStr);
                  WriteLn(ConfigFile, ItemCfg);
                end;
  //.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_TailString';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].TailStr := Trim(GetTagValue(StrCfg, Tag));
                    isOK               := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].TailStr <> SDef^.Preset[nList].TailStr then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, Settings.Preset[nList].TailStr);
                WriteLn(ConfigFile, ItemCfg);
              end;
  //.............................................


            Tag := VCFG + Format('%.3d', [nList]) + '_FilterStrSubStringMode';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].CondFilter := TFilterLog(StrToInt(Trim(GetTagValue(StrCfg, Tag))));
                    isOK                := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].CondFilter <> SDef^.Preset[nList].CondFilter then
              begin
                ItemCfg :=  SetStrParamCfg(0, Tag, IntToStr(Integer(Settings.Preset[nList].CondFilter)));
                WriteLn(ConfigFile, ItemCfg);
              end;
  //.............................................


            Tag := VCFG + Format('%.3d', [nList]) + '_FontSizeInLog';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].FontSizeLog := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                    isOK := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].FontSizeLog <> SDef^.Preset[nList].FontSizeLog then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.Preset[nList].FontSizeLog));
                WriteLn(ConfigFile, ItemCfg);
              end;
//.............................................


              //.............................................
            Tag := VCFG + Format('%.3d', [nList]) + '_CondOutIsRecBytes';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].CondOut.isCntByte := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                    isOK                 := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].CondOut.isCntByte <> SDef^.Preset[nList].CondOut.isCntByte then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].CondOut.isCntByte));
                WriteLn(ConfigFile, ItemCfg);
              end;

            Tag := VCFG + Format('%.3d', [nList]) + '_CondOutIsPauseMs';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].CondOut.isTimeOut := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                    isOK                 := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].CondOut.isTimeOut <> SDef^.Preset[nList].CondOut.isTimeOut then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].CondOut.isTimeOut));
                WriteLn(ConfigFile, ItemCfg);
              end;
            //.............................................

            Tag := VCFG + Format('%.3d', [nList]) + '_CondOutCntByte';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].CondOut.CntByte := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                    isOK := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].CondOut.CntByte <> SDef^.Preset[nList].CondOut.CntByte then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.Preset[nList].CondOut.CntByte));
                WriteLn(ConfigFile, ItemCfg);
              end;

            Tag := VCFG + Format('%.3d', [nList]) + '_CondOutTimeOut';
            if isGet then
              begin
                if (Pos(Tag, StrCfg) > 0) and not isOK then
                  begin
                    Settings.Preset[nList].CondOut.TimeOut := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                    isOK := true;
                    Exit;
                  end;
              end
            else if Settings.Preset[nList].CondOut.TimeOut <> SDef^.Preset[nList].CondOut.TimeOut then
              begin
                ItemCfg := SetStrParamCfg(0, Tag, IntToStr(Settings.Preset[nList].CondOut.TimeOut));
                WriteLn(ConfigFile, ItemCfg);
              end;

                //.............................................
            for i := 1 to CNT_SEC_COND do
              begin
                Tag := VCFG + Format('%.3d', [nList]) + '_CondOutIsAfterSec_'+Format('%.3d', [i]);
                if isGet then
                  begin
                    if (Pos(Tag, StrCfg) > 0) and not isOK then
                      begin
                        Settings.Preset[nList].CondOut.isAfter[i] := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                        isOK                 := true;
                        Exit;
                      end;
                  end
              else if Settings.Preset[nList].CondOut.isAfter[i] <> SDef^.Preset[nList].CondOut.isAfter[i] then
                begin
                  ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].CondOut.isAfter[i]));
                  WriteLn(ConfigFile, ItemCfg);
                end;

              for j := 0 to CNT_BYTE_SEP - 1 do
                begin
                  Tag := VCFG + Format('%.3d', [nList]) + '_CondOutAfterSec_'+Format('%.3d_', [i]) + Format('%.3d', [j]);
                  if isGet then
                    begin
                      if (Pos(Tag, StrCfg) > 0) and not isOK then
                        begin
                          Settings.Preset[nList].CondOut.buf_after[i, j] := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                          isOK := true;
                          Exit;
                        end;
                    end
                  else if Settings.Preset[nList].CondOut.buf_after[i, j] <> SDef^.Preset[nList].CondOut.buf_after[i, j] then
                    begin
                      ItemCfg := SetStrParamCfg(2, Tag, IntToStr(Settings.Preset[nList].CondOut.buf_after[i, j]));
                      WriteLn(ConfigFile, ItemCfg);
                    end;
                end;
              end;

            for i := 1 to CNT_SEC_COND do
              begin
                Tag := VCFG + Format('%.3d', [nList]) + '_CondOutIsBeforeSec_'+Format('%.3d', [i]);
                if isGet then
                  begin
                    if (Pos(Tag, StrCfg) > 0) and not isOK then
                      begin
                        Settings.Preset[nList].CondOut.isBefore[i] := SameText(Trim(GetTagValue(StrCfg, Tag)), 'true');
                        isOK                 := true;
                        Exit;
                      end;
                  end
                else if Settings.Preset[nList].CondOut.isBefore[i] <> SDef^.Preset[nList].CondOut.isBefore[i] then
                  begin
                    ItemCfg := SetStrParamCfg(0, Tag, BoolToString(Settings.Preset[nList].CondOut.isBefore[i]));
                    WriteLn(ConfigFile, ItemCfg);
                  end;


                for j := 0 to CNT_BYTE_SEP - 1 do
                  begin
                    Tag := VCFG + Format('%.3d', [nList]) + '_CondOutBeforeSec_'+Format('%.3d_', [i]) + Format('%.3d', [j]);
                    if isGet then
                      begin
                        if (Pos(Tag, StrCfg) > 0) and not isOK then
                          begin
                            Settings.Preset[nList].CondOut.buf_before[i, j] := StrToInt(Trim(GetTagValue(StrCfg, Tag)));
                            isOK := true;
                            Exit;
                          end;
                      end
                    else if Settings.Preset[nList].CondOut.buf_before[i, j] <> SDef^.Preset[nList].CondOut.buf_before[i, j] then
                      begin
                        ItemCfg := SetStrParamCfg(2, Tag, IntToStr(Settings.Preset[nList].CondOut.buf_before[i, j]));
                        WriteLn(ConfigFile, ItemCfg);
                      end;
                  end;
              end;

     end;

  ///////////////////////////

  if not isGet then
    begin
      CloseFile(ConfigFile);
    end;
end;


function LoadCfgXmlFromFile(nameFile : string) : string;
var
  CntStr : Cardinal;
  i : Cardinal;
begin
  assignfile(ConfigFile, nameFile);
  CntStr := 0;
  if FileExists(nameFile) then
    begin
      for i := 0 to MAX_CNT_STR_XML do
        XmlStr[i] := '';
      iXmlStr   := 0;
      cntXmlStr := 0;

      Reset(ConfigFile);
      while (not Eof(ConfigFile)) and (cntXmlStr < MAX_CNT_STR_XML)  do
        begin
          ReadLn(ConfigFile, XmlStr[cntXmlStr]);
          inc(CntStr);
          inc(cntXmlStr);
          //SetParam(StrCfg, nameFile, nil);
        end;
      CloseFile(ConfigFile);
      FormMain.TimerConvertXML.Enabled := cntXmlStr > 0;
    end;
  result := Settings.NameSettings;
end;


function GetCsumCfg(Sett: pSettings) : Cardinal;
var
  ByteArray : pByte;
  i, sizeCfg : Cardinal;
  Sum : Cardinal;
begin
  Sett^.CSumCfg := 0;
  ByteArray := pByte(Sett);
  sizeCfg   := SizeOf(TSettings);
  Sum := 0;

  for i := 0 to sizeCfg - 1 do
  begin
    Sum := Sum + ByteArray^;
    Inc(ByteArray);
  end;

  result := Sum;
end;


procedure CfgReadDumpCfgFromFile;
var
  SettingsTmp : TSettings;
  filecfgdump : file of TSettings;
  isErr : boolean;
  CurSum : Cardinal;
begin
  isErr := false;
  if FileExists(CONFIG_FILE_NAME_DUMP) then
    begin
      try
      assignfile(filecfgdump, CONFIG_FILE_NAME_DUMP);
      Reset(filecfgdump);
      Read(filecfgdump, SettingsTmp);
      CloseFile(filecfgdump);
      except
        isErr := true;
      end;
    end
  else
    isErr := true;

  if not isErr then
    begin
      CurSum := SettingsTmp.CSumCfg;
      SettingsTmp.CSumCfg := 0;
      try
        isErr := CurSum <> GetCsumCfg(@SettingsTmp);
      except
        isErr := true;
      end;
    end;

  if isErr then
    LoadCfgXmlFromFile(CONFIG_FILE_NAME_XML)
  else
    Settings := SettingsTmp;
end;

procedure CfgWriteDumpCfgInFile;
var
  filecfgdump : file of TSettings;
begin
  try
    DeleteFile(CONFIG_FILE_NAME_DUMP);
    assignfile(filecfgdump, CONFIG_FILE_NAME_DUMP);
    Rewrite(filecfgdump);
    Write(filecfgdump, Settings);
    CloseFile(filecfgdump);
  except
    assignfile(filecfgdump, CONFIG_FILE_NAME_DUMP + '_Copy_' + GetDateTimeStrForNameFile(now));
    Rewrite(filecfgdump);
    Write(filecfgdump, Settings);
    CloseFile(filecfgdump);
  end;
end;


procedure SetDefaultSettings(Sett: pSettings);
var i, j : integer;
    nList : byte;
begin
  for nList := 1 to MAX_CNT_LIST do
    begin
      Sett^.Preset[nList].IP_C       := '';
      Sett^.Preset[nList].IP_S       := '';

      Sett^.Preset[nList].IPPortC    := 0;
      Sett^.Preset[nList].IPPortS    := 0;

      Sett^.Preset[nList].BaudRate       := 19200;
      Sett^.Preset[nList].bits           := 8;
      Sett^.Preset[nList].Parity         := TParity.PNone;
      Sett^.Preset[nList].StopBits       := TStopBits.SB1;
      Sett^.Preset[nList].CmdStr         := '';
      Sett^.Preset[nList].FilterStr      := '';
      Sett^.Preset[nList].CondFilter     := TFilterLog.FL_NoFilter;
      Sett^.Preset[nList].hardflow       := false;
      Sett^.Preset[nList].softflow       := false;
      Sett^.Preset[nList].isAutoConnect  := false;
      for i := 1 to 2 do
        Sett^.Preset[nList].isSendPortA[i] := false;

      for i := 1 to 16 do
        Sett^.Preset[nList].isSendPortB[i] := false;

      Sett^.Preset[nList].isSendPortM     := true;
      Sett^.Preset[nList].isShowCnt       := false;
      Sett^.Preset[nList].isShowDir       := false;
      Sett^.Preset[nList].isShowMode      := false;
      Sett^.Preset[nList].isShowPort      := false;
      Sett^.Preset[nList].isShowTime      := false;
      Sett^.Preset[nList].isAutoScroll    := true;
      Sett^.Preset[nList].isSkipReps      := false;
      Sett^.Preset[nList].isInsertEmptLine:= false;
      for i := 0 to MAX_CNT_LAST_CMD - 1 do
        Sett^.Preset[nList].LastCmdList[i] := '';

      for j := 1 to CNT_MACROS do
        begin
          Sett^.Preset[nList].MacrosCmd[j] := '';
          Sett^.Preset[nList].MacrosName[j] := '';
          Sett^.Preset[nList].MacrosHelp[j] := '';
        end;

      Sett^.Preset[nList].NameMacrosList := 'Presets ' + IntToStr(nList);

      Sett^.Preset[nList].DecodeMode := TDecodeMode.TDAscii;
      Sett^.Preset[nList].OutMode    := TOutMode.TOutManual;
      Sett^.Preset[nList].PeriodSend := 1000;
      Sett^.Preset[nList].ReadMode   := byte(TReadMode.TReadAscii);
      Sett^.Preset[nList].TailStr    := '$0D$0A';
      Sett^.Preset[nList].OutLogMode := TOutLogMode.TOutLogTxt;

      Sett^.Preset[nList].CondOut.isCntByte := false;
      Sett^.Preset[nList].CondOut.isTimeOut := true;
      Sett^.Preset[nList].CondOut.CntByte   := 0;
      Sett^.Preset[nList].CondOut.Timeout   := 50;

      Sett^.Preset[nList].ShowHelpMode := TShowHelpMode.TShowHelpMacros;

      for i := 1 to CNT_SEC_COND do
        begin
          Sett^.Preset[nList].CondOut.isAfter[i] := false;                      //флаг для разбиения на подпакеты после последовательности
          for j := 0 to CNT_BYTE_SEP - 1 do
            Sett^.Preset[nList].CondOut.buf_after[i, j] := SYMBOL_EMPT;

          Sett^.Preset[nList].CondOut.isBefore[i] := false;
          for j := 0 to CNT_BYTE_SEP - 1 do
            Sett^.Preset[nList].CondOut.buf_before[i, j] := SYMBOL_EMPT;
        end;

      Sett^.Preset[nList].CondOut.isAfter[1] := true;
      Sett^.Preset[nList].CondOut.buf_after[1, 0] := $0D;
      Sett^.Preset[nList].CondOut.buf_after[1, 1] := $0A;

      Sett^.Preset[nList].isAlarmConnectLost  := false;
      Sett^.Preset[nList].ColorBG_ConnectLost := clRed;
      Sett^.Preset[nList].ColorBG_TXT    := clWindow;
      Sett^.Preset[nList].ColorBG_RTF    := clWindow;
      Sett^.Preset[nList].ColorBG_PAUSE_TXT  := clYellow;
      Sett^.Preset[nList].ColorBG_PAUSE_RTF  := clYellow;

      Sett^.Preset[nList].ColorFont_TXT  := clBlack;
      Sett^.Preset[nList].ColorFont_Send := clRed;
      Sett^.Preset[nList].ColorFont_RA   := clBlue;
      Sett^.Preset[nList].ColorFont_RH   := clGreen;
      Sett^.Preset[nList].ColorFont_RD   := clGreen;
      Sett^.Preset[nList].ColorFont_RC   := clGreen;
      Sett^.Preset[nList].ColorFont_RU   := clGreen;
      Sett^.Preset[nList].ColorFont_EL   := clLime;

      Sett^.Preset[nList].ColorFont_SM   := clBlack;
      Sett^.Preset[nList].FontSizeLog    := 12;
      Sett^.Preset[nList].EmptyLine        := '';
      Sett^.Preset[nList].MaxLenLog        := 10000;
      Sett^.Preset[nList].IsClearLogEnter  := false;

      Sett^.Preset[nList].isControlPauseRX := false;
      Sett^.Preset[nList].PauseRXms        := 5000;
      Sett^.Preset[nList].ColorPauseRX     := clRed;
      Sett^.Preset[nList].isNonPrintASCII  := true;
      Sett^.Preset[nList].isDateInTimeStamp:= false;

      for i := 0 to 255 do
        Sett^.Preset[nList].ItCustDecode[i].StrDecode := ByteToAsciiTabl[i];

      Sett^.Preset[nList].BaudRateS[0] := 300;
      Sett^.Preset[nList].BaudRateS[1] := 600;
      Sett^.Preset[nList].BaudRateS[2] := 1200;
      Sett^.Preset[nList].BaudRateS[3] := 2400;
      Sett^.Preset[nList].BaudRateS[4] := 4800;
      Sett^.Preset[nList].BaudRateS[5] := 9600;
      Sett^.Preset[nList].BaudRateS[6] := 19200;
      Sett^.Preset[nList].BaudRateS[7] := 38400;
      Sett^.Preset[nList].BaudRateS[8] := 57600;
      Sett^.Preset[nList].BaudRateS[8] := 115200;
      Sett^.Preset[nList].BaudRateS[9] := 230400;
      for i := 10 to MAX_CNT_BAUDRATES - 1 do
        Sett^.Preset[nList].BaudRateS[i] := 0;

  end;
  Sett^.DiagData.CntStart      := 0;
  Sett^.DiagData.CntCloseOK    := 0;
  Sett^.NumListMacros          := 1;
  Sett^.NameSettings           := '';
  Sett^.NameLogBin             := '';
  Sett^.NameLogTxt             := '';
  Sett^.isTxBinLog             := false;
  Sett^.isRxBinLog             := false;
  Sett^.isTxTxtLog             := false;
  Sett^.isRxTxtLog             := false;
  Sett^.isEvTxtLog             := false;
  Sett^.isAutoStartLogTxt      := false;
  Sett^.isAutoStartLogBin      := false;
  Sett^.isNewLogTxt            := false;
  Sett^.isNewLogBin            := false;
  Sett^.NameFolderLog          := '';
  Sett^.Connect                := TConnect.TConnCom;
end;


procedure TFormMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  DefSet : TSettings;
begin
  SetDefaultSettings(@DefSet);
  Settings.NameSettings := '';
  inc(Settings.DiagData.CntCloseOK);
  SetParam('NO', CONFIG_FILE_NAME_XML, @DefSet);
  Settings.NameSettings := '';
  Settings.CSumCfg := GetCsumCfg(@Settings);
  CfgWriteDumpCfgInFile;

  if isLogTxt then
    CloseFile(TextFileLog);

  if isLogBin then
    CloseFile(BinFileLog);

  if isSendFileProcess then
    begin
       if Port <> nil then
          case Settings.Connect of
            TConnect.TConnCom       : begin
                                        TComPort(Port).ResetGlRB;
                                        while(TComPort(Port).GetIsBusyWrite) do
                                          Sleep(1);
                                      end;
            TConnect.TConnTcpClient : begin
                                        TTcpPortClient(Port).ResetGlRB;
                                        while(TTcpPortClient(Port).GetIsBusyWrite) do
                                          Sleep(1);
                                      end;
            TConnect.TConnTcpServer : begin
                                        TTcpPortServer(Port).ResetGlRB;
                                        while(TTcpPortServer(Port).GetIsBusyWrite) do
                                          Sleep(1);
                                      end;
          end;
    end;

  if ThrReadFile <> nil then
   begin
     ThrReadFile.Terminate;
     while not ThrReadFile.GetIsStop do sleep(1);
     ThrReadFile.Free;
     ThrReadFile := nil;
     isSendFileProcess := false;
   end;

  if Port <> nil then
    begin
      case Settings.Connect of
        TConnect.TConnCom       : TComPort(Port).Free;
        TConnect.TConnTcpClient : TTcpPortClient(Port).Free;
        TConnect.TConnTcpServer : TTcpPortServer(Port).Free;
      end;
      Port := nil;
    end;
end;

procedure TFormMain.EdtMacrosClick(Sender: TObject);
var
  strtmp : string;
begin
  EdtMacros[NumCurMacros].Color:= clWindow;
  NumCurMacros := (Sender as TEdit).Tag;
  strtmp := StringReplace(Settings.Preset[Settings.NumListMacros].MacrosHelp[NumCurMacros], '[$0D$0A]', #13#10, [rfReplaceAll]);
  MHelp.Text     := strtmp;
  MHelpEdit.Text := strtmp;
end;

procedure TFormMain.EdtPortCChange(Sender: TObject);
var
  port : cardinal;
begin
  port := 0;
  if (Sender as TEdit).Text <> '' then
    port := StrToInt((Sender as TEdit).Text);

  if (port > 0) and (port < 65536) then
    Settings.Preset[Settings.NumListMacros].IPPortC := port;
end;

procedure TFormMain.EdtPortSChange(Sender: TObject);
var
  port : cardinal;
begin
  port := 0;
  if (Sender as TEdit).Text <> '' then
    port := StrToInt((Sender as TEdit).Text);

  if (port > 0) and (port < 65536) then
    Settings.Preset[Settings.NumListMacros].IPPortS := port;
end;

procedure TFormMain.EdtServerCChange(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].IP_C := (Sender as TEdit).Text;
end;

procedure TFormMain.EdtServerSChange(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].IP_S := (Sender as TEdit).Text;
end;

procedure TFormMain.EdtSubStringChange(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].FilterStr := (Sender as TEdit).Text;
  CntMathSubstr := 0;
end;

procedure TFormMain.EdtTailChange(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].TailStr := (Sender as TEdit).Text;
end;

procedure TFormMain.EdtTimeOutChange(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;




procedure UpdCondLineSep;
var
  i, j : byte;
begin
  FormMain.CBCntByte.Checked := Settings.Preset[Settings.NumListMacros].CondOut.isCntByte;
  FormMain.CBTimeOut.Checked := Settings.Preset[Settings.NumListMacros].CondOut.isTimeOut;
  FormMain.EdtCntByte.Text   := IntToStr(Settings.Preset[Settings.NumListMacros].CondOut.CntByte);
  FormMain.EdtTimeOut.Text   := IntToStr(Settings.Preset[Settings.NumListMacros].CondOut.Timeout);
  for i := 1 to CNT_SEC_COND do
    begin
      CBAfter[i].Checked := Settings.Preset[Settings.NumListMacros].CondOut.isAfter[i];                      //флаг для разбиения на подпакеты после последовательности
      for j := 0 to CNT_BYTE_SEP - 1 do
        case Settings.Preset[Settings.NumListMacros].CondOut.buf_after[i, j] of
          SYMBOL_ANY :
            EdtBufAfter[i, j].Text := '--';
          SYMBOL_EMPT :
            EdtBufAfter[i, j].Text := ''
          else
            EdtBufAfter[i, j].Text := IntToHex(Settings.Preset[Settings.NumListMacros].CondOut.buf_after[i, j], 2);
        end;

      CBBefore[i].Checked := Settings.Preset[Settings.NumListMacros].CondOut.isBefore[i];
      for j := 0 to CNT_BYTE_SEP - 1 do
        case Settings.Preset[Settings.NumListMacros].CondOut.buf_before[i, j] of
          SYMBOL_ANY :
            EdtBufBefore[i, j].Text := '--';
          SYMBOL_EMPT :
            EdtBufBefore[i, j].Text := ''
          else
            EdtBufBefore[i, j].Text := IntToHex(Settings.Preset[Settings.NumListMacros].CondOut.buf_before[i, j], 2);
        end;
    end;
end;

procedure UpdListPorts;
var
  CurPortName : string;
  PortList    : TStringList;
begin
  if (Port <> nil) and (Settings.Connect = TConnect.TConnCom) then
    begin
      CurPortName := TComPort(Port).GetName;
    end
  else
    begin
      try
        CurPortName := Settings.PortName;
        PortList    := ComPortSearsch;
        FormMain.CBPortName.Items := SetFirstItemInListString(CurPortName, PortList);
        if FormMain.CBPortName.Items.Count > 0 then
          FormMain.CBPortName.ItemIndex := 0;
      finally
        PortList.Free;
      end;
    end;
end;

procedure TFormMain.EdtMacrosChange(Sender: TObject);
var
  nMacros : integer;
begin
  nMacros := (Sender as TEdit).Tag;

  if ModeMacros = MM_Name then
    Settings.Preset[Settings.NumListMacros].MacrosName[nMacros] := (Sender as TEdit).Text
  else if ModeMacros = MM_Command then
    Settings.Preset[Settings.NumListMacros].MacrosCmd[nMacros] := (Sender as TEdit).Text;
end;

procedure TFormMain.EdtNameListChange(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].NameMacrosList := (Sender as TEdit).Text;
end;

procedure UpdateListMacros;
var nMacros : integer;
  strTmp : string;
begin
  for nMacros := 1 to CNT_MACROS do
    begin
    if ModeMacros = MM_Name then
      begin
        BtnMacros[nMacros].Caption := Settings.Preset[Settings.NumListMacros].MacrosName[nMacros];
        EdtMacros[nMacros].Text    := Settings.Preset[Settings.NumListMacros].MacrosName[nMacros];

        EdtMacros[nMacros].Hint    := Settings.Preset[Settings.NumListMacros].MacrosCmd[nMacros];
        BtnMacros[nMacros].Hint    := Settings.Preset[Settings.NumListMacros].MacrosCmd[nMacros];

        EdtMacros[nMacros].Font.Bold := true;
        BtnMacros[nMacros].Font.Bold := true;
      end
    else if ModeMacros = MM_Command then
      begin
        BtnMacros[nMacros].Caption := Settings.Preset[Settings.NumListMacros].MacrosCmd[nMacros];
        EdtMacros[nMacros].Text    := Settings.Preset[Settings.NumListMacros].MacrosCmd[nMacros];

        EdtMacros[nMacros].Hint    := Settings.Preset[Settings.NumListMacros].MacrosName[nMacros];
        BtnMacros[nMacros].Hint    := Settings.Preset[Settings.NumListMacros].MacrosName[nMacros];

        EdtMacros[nMacros].Font.Bold := false;
        BtnMacros[nMacros].Font.Bold := false;
      end;
      EdtMacros[nMacros].Color := clWindow;
    end;
  FormMain.STNumList.Caption := IntToStr(Settings.NumListMacros);
  FormMain.STNameList.Caption:= Settings.Preset[Settings.NumListMacros].NameMacrosList;
  FormMain.EdtNameList.Text  := Settings.Preset[Settings.NumListMacros].NameMacrosList;

  FormMain.MHelp.Clear;
  FormMain.MHelpEdit.Clear;
  FormMain.TimerPeriodSend.Interval := Settings.Preset[Settings.NumListMacros].PeriodSend;
  FormMain.TimerPeriodSend.Enabled  := Settings.Preset[Settings.NumListMacros].OutMode = TOutMode.TOutPeriod;

  NumCurMacros := 0;
end;


procedure UpdSettPort;
var
  i : integer;
begin
  FormMain.CBPortBaudRate.Clear;
  for i := 0 to MAX_CNT_BAUDRATES - 1 do
    if Settings.Preset[Settings.NumListMacros].BaudRateS[i] > 0 then
      FormMain.CBPortBaudRate.Items.Add(IntToStr(Settings.Preset[Settings.NumListMacros].BaudRateS[i]));

  FormMain.CBPortBaudRate.Text   := IntToStr(Settings.Preset[Settings.NumListMacros].BaudRate);
  FormMain.CBBits.Text           := IntToStr(Settings.Preset[Settings.NumListMacros].bits);
  FormMain.CBComParity.ItemIndex := Integer(Settings.Preset[Settings.NumListMacros].Parity);
  FormMain.CBStopBits.ItemIndex  := Integer(Settings.Preset[Settings.NumListMacros].StopBits);
  FormMain.CBSF.Checked          := Settings.Preset[Settings.NumListMacros].softflow;
  FormMain.CBHF.Checked          := Settings.Preset[Settings.NumListMacros].hardflow;
  FormMain.CBAutoConnect.Checked := Settings.Preset[Settings.NumListMacros].isAutoConnect;
  FormMain.EdtServerC.Text        := Settings.Preset[Settings.NumListMacros].IP_C;
  FormMain.EdtPortC.Text          := IntToStr(Settings.Preset[Settings.NumListMacros].IPPortC);
  FormMain.EdtServerS.Text        := Settings.Preset[Settings.NumListMacros].IP_S;
  FormMain.EdtPortS.Text          := IntToStr(Settings.Preset[Settings.NumListMacros].IPPortS);

end;

procedure SetModeOutPeriod;
begin
  FormMain.STPeriodSend.Caption := IntToStr(Settings.Preset[Settings.NumListMacros].PeriodSend);

  case Settings.Preset[Settings.NumListMacros].OutMode of
    TOutMode.TOutManual       : FormMain.STOutMode.Caption := 'Manual';
    TOutMode.TOutClickMacros  : FormMain.STOutMode.Caption := 'Click macros';
    TOutMode.TOutAfterAns     : FormMain.STOutMode.Caption := 'After ans';
    TOutMode.TOutPeriod       : FormMain.STOutMode.Caption := 'Periodic';
    TOutMode.TOutByteToByte   : FormMain.STOutMode.Caption := 'Byte To Byte';
  end;

end;

procedure UpdOutLogSettings;
begin
  FormMain.TMMainLog.Color      := Settings.Preset[Settings.NumListMacros].ColorBG_TXT;
  FormMain.TMMainLog.Font.Color := Settings.Preset[Settings.NumListMacros].ColorFont_TXT;
  FormMain.TMMainLog.Font.Size  := Settings.Preset[Settings.NumListMacros].FontSizeLog;

  FormMain.TMAddLog.Color       := Settings.Preset[Settings.NumListMacros].ColorBG_PAUSE_TXT;
  FormMain.TMAddLog.Font.Color  := Settings.Preset[Settings.NumListMacros].ColorFont_TXT;
  FormMain.TMAddLog.Font.Size   := Settings.Preset[Settings.NumListMacros].FontSizeLog;


  FormMain.RMMainLog.Color      := Settings.Preset[Settings.NumListMacros].ColorBG_RTF;
  FormMain.RMAddLog.Color       := Settings.Preset[Settings.NumListMacros].ColorBG_PAUSE_RTF;
  FormMain.RMAddLog.Font.Size   := Settings.Preset[Settings.NumListMacros].FontSizeLog;
  FormMain.RMMainLog.Font.Size  := Settings.Preset[Settings.NumListMacros].FontSizeLog;

  FormMain.TMMainLog.Clear;
  FormMain.RMMainLog.Clear;
  FormMain.TMAddLog.Clear;
  FormMain.RMAddLog.Clear;
  isEventNoRx := false;
end;

function InvertColor(const Color: TColor): TColor;
begin
  Result := TColor(((255 - GetRValue(Color)) shl 16) or  ((255 - GetGValue(Color)) shl 8) or ((255 - GetBValue(Color)) shl 0));
end;


procedure UpdSetPnlColor;
begin
  if Settings.Preset[Settings.NumListMacros].isInsertEmptLine then
    begin
      FormMain.ST_EmptyLine.Color      := Settings.Preset[Settings.NumListMacros].ColorFont_EL;
      FormMain.ST_EmptyLine.Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_EL);
    end
  else
    begin
      FormMain.ST_EmptyLine.Color      := FormMain.Color;
      FormMain.ST_EmptyLine.Font.Color := InvertColor(FormMain.Color);
    end;

  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadAscii)  = 0 then
    begin
      FormMain.STReadAscii.Color := FormMain.Color;
      FormMain.STReadAscii.Font.Color := InvertColor(FormMain.Color);
    end
  else
    begin
      FormMain.STReadAscii.Color := Settings.Preset[Settings.NumListMacros].ColorFont_RA;
      FormMain.STReadAscii.Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_RA);
    end;

  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadHex)  = 0 then
    begin
      FormMain.STReadHex.Color   := FormMain.Color;
      FormMain.STReadHex.Font.Color := InvertColor(FormMain.Color);
    end
  else
    begin
      FormMain.STReadHex.Color   := Settings.Preset[Settings.NumListMacros].ColorFont_RH;
      FormMain.STReadHex.Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_RH);
    end;

  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadDec)    = 0 then
    begin
      FormMain.STReadDec.Color   := FormMain.Color;
      FormMain.STReadDec.Font.Color := InvertColor(FormMain.Color);
    end
  else
    begin
      FormMain.STReadDec.Color   := Settings.Preset[Settings.NumListMacros].ColorFont_RD;
      FormMain.STReadDec.Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_RD);
    end;

  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadCustom) = 0 then
    begin
      FormMain.STReadCustom.Color:= FormMain.Color;
      FormMain.STReadCustom.Font.Color := InvertColor(FormMain.Color);
    end
  else
    begin
      FormMain.STReadCustom.Color:= Settings.Preset[Settings.NumListMacros].ColorFont_RC;
      FormMain.STReadCustom.Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_RC);
    end;

  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadUTF) = 0 then
    begin
      FormMain.StReadUTF8.Color:= FormMain.Color;
      FormMain.STReadUTF8.Font.Color := InvertColor(FormMain.Color);
    end
  else
    begin
      FormMain.STReadUTF8.Color:= Settings.Preset[Settings.NumListMacros].ColorFont_RU;
      FormMain.STReadUTF8.Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_RU);
    end;


  FormMain.STSendAscii.Color := FormMain.Color;
  FormMain.STSendHex.Color   := FormMain.Color;
  FormMain.STSendDec.Color   := FormMain.Color;

  FormMain.STSendAscii.Font.Color := InvertColor(FormMain.Color);
  FormMain.STSendHex.Font.Color   := InvertColor(FormMain.Color);
  FormMain.STSendDec.Font.Color   := InvertColor(FormMain.Color);


  if Settings.Preset[Settings.NumListMacros].DecodeMode = TDecodeMode.TDAscii then
    FormMain.STSendAscii.Color := Settings.Preset[Settings.NumListMacros].ColorFont_Send
  else if Settings.Preset[Settings.NumListMacros].DecodeMode = TDecodeMode.TDHex then
    FormMain.STSendHex.Color := Settings.Preset[Settings.NumListMacros].ColorFont_Send
  else if Settings.Preset[Settings.NumListMacros].DecodeMode = TDecodeMode.TDDec then
    FormMain.STSendDec.Color := Settings.Preset[Settings.NumListMacros].ColorFont_Send;
end;

procedure UpdateGUI;
begin
  UpdCondLineSep;
  UpdListPorts;
  UpdateListMacros;

  if Port = nil then
    UpdSettPort;

  UpdOutLogSettings;
  UpdSetPnlColor;

  FormMain.RBCom.Checked  := Settings.Connect = TConnect.TConnCom;
  FormMain.RBTcpC.Checked  := Settings.Connect = TConnect.TConnTcpClient;
  FormMain.RBTcpS.Checked  := Settings.Connect = TConnect.TConnTcpServer;

  FormMain.CHCnt.Checked  := Settings.Preset[Settings.NumListMacros].isShowCnt;
  FormMain.CHPort.Checked := Settings.Preset[Settings.NumListMacros].isShowPort;
  FormMain.CHDir.Checked  := Settings.Preset[Settings.NumListMacros].isShowDir;
  FormMain.CHMode.Checked := Settings.Preset[Settings.NumListMacros].isShowMode;
  FormMain.CHTime.Checked := Settings.Preset[Settings.NumListMacros].isShowTime;
  FormMain.RMMainLog.Clear;
  FormMain.RMAddLOg.Clear;
  FormMain.EdtSubString.Text      := Settings.Preset[Settings.NumListMacros].FilterStr;
  FormMain.CBCondFilter.ItemIndex := Integer(Settings.Preset[Settings.NumListMacros].CondFilter);
  FormMain.CBSkipReps.Checked     := Settings.Preset[Settings.NumListMacros].isSkipReps;

  FormMain.RBHelp.Checked := Settings.Preset[Settings.NumListMacros].ShowHelpMode = TShowHelpMode.TShowHelpMacros;
  FormMain.RBStat.Checked := Settings.Preset[Settings.NumListMacros].ShowHelpMode = TShowHelpMode.TShowStatPort;

  FormMain.PnlStatistics.Visible := Settings.Preset[Settings.NumListMacros].ShowHelpMode = TShowHelpMode.TShowStatPort;

  //TBModeOutLog.Checked := Settings.OutLogMode = TOutLogMode.TOutLogRtf;
  Settings.Preset[Settings.NumListMacros].OutLogMode  := SetOutLogMode(Settings.Preset[Settings.NumListMacros].OutLogMode);
  Settings.Preset[Settings.NumListMacros].OutLogMode  := SetOutLogMode(Settings.Preset[Settings.NumListMacros].OutLogMode);

  if Settings.Preset[Settings.NumListMacros].CondFilter <> TFilterLog.FL_NoFilter then
    FormMain.EdtSubString.Color := clYellow
  else
    FormMain.EdtSubString.Color := clWindow;




  FormMain.TmrUpdStatistics.Enabled := Settings.Preset[Settings.NumListMacros].ShowHelpMode = TShowHelpMode.TShowStatPort;

  FormMain.EdtCli.Text := Settings.Preset[Settings.NumListMacros].CmdStr;
  FormMain.EdtTail.Text := Settings.Preset[Settings.NumListMacros].TailStr;

  SetModeOutPeriod;

  //FormMain.BtnSend.Enabled := Settings.Preset[Settings.NumListMacros].OutMode <> TOutMode.TOutPeriod;

  if Settings.NameSettings = '' then
    FormMain.Caption := VERSION_MLT
  else
    FormMain.Caption := VERSION_MLT + '[ ' + Settings.NameSettings + ' ]';

end;


function LoadCfgDumpCfgFromFile(nameFile : string) : string;
var
  StrCfg : string;
begin
  assignfile(ConfigFile, nameFile);
  if FileExists(CONFIG_FILE_NAME_DUMP) then
    begin
      Reset(ConfigFile);
      while not Eof(ConfigFile) do
        begin
          ReadLn(ConfigFile, StrCfg);
          SetParam(StrCfg, nameFile, nil);
        end
    end
  else
    begin
      Rewrite(ConfigFile);
    end;
  CloseFile(ConfigFile);
  result := Settings.NameSettings;
end;

procedure SetLogFile;
var
  tmpstr : string;
  FileName   : string;
begin
  if (Settings.NameLogTxt = Settings.NameLogBin) and (Settings.NameLogTxt <> '') and (Settings.NameLogBin <> '') then
    begin
      FormMain.StTextLog.Caption := 'No logging is performed';
      FormMain.StBinLog.Caption := 'No logging is performed';
      exit;
    end;

  if (Settings.NameLogTxt = '') and Settings.isAutoStartLogTxt then
    begin
      FormMain.StTextLog.Caption := 'No file specified for writing the log';
    end;

  if (Settings.NameLogBin = '') and Settings.isAutoStartLogBin then
    begin
      FormMain.StBinLog.Caption := 'No file specified for writing the log';
    end;


  if Settings.NameFolderLog = '' then Settings.NameFolderLog := ExtractFilePath(ParamStr(0));
{$IOChecks off}
  if (Settings.NameLogTxt <> '') and Settings.isAutoStartLogTxt then
    begin
      try
      tmpstr := '';
      FileName := Settings.NameLogTxt;
      if Settings.isNewLogTxt then
        begin
          DateTimeToString(tmpstr, 'yyyy mm dd hh nn ss', now);
          FileName := StringReplace(FileName, ExtractFileExt(Settings.NameLogTxt), '', [rfIgnoreCase]);
          FileName := FileName + '_' + tmpstr + ExtractFileExt(Settings.NameLogTxt);
          AssignFile(TextFileLog, FileName);
          Rewrite(TextFileLog);
          Reset(TextFileLog);
          Append(TextFileLog);
          isLogTxt := true;
        end
      else if FileExists(Settings.NameLogTxt) then
        begin
          AssignFile(TextFileLog, FileName);
          Append(TextFileLog);
          isLogTxt := true;
        end
      else
        begin
          AssignFile(TextFileLog, FileName);
          Rewrite(TextFileLog);
          Reset(TextFileLog);
          Append(TextFileLog);
          isLogTxt := true;
        end;

      if FileExists(FileName) and isLogTxt then
        begin
          tmpstr := '';
          if Settings.isTxTxtLog then tmpStr := 'TX ';
          if Settings.isRxTxtLog then tmpStr := tmpStr + 'RX ';

          FormMain.StTextLog.Caption   := tmpStr + 'Log: ' + FileName;
          FormMain.MLogStopTxt.Enabled := true;
          FormMain.MLogPauseTxt.Enabled := true;
          FormMain.MLogStartTxt.Enabled := false;
        end
      else
        begin
          isLogTxt   := false;
          Settings.isTxTxtLog := false;
          Settings.isRxTxtLog := false;
          Settings.NameLogTxt := '';
          FormMain.StTextLog.Caption   := 'No write text log. ' + 'Error: ' + IntToStr(IOResult);
          FormMain.MLogStopTxt.Enabled := false;
          FormMain.MLogPauseTxt.Enabled := false;
          FormMain.MLogStartTxt.Enabled := false;
        end;
      except
      isLogTxt   := false;
      Settings.isTxTxtLog := false;
      Settings.isRxTxtLog := false;
      Settings.NameLogTxt := '';
      FormMain.StTextLog.Caption   := 'No write text log. ' + 'Error: ' + IntToStr(IOResult);
      FormMain.MLogStopTxt.Enabled := false;
      FormMain.MLogPauseTxt.Enabled := false;
      FormMain.MLogStartTxt.Enabled := false;
      end;
    end
  else
    begin
      FormMain.MLogStopTxt.Enabled := false;
      FormMain.MLogPauseTxt.Enabled := false;
      FormMain.MLogStartTxt.Enabled := false;
      isLogTxt := false;
      Settings.isRxTxtLog := false;
      Settings.isTxTxtLog := false;
      FormMain.StTextLog.Caption   := 'No write text log';
    end;

  curNameFileTxtLog := FileName;
 //=========================

  if (Settings.NameLogBin <> '') and Settings.isAutoStartLogBin then
    begin
      try
      tmpstr := '';
      FileName := Settings.NameLogBin;
      if Settings.isNewLogBin then
        begin
          DateTimeToString(tmpstr, 'yyyy mm dd hh nn ss', now);
          FileName := StringReplace(FileName, ExtractFileExt(Settings.NameLogBin), '', [rfIgnoreCase]);
          FileName := FileName + '_' + tmpstr + ExtractFileExt(Settings.NameLogBin);
          AssignFile(BinFileLog, FileName);
          Rewrite(BinFileLog);
          isLogBin := true;
        end
      else if FileExists(FileName) then
        begin
          AssignFile(BinFileLog, FileName);
          Rewrite(BinFileLog);
          Seek(BinFileLog, filesize(BinFileLog));
          isLogBin := true;
        end
      else
        begin
          AssignFile(BinFileLog, FileName);
          Rewrite(BinFileLog);
          isLogBin := true;
        end;

      if FileExists(FileName) and isLogBin then
        begin
          tmpStr := '';
          if Settings.isTxBinLog then tmpStr := 'TX ';
          if Settings.isRxBinLog then tmpStr := tmpStr + 'RX ';
          FormMain.StBinLog.Caption   := tmpStr + 'Log: ' + FileName;
          FormMain.MLogStopBin.Enabled  := true;
          FormMain.MLogPauseBin.Enabled := true;
          FormMain.MLogStartBin.Enabled := false;
        end
      else
        begin
          isLogBin   := false;
          Settings.isTxBinLog := false;
          Settings.isRxBinLog := false;
          Settings.NameLogBin := '';
          FormMain.StBinLog.Caption   := 'No write bin log. ' + 'Error: ' + IntToStr(IOResult);
          FormMain.MLogStopBin.Enabled := false;
          FormMain.MLogPauseBin.Enabled := false;
          FormMain.MLogStartBin.Enabled := false;
        end;
      except
      isLogBin   := false;
      Settings.isTxBinLog := false;
      Settings.isRxBinLog := false;
      Settings.NameLogBin := '';
      FormMain.StBinLog.Caption   := 'No write bin log. ' + 'Error: ' + IntToStr(IOResult);
      FormMain.MLogStopBin.Enabled := false;
      FormMain.MLogPauseBin.Enabled := false;
      FormMain.MLogStartBin.Enabled := false;
      end;
    end
  else
    begin
      FormMain.MLogStopBin.Enabled := false;
      FormMain.MLogPauseBin.Enabled := false;
      FormMain.MLogStartBin.Enabled := false;
      isLogBin := false;
      Settings.isRxBinLog := false;
      Settings.isTxBinLog := false;
      FormMain.StBinLog.Caption   := 'No write bin log';
    end;

  curNameFileBinLog := FileName;
{$IOChecks on}
end;





procedure TFormMain.FormCreate(Sender: TObject);
var i, j : integer;
begin
  begin
  CBAfter[1] := CBAfter1;
  CBAfter[2] := CBAfter2;
  CBAfter[3] := CBAfter3;
  CBAfter[4] := CBAfter4;

  CBBefore[1] := CBBef1;
  CBBefore[2] := CBBef2;
  CBBefore[3] := CBBef3;
  CBBefore[4] := CBBef4;


  EdtBufAfter[1, 0] := EdtA1_1;
  EdtBufAfter[1, 1] := EdtA1_2;
  EdtBufAfter[1, 2] := EdtA1_3;
  EdtBufAfter[1, 3] := EdtA1_4;
  EdtBufAfter[1, 4] := EdtA1_5;
  EdtBufAfter[1, 5] := EdtA1_6;
  EdtBufAfter[1, 6] := EdtA1_7;
  EdtBufAfter[1, 7] := EdtA1_8;

  EdtBufAfter[2, 0] := EdtA2_1;
  EdtBufAfter[2, 1] := EdtA2_2;
  EdtBufAfter[2, 2] := EdtA2_3;
  EdtBufAfter[2, 3] := EdtA2_4;
  EdtBufAfter[2, 4] := EdtA2_5;
  EdtBufAfter[2, 5] := EdtA2_6;
  EdtBufAfter[2, 6] := EdtA2_7;
  EdtBufAfter[2, 7] := EdtA2_8;

  EdtBufAfter[3, 0] := EdtA3_1;
  EdtBufAfter[3, 1] := EdtA3_2;
  EdtBufAfter[3, 2] := EdtA3_3;
  EdtBufAfter[3, 3] := EdtA3_4;
  EdtBufAfter[3, 4] := EdtA3_5;
  EdtBufAfter[3, 5] := EdtA3_6;
  EdtBufAfter[3, 6] := EdtA3_7;
  EdtBufAfter[3, 7] := EdtA3_8;

  EdtBufAfter[4, 0] := EdtA4_1;
  EdtBufAfter[4, 1] := EdtA4_2;
  EdtBufAfter[4, 2] := EdtA4_3;
  EdtBufAfter[4, 3] := EdtA4_4;
  EdtBufAfter[4, 4] := EdtA4_5;
  EdtBufAfter[4, 5] := EdtA4_6;
  EdtBufAfter[4, 6] := EdtA4_7;
  EdtBufAfter[4, 7] := EdtA4_8;

  EdtBufBefore[1, 0] := EdtB1_1;
  EdtBufBefore[1, 1] := EdtB1_2;
  EdtBufBefore[1, 2] := EdtB1_3;
  EdtBufBefore[1, 3] := EdtB1_4;
  EdtBufBefore[1, 4] := EdtB1_5;
  EdtBufBefore[1, 5] := EdtB1_6;
  EdtBufBefore[1, 6] := EdtB1_7;
  EdtBufBefore[1, 7] := EdtB1_8;

  EdtBufBefore[2, 0] := EdtB2_1;
  EdtBufBefore[2, 1] := EdtB2_2;
  EdtBufBefore[2, 2] := EdtB2_3;
  EdtBufBefore[2, 3] := EdtB2_4;
  EdtBufBefore[2, 4] := EdtB2_5;
  EdtBufBefore[2, 5] := EdtB2_6;
  EdtBufBefore[2, 6] := EdtB2_7;
  EdtBufBefore[2, 7] := EdtB2_8;

  EdtBufBefore[3, 0] := EdtB3_1;
  EdtBufBefore[3, 1] := EdtB3_2;
  EdtBufBefore[3, 2] := EdtB3_3;
  EdtBufBefore[3, 3] := EdtB3_4;
  EdtBufBefore[3, 4] := EdtB3_5;
  EdtBufBefore[3, 5] := EdtB3_6;
  EdtBufBefore[3, 6] := EdtB3_7;
  EdtBufBefore[3, 7] := EdtB3_8;

  EdtBufBefore[4, 0] := EdtB4_1;
  EdtBufBefore[4, 1] := EdtB4_2;
  EdtBufBefore[4, 2] := EdtB4_3;
  EdtBufBefore[4, 3] := EdtB4_4;
  EdtBufBefore[4, 4] := EdtB4_5;
  EdtBufBefore[4, 5] := EdtB4_6;
  EdtBufBefore[4, 6] := EdtB4_7;
  EdtBufBefore[4, 7] := EdtB4_8;

  for i := 1 to CNT_SEC_COND do
    for j := 0 to CNT_BYTE_SEP - 1 do
      begin
        EdtBufBefore[i, j].OnChange := @EdtByteCondChange;
        EdtBufAfter[i, j].OnChange := @EdtByteCondChange;
      end;

  BtnMacros[ 1] := BtnMacros1;
  BtnMacros[ 2] := BtnMacros2;
  BtnMacros[ 3] := BtnMacros3;
  BtnMacros[ 4] := BtnMacros4;
  BtnMacros[ 5] := BtnMacros5;
  BtnMacros[ 6] := BtnMacros6;
  BtnMacros[ 7] := BtnMacros7;
  BtnMacros[ 8] := BtnMacros8;
  BtnMacros[ 9] := BtnMacros9;
  BtnMacros[10] := BtnMacros10;

  BtnMacros[11] := BtnMacros11;
  BtnMacros[12] := BtnMacros12;
  BtnMacros[13] := BtnMacros13;
  BtnMacros[14] := BtnMacros14;
  BtnMacros[15] := BtnMacros15;
  BtnMacros[16] := BtnMacros16;
  BtnMacros[17] := BtnMacros17;
  BtnMacros[18] := BtnMacros18;
  BtnMacros[19] := BtnMacros19;
  BtnMacros[20] := BtnMacros20;

  BtnMacros[21] := BtnMacros21;
  BtnMacros[22] := BtnMacros22;
  BtnMacros[23] := BtnMacros23;
  BtnMacros[24] := BtnMacros24;
  BtnMacros[25] := BtnMacros25;
  BtnMacros[26] := BtnMacros26;
  BtnMacros[27] := BtnMacros27;
  BtnMacros[28] := BtnMacros28;
  BtnMacros[29] := BtnMacros29;
  BtnMacros[30] := BtnMacros30;

  BtnMacros[31] := BtnMacros31;
  BtnMacros[32] := BtnMacros32;
  BtnMacros[33] := BtnMacros33;
  BtnMacros[34] := BtnMacros34;
  BtnMacros[35] := BtnMacros35;
  BtnMacros[36] := BtnMacros36;
  BtnMacros[37] := BtnMacros37;
  BtnMacros[38] := BtnMacros38;
  BtnMacros[39] := BtnMacros39;
  BtnMacros[40] := BtnMacros40;

  BtnMacros[41] := BtnMacros41;
  BtnMacros[42] := BtnMacros42;
  BtnMacros[43] := BtnMacros43;
  BtnMacros[44] := BtnMacros44;
  BtnMacros[45] := BtnMacros45;
  BtnMacros[46] := BtnMacros46;
  BtnMacros[47] := BtnMacros47;
  BtnMacros[48] := BtnMacros48;
  BtnMacros[49] := BtnMacros49;
  BtnMacros[50] := BtnMacros50;

  BtnMacros[51] := BtnMacros51;
  BtnMacros[52] := BtnMacros52;
  BtnMacros[53] := BtnMacros53;
  BtnMacros[54] := BtnMacros54;
  BtnMacros[55] := BtnMacros55;
  BtnMacros[56] := BtnMacros56;
  BtnMacros[57] := BtnMacros57;
  BtnMacros[58] := BtnMacros58;
  BtnMacros[59] := BtnMacros59;
  BtnMacros[60] := BtnMacros60;

  BtnMacros[61] := BtnMacros61;
  BtnMacros[62] := BtnMacros62;
  BtnMacros[63] := BtnMacros63;
  BtnMacros[64] := BtnMacros64;

  EdtMacros[ 1] := EdtMacros1;
  EdtMacros[ 2] := EdtMacros2;
  EdtMacros[ 3] := EdtMacros3;
  EdtMacros[ 4] := EdtMacros4;
  EdtMacros[ 5] := EdtMacros5;
  EdtMacros[ 6] := EdtMacros6;
  EdtMacros[ 7] := EdtMacros7;
  EdtMacros[ 8] := EdtMacros8;
  EdtMacros[ 9] := EdtMacros9;
  EdtMacros[10] := EdtMacros10;

  EdtMacros[11] := EdtMacros11;
  EdtMacros[12] := EdtMacros12;
  EdtMacros[13] := EdtMacros13;
  EdtMacros[14] := EdtMacros14;
  EdtMacros[15] := EdtMacros15;
  EdtMacros[16] := EdtMacros16;
  EdtMacros[17] := EdtMacros17;
  EdtMacros[18] := EdtMacros18;
  EdtMacros[19] := EdtMacros19;
  EdtMacros[20] := EdtMacros20;
  EdtMacros[21] := EdtMacros21;
  EdtMacros[22] := EdtMacros22;
  EdtMacros[23] := EdtMacros23;
  EdtMacros[24] := EdtMacros24;
  EdtMacros[25] := EdtMacros25;
  EdtMacros[26] := EdtMacros26;
  EdtMacros[27] := EdtMacros27;
  EdtMacros[28] := EdtMacros28;
  EdtMacros[29] := EdtMacros29;
  EdtMacros[30] := EdtMacros30;
  EdtMacros[31] := EdtMacros31;
  EdtMacros[32] := EdtMacros32;
  EdtMacros[33] := EdtMacros33;
  EdtMacros[34] := EdtMacros34;
  EdtMacros[35] := EdtMacros35;
  EdtMacros[36] := EdtMacros36;
  EdtMacros[37] := EdtMacros37;
  EdtMacros[38] := EdtMacros38;
  EdtMacros[39] := EdtMacros39;
  EdtMacros[40] := EdtMacros40;
  EdtMacros[41] := EdtMacros41;
  EdtMacros[42] := EdtMacros42;
  EdtMacros[43] := EdtMacros43;
  EdtMacros[44] := EdtMacros44;
  EdtMacros[45] := EdtMacros45;
  EdtMacros[46] := EdtMacros46;
  EdtMacros[47] := EdtMacros47;
  EdtMacros[48] := EdtMacros48;
  EdtMacros[49] := EdtMacros49;
  EdtMacros[50] := EdtMacros50;
  EdtMacros[51] := EdtMacros51;
  EdtMacros[52] := EdtMacros52;
  EdtMacros[53] := EdtMacros53;
  EdtMacros[54] := EdtMacros54;
  EdtMacros[55] := EdtMacros55;
  EdtMacros[56] := EdtMacros56;
  EdtMacros[57] := EdtMacros57;
  EdtMacros[58] := EdtMacros58;
  EdtMacros[59] := EdtMacros59;
  EdtMacros[60] := EdtMacros60;
  EdtMacros[61] := EdtMacros61;
  EdtMacros[62] := EdtMacros62;
  EdtMacros[63] := EdtMacros63;
  EdtMacros[64] := EdtMacros64;
  end;

  for i := 1 to CNT_MACROS do
    begin
      EdtMacros[i].Visible:= false;

      EdtMacros[i].Tag := i;
      BtnMacros[i].Tag := i;

      EdtMacros[i].OnChange    := @FormMain.EdtMacrosChange;
      EdtMacros[i].OnClick     := @FormMain.EdtMacrosClick;
      BtnMacros[i].OnMouseMove := @FormMain.BtnMacrosMouseMove;
      BtnMacros[i].OnClick     := @FormMain.BtnMacrosClick;

      EdtMacros[i].OnDblClick  := @EdtMacrosDblClick;
    end;

  MakeRounded(STSendAscii);
  MakeRounded(STSendDec);
  MakeRounded(STSendHex);
  ModeMacros := MM_Name;
  ThrReadFile := nil;


  isModeEditMacros  := false;
  isPauseLog        := false;
  isPauseFileLOgTxt    := false;
  isPauseFileLOgBin    := false;


  isLogTxt          := false;
  isLogBin          := false;

  isSendFileProcess := false;

  StrLogOld         := '';
  CntShowRXBytes    := 0;
  CntShowTXBytes    := 0;

  CntRXPackets     := 0;
  CntTXPackets     := 0;

  CntMathSubstr     := 0;
  CntPortReconnect  := 0;
  curNameFileBinLog := '';
  curNameFileTxtLog := '';

  PauseRxMax     := 0;
  isEventNoRx    := false;

  NumCmdInList    := 0;
  CntCmdInList    := 0;
  isModeListCmd   := false;
  isSendLoop      := true;

  SetDefaultSettings(@Settings);

  CfgReadDumpCfgFromFile;

  inc(Settings.DiagData.CntStart);

  UpdateGUI;
  SetLogFile;
  Sleep(1);

  if Settings.Preset[Settings.NumListMacros].isAutoConnect and (Settings.PortName = FormMain.CBPortName.Items[FormMain.CBPortName.ItemIndex]) then
    FormMain.BtnConnect.Click;

  DTStart := now;
  TmrReadPort.Enabled := true;
end;

procedure TFormMain.LBCommandsClick(Sender: TObject);
var
  Cmd : string;
  Num    : Integer;
begin
  Num := (Sender as TListBox).ItemIndex;
  Cmd := (Sender as TListBox).Items[num];

  NumCmdInList := Num;
  EdtCli.Text := Cmd;
end;

procedure TFormMain.LBCommandsDblClick(Sender: TObject);
var
  Cmd : string;
  Num    : Integer;
  isEnSend : boolean;
begin
  if Port <> nil then
    begin
      isEnSend := false;
      case Settings.Connect of
        TConnect.TConnCom       : isEnSend := not TComPort(Port).GetIsBusyWrite;
        TConnect.TConnTcpClient : isEnSend := not TTcpPortClient(Port).GetIsBusyWrite;
        TConnect.TConnTcpServer : isEnSend := not TTcpPortServer(Port).GetIsBusyWrite;
      end;
      if isEnSend then
        begin
          Num := (Sender as TListBox).ItemIndex;
          Cmd := (Sender as TListBox).Items[num];
          StrCmd  := Cmd;
          StrTail := EdtTail.Text;
          SendPacket(@Port, Settings.Connect, StrCmd, StrTail);
        end;
    end;
end;

procedure TFormMain.MAboutClick(Sender: TObject);
begin
  FormInfo.LblVer.Caption   := VERSION_MLT;
  FormInfo.LblDonat.Caption := DONAT_MLT;
  FormInfo.ShowModal;
end;

procedure TFormMain.MCfgTmbClick(Sender: TObject);
var
  PresetTMB : array[1..MAX_CNT_LIST] of TPresetTMB;

  i, j : integer;
  isErr : boolean;
  ConfigFile: file of TPresetTMB;
begin
  if OpenFileDialog.Execute then
    begin
      assignfile(ConfigFile, OpenFileDialog.FileName);
      Reset(ConfigFile);
      i := 1;
      isErr := false;
      try
      while not eof(ConfigFile) and (i <= MAX_CNT_LIST) do
        begin
          Read(ConfigFile, PresetTMB[i]);

          inc(i);
        end;
      except
        isErr := true;
      end;
      CloseFile(ConfigFile);

      if not isErr then
        begin
          for i := 1 to MAX_CNT_LIST do
            begin
              Settings.Preset[i].CmdStr         := PresetTMB[i].CmdStr;
              Settings.Preset[i].isShowCnt      := PresetTMB[i].isVisCnt;
              Settings.Preset[i].isShowDir      := PresetTMB[i].isVisDir;
              Settings.Preset[i].isShowTime     := PresetTMB[i].isVisTime;
              Settings.Preset[i].isShowPort     := PresetTMB[i].isVisPort;
              Settings.Preset[i].ReadMode       := byte(1 shl integer(PresetTMB[i].ReadMode));
              Settings.Preset[i].DecodeMode     := TDecodeMode(PresetTMB[i].SendMode);
              Settings.Preset[i].FilterStr      := PresetTMB[i].FiltrStr[1];
              Settings.Preset[i].IsClearLogEnter:= PresetTMB[i].isClrLogWhSend;
              Settings.Preset[i].NameMacrosList := PresetTMB[i].NameList;
              for j := 1 to 48 do
                begin
                  Settings.Preset[i].MacrosName[j] := PresetTMB[i].CmdName[j];
                  Settings.Preset[i].MacrosCmd[j]  := PresetTMB[i].CmdData[j];
                end;
            end;
          UpdateGUI;
        end;
    end;

end;

procedure TFormMain.MColorsClick(Sender: TObject);
begin
  FormColors.ColorBG_TXT    := Settings.Preset[Settings.NumListMacros].ColorBG_TXT;
  FormColors.ColorBG_RTF    := Settings.Preset[Settings.NumListMacros].ColorBG_RTF;
  FormColors.ColorBG_PAUSE_TXT  := Settings.Preset[Settings.NumListMacros].ColorBG_PAUSE_TXT;
  FormColors.ColorBG_PAUSE_RTF  := Settings.Preset[Settings.NumListMacros].ColorBG_PAUSE_RTF;
  FormColors.ColorFont_TXT  := Settings.Preset[Settings.NumListMacros].ColorFont_TXT;
  FormColors.ColorFont_Send := Settings.Preset[Settings.NumListMacros].ColorFont_Send;
  FormColors.ColorFont_RA   := Settings.Preset[Settings.NumListMacros].ColorFont_RA;
  FormColors.ColorFont_RH   := Settings.Preset[Settings.NumListMacros].ColorFont_RH;
  FormColors.ColorFont_RD   := Settings.Preset[Settings.NumListMacros].ColorFont_RD;
  FormColors.ColorFont_RC   := Settings.Preset[Settings.NumListMacros].ColorFont_RC;
  FormColors.ColorFont_RU   := Settings.Preset[Settings.NumListMacros].ColorFont_RU;
  FormColors.ColorFont_EL   := Settings.Preset[Settings.NumListMacros].ColorFont_EL;
  FormColors.ColorFont_SM   := Settings.Preset[Settings.NumListMacros].ColorFont_SM;
  FormColors.FontSize       := Settings.Preset[Settings.NumListMacros].FontSizeLog;
  FormColors.EmptLine       := Settings.Preset[Settings.NumListMacros].EmptyLine;
  FormColors.MaxLenLog      := Settings.Preset[Settings.NumListMacros].MaxLenLog;
  FormColors.IsClearLogEnter:= Settings.Preset[Settings.NumListMacros].IsClearLogEnter;

  FormColors.isControlPauseRX := Settings.Preset[Settings.NumListMacros].isControlPauseRX;
  FormColors.PauseRXms        := Settings.Preset[Settings.NumListMacros].PauseRXms;
  FormColors.ColorPauseRX     := Settings.Preset[Settings.NumListMacros].ColorPauseRX;
  FormColors.isDateInTimeStamp := Settings.Preset[Settings.NumListMacros].isDateInTimeStamp;
  FormColors.isNonPrintASCII   := Settings.Preset[Settings.NumListMacros].isNonPrintASCII;

  FormColors.ColorBG_AlarmLost := Settings.Preset[Settings.NumListMacros].ColorBG_ConnectLost;
  FormColors.isAlarmConnectLost:= Settings.Preset[Settings.NumListMacros].isAlarmConnectLost;

  TmrReadPort.Interval := 500;
  FormColors.ShowModal;
  TmrReadPort.Interval := 5;
  if FormColors.isOK then
    begin
      Settings.Preset[Settings.NumListMacros].ColorBG_TXT       := FormColors.ColorBG_TXT;
      Settings.Preset[Settings.NumListMacros].ColorBG_RTF       := FormColors.ColorBG_RTF;
      Settings.Preset[Settings.NumListMacros].ColorBG_PAUSE_TXT := FormColors.ColorBG_PAUSE_TXT;
      Settings.Preset[Settings.NumListMacros].ColorBG_PAUSE_RTF := FormColors.ColorBG_PAUSE_RTF;
      Settings.Preset[Settings.NumListMacros].ColorFont_TXT     := FormColors.ColorFont_TXT;
      Settings.Preset[Settings.NumListMacros].ColorFont_Send    := FormColors.ColorFont_Send;
      Settings.Preset[Settings.NumListMacros].ColorFont_RA      := FormColors.ColorFont_RA;
      Settings.Preset[Settings.NumListMacros].ColorFont_RH      := FormColors.ColorFont_RH;
      Settings.Preset[Settings.NumListMacros].ColorFont_RD      := FormColors.ColorFont_RD;
      Settings.Preset[Settings.NumListMacros].ColorFont_RC      := FormColors.ColorFont_RC;
      Settings.Preset[Settings.NumListMacros].ColorFont_RU      := FormColors.ColorFont_RU;
      Settings.Preset[Settings.NumListMacros].ColorFont_EL      := FormColors.ColorFont_EL;
      Settings.Preset[Settings.NumListMacros].ColorFont_SM      := FormColors.ColorFont_SM;
      Settings.Preset[Settings.NumListMacros].FontSizeLog       := FormColors.FontSize;
      Settings.Preset[Settings.NumListMacros].EmptyLine         := FormColors.EmptLine;
      Settings.Preset[Settings.NumListMacros].MaxLenLog         := FormColors.MaxLenLog;
      Settings.Preset[Settings.NumListMacros].IsClearLogEnter   := FormColors.isClearLogEnter;

      Settings.Preset[Settings.NumListMacros].isControlPauseRX  := FormColors.isControlPauseRX;
      Settings.Preset[Settings.NumListMacros].PauseRXms         := FormColors.PauseRXms;
      Settings.Preset[Settings.NumListMacros].ColorPauseRX      := FormColors.ColorPauseRX;

      Settings.Preset[Settings.NumListMacros].isDateInTimeStamp := FormColors.isDateInTimeStamp;
      Settings.Preset[Settings.NumListMacros].isNonPrintASCII   := FormColors.isNonPrintASCII;

      Settings.Preset[Settings.NumListMacros].ColorBG_ConnectLost := FormColors.ColorBG_AlarmLost;
      Settings.Preset[Settings.NumListMacros].isAlarmConnectLost  := FormColors.isAlarmConnectLost;

      UpdOutLogSettings;
      UpdSetPnlColor;
    end;
end;

procedure TFormMain.MCustomDecodeClick(Sender: TObject);
begin
  FormCustomDecode.Caption := 'Custom decoding table for the "' + Settings.Preset[Settings.NumListMacros].NameMacrosList + '" configuration';
  FormCustomDecode.ItemStr := @Settings.Preset[Settings.NumListMacros].ItCustDecode;
  FormCustomDecode.ShowModal;
end;

procedure TFormMain.MHelpEditChange(Sender: TObject);
begin
  if (NumCurMacros > 0) and not isModeEditMacros then
    Settings.Preset[Settings.NumListMacros].MacrosHelp[NumCurMacros] := StringReplace((Sender as TMemo).Text, #13#10, '[$0D$0A]', [rfReplaceAll]);
end;

procedure TFormMain.MHelpEditClick(Sender: TObject);
begin
    EdtMacros[NumCurMacros].Color := clYellow;
end;

procedure TFormMain.MHelpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := 0;
end;

procedure TFormMain.MHelpMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TFormMain.MLogNewBinClick(Sender: TObject);
var tmpstr : string;
begin
  FormLogFileNew.FolderInit := Settings.NameFolderLog;
  FormLogFileNew.Caption := 'Selecting a BINARY log file';
  FormLogFileNew.CBEventsLog.Visible := false;
  FormLogFileNew.isEvTxtLog := true;
  TmrReadPort.Interval := 500;
  FormLogFileNew.ShowModal;
  TmrReadPort.Interval := 5;
  if FormLogFileNew.isOk then
    begin
      if FormLogFileNew.isLog then
        begin
          if isLogBin then
            begin
              CloseFile(BinFileLog);
              isLogBin   := false;
            end;

          isPauseFileLogBin      := false;
          isLogBin   := false;
          Settings.isTxBinLog := false;
          Settings.isRxBinLog := false;

          Settings.NameLogBin := FormLogFileNew.NameLogFile;
          if (Settings.NameLogTxt = Settings.NameLogBin) and (Settings.NameLogBin <> '') and (Settings.NameLogTxt <> '') then
            begin
              ShowMessage('The names of the text and binary files must not match!');
              Settings.NameLogBin := '';
              StBinLog.Caption   := 'Err name file';
              exit;
            end;
{$IOChecks off}
          try
            if (not FileExists(Settings.NameLogBin)) or (FormLogFileNew.isRewrite) then
              begin
                AssignFile(BinFileLog, Settings.NameLogBin);
                Rewrite(BinFileLog);
                isLogBin   := true;
              end
            else
              begin
                AssignFile(BinFileLog, Settings.NameLogBin);
                Rewrite(BinFileLog);
                Seek(BinFileLog, filesize(BinFileLog));
                isLogBin   := true;
              end;


            if (FileExists(Settings.NameLogBin)) and isLogBin then
              begin
                Settings.isTxBinLog := FormLogFileNew.isTxLog;
                Settings.isRxBinLog := FormLogFileNew.isRxLog;

                tmpStr := '';
                if Settings.isTxBinLog then tmpStr := 'TX ';
                if Settings.isRxBinLog then tmpStr := tmpStr + 'RX ';

                StBinLog.Caption   := tmpstr + 'Log: ' + Settings.NameLogBin;
                FormMain.MLogStopBin.Enabled  := true;
                FormMain.MLogPauseBin.Enabled := true;
                FormMain.MLogStartBin.Enabled := false;
              end
            else
              begin
                isLogBin   := false;
                Settings.isTxBinLog := false;
                Settings.isRxBinLog := false;
                Settings.NameLogBin := '';
                StBinLog.Caption   := 'No write log. ' + 'Error: ' + IntToStr(IOResult);
                FormMain.MLogStopBin.Enabled  := false;
                FormMain.MLogPauseBin.Enabled := false;
                FormMain.MLogStartBin.Enabled := false;
              end;
          except
            isLogBin   := false;
            Settings.isTxBinLog := false;
            Settings.isRxBinLog := false;
            Settings.NameLogBin := '';
            StBinLog.Caption   := 'No write log. ' + 'Error: ' + IntToStr(IOResult);

            FormMain.MLogStopBin.Enabled  := false;
            FormMain.MLogPauseBin.Enabled := false;
            FormMain.MLogStartBin.Enabled := false;

          end;
{$IOChecks on}
        if isLogBin then
          curNameFileBinLog := Settings.NameLogBin;

        end;
    end;
end;

procedure TFormMain.MLogNewTxtClick(Sender: TObject);
var
  tmpstr : string;
begin
  FormLogFileNew.FolderInit := Settings.NameFolderLog;
  FormLogFileNew.Caption    := 'Selecting a TEXT log file';
  FormLogFileNew.CBEventsLog.Visible := true;
  TmrReadPort.Interval := 500;
  FormLogFileNew.ShowModal;
  TmrReadPort.Interval := 5;
  if FormLogFileNew.isOk then
    begin
      if FormLogFileNew.isLog then
        begin
          if isLogTxt then
            begin
              CloseFile(TextFileLog);
              isLogTxt   := false;
            end;

          isPauseFileLogTxt      := false;
          isLogTxt   := false;
          Settings.isTxTxtLog := false;
          Settings.isRxTxtLog := false;

          Settings.NameLogTxt := FormLogFileNew.NameLogFile;
          if (Settings.NameLogTxt = Settings.NameLogBin) and (Settings.NameLogBin <> '') and (Settings.NameLogTxt <> '') then
            begin
              ShowMessage('The names of the text and binary files must not match!');
              Settings.NameLogTxt := '';
              StTextLog.Caption   := 'Err name file';
              exit;
            end;

{$IOChecks off}
          try
            if (not FileExists(Settings.NameLogTxt)) or (FormLogFileNew.isRewrite) then
              begin
                AssignFile(TextFileLog, Settings.NameLogTxt);
                Rewrite(TextFileLog);
                isLogTxt   := true;
              end
            else
              begin
                AssignFile(TextFileLog, Settings.NameLogTxt);
                Append(TextFileLog);
                isLogTxt   := true;
              end;


            if (FileExists(Settings.NameLogTxt)) and isLogTxt then
              begin
                Settings.isTxTxtLog := FormLogFileNew.isTxLog;
                Settings.isRxTxtLog := FormLogFileNew.isRxLog;
                Settings.isEvTxtLog := FormLogFileNew.isEvTxtLog;

                tmpStr := '';
                if Settings.isTxTxtLog then tmpStr := 'TX ';
                if Settings.isRxTxtLog then tmpStr := tmpStr + 'RX ';

                StTextLog.Caption   := tmpstr + 'Log: ' + Settings.NameLogTxt;
                FormMain.MLogStopTxt.Enabled  := true;
                FormMain.MLogPauseTxt.Enabled := true;
                FormMain.MLogStartTxt.Enabled := false;
              end
            else
              begin
                isLogTxt   := false;
                Settings.isTxTxtLog := false;
                Settings.isRxTxtLog := false;
                Settings.NameLogTxt := '';
                StTextLog.Caption   := 'No write log. ' + 'Error: ' + IntToStr(IOResult);
                FormMain.MLogStopTxt.Enabled  := false;
                FormMain.MLogPauseTxt.Enabled := false;
                FormMain.MLogStartTxt.Enabled := false;
              end;
          except
            isLogTxt   := false;
            Settings.isTxTxtLog := false;
            Settings.isRxTxtLog := false;
            Settings.NameLogTxt := '';
            StTextLog.Caption   := 'No write log. ' + 'Error: ' + IntToStr(IOResult);

            FormMain.MLogStopTxt.Enabled  := false;
            FormMain.MLogPauseTxt.Enabled := false;
            FormMain.MLogStartTxt.Enabled := false;

          end;
{$IOChecks on}
        if isLogTxt then
          curNameFileTxtLog := Settings.NameLogTxt;
        end;
    end;
end;

procedure TFormMain.MLogPauseBinClick(Sender: TObject);
begin
  isPauseFileLogBin := true;
  FormMain.MLogStopBin.Enabled  := true;
  FormMain.MLogPauseBin.Enabled := false;
  FormMain.MLogStartBin.Enabled := true;
  StBinLog.Caption   := 'Pause log: ' + Settings.NameLogBin;
end;

procedure TFormMain.MLogPauseTxtClick(Sender: TObject);
begin
  isPauseFileLogTxt := true;
  FormMain.MLogStopTxt.Enabled  := true;
  FormMain.MLogPauseTxt.Enabled := false;
  FormMain.MLogStartTxt.Enabled := true;
  StTextLog.Caption   := 'Pause log: ' + Settings.NameLogTxt;
end;

procedure TFormMain.MLogSettingsClick(Sender: TObject);
begin
  FormLogSetting.Directory     := Settings.NameFolderLog;
  FormLogSetting.isAutoLogText := Settings.isAutoStartLogTxt;
  FormLogSetting.isAutoLogBin  := Settings.isAutoStartLogBin;
  FormLogSetting.isNewLogText  := Settings.isNewLogTxt;
  FormLogSetting.isNewLogBin   := Settings.isNewLogBin;

  TmrReadPort.Interval := 500;
  FormLogSetting.ShowModal;
  TmrReadPort.Interval := 5;

  if FormLogSetting.isOk then
    begin
      Settings.NameFolderLog     := FormLogSetting.Directory;
      Settings.isAutoStartLogTxt := FormLogSetting.isAutoLogText;
      Settings.isAutoStartLogBin := FormLogSetting.isAutoLogBin;
      Settings.isNewLogTxt       := FormLogSetting.isNewLogText;
      Settings.isNewLogBin       := FormLogSetting.isNewLogBin;
    end;
end;

procedure TFormMain.MLogStartBinClick(Sender: TObject);
var tmpstr : string;
begin
  isPauseFileLogBin := false;
  FormMain.MLogStopBin.Enabled  := true;
  FormMain.MLogPauseBin.Enabled := true;
  FormMain.MLogStartBin.Enabled := false;
  tmpStr := '';
  if Settings.isTxBinLog then tmpStr := 'TX ';
  if Settings.isRxBinLog then tmpStr := tmpStr + 'RX ';
  StBinLog.Caption   := tmpstr + 'Log: ' + Settings.NameLogBin;
end;

procedure TFormMain.MLogStartTxtClick(Sender: TObject);
var tmpstr : string;
begin
  isPauseFileLogTxt := false;
  FormMain.MLogStopTxt.Enabled  := true;
  FormMain.MLogPauseTxt.Enabled := true;
  FormMain.MLogStartTxt.Enabled := false;

  tmpStr := '';
  if Settings.isTxTxtLog then tmpStr := 'TX ';
  if Settings.isRxTxtLog then tmpStr := tmpStr + 'RX ';

  StTextLog.Caption   := tmpstr + 'Log: ' + Settings.NameLogTxt;
end;

procedure TFormMain.MLogStopBinClick(Sender: TObject);
begin
  isPauseFileLogBin := true;
  FormMain.MLogStopBin.Enabled  := false;
  FormMain.MLogPauseBin.Enabled := false;
  FormMain.MLogStartBin.Enabled := false;

  if isLogBin then
    begin
      isLogBin   := false;
      Settings.isTxBinLog := false;
      Settings.isRxBinLog := false;
      StBinLog.Caption   := 'Stop log: ' + curNameFileBinLog;
      CloseFile(BinFileLog);
    end;
end;

procedure TFormMain.MLogStopTxtClick(Sender: TObject);
begin
  isPauseFileLogTxt := true;
  FormMain.MLogStopTxt.Enabled  := false;
  FormMain.MLogPauseTxt.Enabled := false;
  FormMain.MLogStartTxt.Enabled := false;

  if isLogTxt then
    begin
      isLogTxt   := false;
      Settings.isTxTxtLog := false;
      Settings.isRxTxtLog := false;
      StTextLog.Caption   := 'Stop log: ' + curNameFileTxtLog;
      CloseFile(TextFileLog);
    end;
end;


procedure TFormMain.BtnPauseLogClick(Sender: TObject);
begin
  isPauseLog := PauseLog(isPauseLog);
end;

procedure SetPanelSettingsPort(isPortOK : boolean; Connect : TConnect);
begin
  FormMain.CBPortName.Enabled     := not isPortOK;
  FormMain.CBPortBaudRate.Enabled := not isPortOK;
  FormMain.CBBits.Enabled         := not isPortOK;
  FormMain.CBComParity.Enabled    := not isPortOK;
  FormMain.CBStopBits.Enabled     := not isPortOK;
  FormMain.CBSF.Enabled           := not isPortOK;
  FormMain.CBHF.Enabled           := not isPortOK;

  FormMain.RBCom.Enabled          := not isPortOK;
  FormMain.RBTcpC.Enabled          := not isPortOK;
  FormMain.EdtServerC.Enabled      := not isPortOK;
  FormMain.EdtPortC.Enabled        := not isPortOK;

  FormMain.RBTcpS.Enabled          := not isPortOK;
  FormMain.EdtServerS.Enabled      := not isPortOK;
  FormMain.EdtPortS.Enabled        := not isPortOK;

  FormMain.CBPortName.Color     := clWindow;
  FormMain.CBPortBaudRate.Color := clWindow;
  FormMain.CBBits.Color         := clWindow;
  FormMain.CBComParity.Color    := clWindow;
  FormMain.CBStopBits.Color     := clWindow;
  FormMain.CBSF.Color           := clWindow;
  FormMain.CBHF.Color           := clWindow;

  FormMain.EdtServerS.Color     := clWindow;
  FormMain.EdtPortS.Color       := clWindow;

  FormMain.EdtServerC.Color     := clWindow;
  FormMain.EdtPortC.Color       := clWindow;

  if isPortOK then
    Case Connect of
      TConnect.TConnCom :
        begin
          FormMain.CBPortName.Color     := clLime;
          FormMain.CBPortBaudRate.Color := clLime;
          FormMain.CBBits.Color         := clLime;
          FormMain.CBComParity.Color    := clLime;
          FormMain.CBStopBits.Color     := clLime;
          FormMain.CBSF.Color           := clLime;
          FormMain.CBHF.Color           := clLime;
        end;
      TConnect.TConnTcpClient :
        begin
          FormMain.EdtServerC.Color     := clLime;
          FormMain.EdtPortC.Color       := clLime;
        end;
      TConnect.TConnTcpServer :
        begin
          FormMain.EdtServerS.Color     := clLime;
          FormMain.EdtPortS.Color       := clLime;
        end;
    end;
end;



procedure BubbleSortBaudRates;
var
  I, J, Temp: Integer;
begin
  for I := 10 to MAX_CNT_BAUDRATES - 1 do
    for J := I + 1 to MAX_CNT_BAUDRATES - 1 do
      if (Settings.Preset[Settings.NumListMacros].BaudRateS[I] > Settings.Preset[Settings.NumListMacros].BaudRateS[J]) and (Settings.Preset[Settings.NumListMacros].BaudRateS[J] > 0) then
      begin
        Temp := Settings.Preset[Settings.NumListMacros].BaudRateS[I];
        Settings.Preset[Settings.NumListMacros].BaudRateS[I] := Settings.Preset[Settings.NumListMacros].BaudRateS[J];
        Settings.Preset[Settings.NumListMacros].BaudRateS[J] := Temp;
      end;
end;

procedure AddBaudRateInList(br : Cardinal);
var
  isUse : boolean;
  i, j  : integer;
begin
  i := 0;
  isUse := false;

  while (i < MAX_CNT_BAUDRATES) and not isUse do
    begin
      if Settings.Preset[Settings.NumListMacros].BaudRateS[i] = br then
        begin
          isUse := true;
        end;
      inc(i);
    end;

  for i := 10 to MAX_CNT_BAUDRATES - 1 do
    for j := i + 1 to MAX_CNT_BAUDRATES - 1 do
      if Settings.Preset[Settings.NumListMacros].BaudRateS[j] = Settings.Preset[Settings.NumListMacros].BaudRateS[i] then
        Settings.Preset[Settings.NumListMacros].BaudRateS[j] := 0;

  i := 0;
  while (i < MAX_CNT_BAUDRATES - 1) and not isUse do
    begin
      if Settings.Preset[Settings.NumListMacros].BaudRateS[i] = 0 then
        begin
          Settings.Preset[Settings.NumListMacros].BaudRateS[i] := br;
          isUse := true;
        end;
      inc(i);
    end;

  if not isUse then
    Settings.Preset[Settings.NumListMacros].BaudRateS[i - 1] := br;

  BubbleSortBaudRates;
end;

procedure PortConnect(Connect : TConnect);
var
  PortName : string;
  BaudRate : Cardinal;
  bits     : integer;
  Parity   : TParity;
  StopBits : TStopBits;
  softflow, hardflow: boolean;
begin
  if Port = nil then
    begin
      Case Connect of
        TConnect.TConnCom :
          begin
            if FormMain.CBPortName.Items.Count > 0 then
              begin
                PortName := Trim(FormMain.CBPortName.Items[FormMain.CBPortName.ItemIndex]);
                try
                  BaudRate := StrToInt(Trim(FormMain.CBPortBaudRate.Text));
                except
                  BaudRate := Settings.Preset[Settings.NumListMacros].BaudRate;
                  FormMain.CBPortBaudRate.Text := IntToStr(BaudRate);
                end;
                bits     := StrToInt(Trim(FormMain.CBBits.Items[FormMain.CBBits.ItemIndex]));
                Parity   := TParity(FormMain.CBComParity.ItemIndex);
                StopBits := TStopBits(FormMain.CBStopBits.ItemIndex);
                softflow := FormMain.CBSF.Checked;
                hardflow := FormMain.CBHF.Checked;
                Port     := ComPortGet(PortName, BaudRate, bits, Parity, StopBits, softflow, hardflow);
              end;
          end;

        TConnect.TConnTcpClient:
          begin
            Port := TcpClientGet(Trim(Settings.Preset[Settings.NumListMacros].IP_C), Settings.Preset[Settings.NumListMacros].IPPortC);
          end;

        TConnect.TConnTcpServer:
          begin
            Port := TcpServerGet(Trim(Settings.Preset[Settings.NumListMacros].IP_S), Settings.Preset[Settings.NumListMacros].IPPortS);
          end;
      end;

      if Port = nil then
        case Connect of
          TConnect.TConnCom       : begin
                                      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Port open ERROR' , Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                    end;
          TConnect.TConnTcpClient : begin
                                      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Client connect ERROR' , Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                    end;
          TConnect.TConnTcpServer : begin
                                      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Server start ERROR' , Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                    end;
        end
      else
        case Connect of
          TConnect.TConnCom       : begin
                                      TComPort(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
                                      Settings.PortName := TComPort(Port).GetName;
                                      Settings.Preset[Settings.NumListMacros].BaudRate := BaudRate;
                                      AddBaudRateInList(BaudRate);
                                      Settings.Preset[Settings.NumListMacros].bits     := bits;
                                      Settings.Preset[Settings.NumListMacros].Parity   := Parity;
                                      Settings.Preset[Settings.NumListMacros].StopBits := StopBits;
                                      Settings.Preset[Settings.NumListMacros].softflow := softflow;
                                      Settings.Preset[Settings.NumListMacros].hardflow := hardflow;
                                      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Port is open "' + TComPort(Port).GetDescriptor + '"', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                    end;
          TConnect.TConnTcpClient : begin
                                      TTcpPortClient(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
                                      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Client is connect "' + TTcpPortClient(Port).GetName + '"', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                    end;
          TConnect.TConnTcpServer : begin
                                      TTcpPortServer(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
                                      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Server is start "' + TTcpPortServer(Port).GetName + '"', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                    end;
        end;
    end
  else
    begin
      Case Connect of
        TConnect.TConnCom      : TComPort(Port).Free;
        TConnect.TConnTcpClient: TTcpPortClient(Port).Free;
        TConnect.TConnTcpServer: TTcpPortServer(Port).Free;
      end;
      Sleep(10);
      Port := nil;
    end;

  if Port <> nil then
    begin
      inc(CntPortReconnect);
      FormMain.RMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorBG_RTF;
      FormMain.TMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorBG_TXT;
      FormMain.BtnSend.Enabled := true;
      FormMain.PnlBtSend.Color := clGreen;
    end;
end;



procedure TFormMain.BtnConnectClick(Sender: TObject);

begin
  CntShowRXBytes := 0;
  CntShowTXBytes := 0;
  CntRXPackets   := 0;
  CntTXPackets   := 0;
  CntMathSubstr  := 0;

  if Port <> nil then
    begin
      try
        case Settings.Connect of
          TConnect.TConnCom       : TComPort(Port).Free;
          TConnect.TConnTcpClient : TTcpPortClient(Port).Free;
          TConnect.TConnTcpServer : TTcpPortServer(Port).Free;
        end;
      finally
        Sleep(10);
        Port := nil;
      end;
    end
  else
    PortConnect(Settings.Connect);

  if Port = nil then
    begin
      (Sender as TButton).Caption := 'Connect';
      PnlPort.Visible := true;
      BtnPort.Hint := '';
      UpdSettPort;
    end
  else
    begin
     (Sender as TButton).Caption := 'DisConnect';
     case Settings.Connect of
       TConnect.TConnCom       : BtnPort.Hint := TComPort(Port).GetName + ' ' + IntToStr(Settings.Preset[Settings.NumListMacros].BaudRate) + 'b/s';
       TConnect.TConnTcpClient : BtnPort.Hint := 'TCP Client ' + TTcpPortClient(Port).GetName;
       TConnect.TConnTcpServer : BtnPort.Hint := 'TCP Server ' + TTcpPortServer(Port).GetName;
     end;
     PnlPort.Visible := false;
    end;

  SetPanelSettingsPort(Port <> nil, Settings.Connect);
end;


procedure TFormMain.BtnLineSepClick(Sender: TObject);
begin
  PnlLineSep.Visible := not PnlLineSep.Visible;
  if Port <> nil then
    case Settings.Connect of
      TConnect.TConnCom       : Settings.Preset[Settings.NumListMacros].CondOut := TComPort(Port).GetCondOut;
      TConnect.TConnTcpClient : Settings.Preset[Settings.NumListMacros].CondOut := TTcpPortClient(Port).GetCondOut;
      TConnect.TConnTcpServer : Settings.Preset[Settings.NumListMacros].CondOut := TTcpPortServer(Port).GetCondOut;
    end;
  UpdCondLineSep;
  BtnWrite.Enabled := false;
end;




procedure TFormMain.BtnPortClick(Sender: TObject);
begin
  PnlPort.Visible := not PnlPort.Visible;
  if PnlPort.Visible then
    UpdListPorts;
end;

procedure TFormMain.BtnReadClick(Sender: TObject);
begin

end;

procedure TFormMain.BtnSendKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TFormMain.BtnSendMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

end;

procedure TFormMain.BtnUpdPortClick(Sender: TObject);
begin
   UpdListPorts;
end;

procedure TFormMain.BtnWriteClick(Sender: TObject);
var
  i, j : byte;
begin
  Settings.Preset[Settings.NumListMacros].CondOut.isCntByte := CBCntByte.Checked;
  Settings.Preset[Settings.NumListMacros].CondOut.isTimeOut := CBTimeOut.Checked;
  Settings.Preset[Settings.NumListMacros].CondOut.CntByte   := StrToInt(EdtCntByte.Text);
  Settings.Preset[Settings.NumListMacros].CondOut.Timeout   := StrToInt(EdtTimeOut.Text);
  for i := 1 to CNT_SEC_COND do
    begin
      Settings.Preset[Settings.NumListMacros].CondOut.isAfter[i] := CBAfter[i].Checked;                      //флаг для разбиения на подпакеты после последовательности
      for j := 0 to CNT_BYTE_SEP - 1 do
        case Trim(EdtBufAfter[i, j].Text) of
        '--' :
            Settings.Preset[Settings.NumListMacros].CondOut.buf_after[i, j] := SYMBOL_ANY;
          '' :
            Settings.Preset[Settings.NumListMacros].CondOut.buf_after[i, j] := SYMBOL_EMPT;
          else
            Settings.Preset[Settings.NumListMacros].CondOut.buf_after[i, j] := StrToHex(EdtBufAfter[i, j].Text);
        end;

      Settings.Preset[Settings.NumListMacros].CondOut.isBefore[i] := CBBefore[i].Checked;
      for j := 0 to CNT_BYTE_SEP - 1 do
        case Trim(EdtBufBefore[i, j].Text) of
          '--' :
            Settings.Preset[Settings.NumListMacros].CondOut.buf_before[i, j] := SYMBOL_ANY;
          '' :
            Settings.Preset[Settings.NumListMacros].CondOut.buf_before[i, j] := SYMBOL_EMPT;
          else
            Settings.Preset[Settings.NumListMacros].CondOut.buf_before[i, j] := StrToHex(EdtBufBefore[i, j].Text);
        end;
    end;

  if Port <> nil then
    begin
      case Settings.Connect of
        TConnect.TConnCom       : begin
                                    TComPort(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
                                    Settings.Preset[Settings.NumListMacros].CondOut := TComPort(Port).GetCondOut;
                                  end;
        TConnect.TConnTcpClient : begin
                                    TTcpPortClient(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
                                    Settings.Preset[Settings.NumListMacros].CondOut := TTcpPortClient(Port).GetCondOut;
                                  end;
        TConnect.TConnTcpServer : begin
                                    TTcpPortServer(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
                                    Settings.Preset[Settings.NumListMacros].CondOut := TTcpPortServer(Port).GetCondOut;
                                  end;
      end;
      UpdCondLineSep;
    end;
  (Sender as TButton).Enabled := false;
end;

procedure TFormMain.CBAfter1Click(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CBAfter2Click(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CBAfter3Click(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CBAfter4Click(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;



procedure TFormMain.CBAutoConnectChange(Sender: TObject);
begin

end;

procedure TFormMain.CBAutoConnectClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isAutoConnect := (Sender as TCheckBox).Checked;
end;

procedure TFormMain.CBBef1Click(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CBBef2Click(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CBBef3Click(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CBBef4Click(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CBCntByteClick(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CBCondFilterChange(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].CondFilter := TFilterLog((Sender as TComboBox).ItemIndex);
  if Settings.Preset[Settings.NumListMacros].CondFilter <> TFilterLog.FL_NoFilter then
    EdtSubString.Color := clYellow
  else
    EdtSubString.Color := clWindow;
end;

procedure TFormMain.CBEmptLineClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isInsertEmptLine := (Sender as TCheckBox).Checked;
end;

procedure TFormMain.CBLoopChange(Sender: TObject);
begin

end;

procedure TFormMain.CBLoopClick(Sender: TObject);
begin
  isSendLoop := (Sender as TCheckBox).Checked;
  if isSendLoop and (NumCmdInList = CntCmdInList) and (CntCmdInList > 0) then
    NumCmdInList := 0;
end;

procedure TFormMain.CBPortBaudRateKeyPress(Sender: TObject; var Key: char);
begin
  if not (key in ['0'..'9', #8]) then
  Key := #0;
end;

procedure TFormMain.CBSkipRepsClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isSkipReps := (Sender as TCheckBox).Checked;
end;

procedure TFormMain.CBTimeOutClick(Sender: TObject);
begin
  BtnWrite.Enabled := true;
end;

procedure TFormMain.CHCntClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isShowCnt := (Sender as TCheckBox).Checked;
end;

procedure TFormMain.CHDirClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isShowDir := (Sender as TCheckBox).Checked;
end;

procedure TFormMain.CHModeClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isShowMode := (Sender as TCheckBox).Checked;
end;

procedure TFormMain.CHPortClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isShowPort := (Sender as TCheckBox).Checked;
end;

procedure TFormMain.CHTimeClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isShowTime := (Sender as TCheckBox).Checked;
end;



procedure TFormMain.MPortSettingsClick(Sender: TObject);
begin

end;

procedure UpdatePreset(numPreset : byte);
begin
  UpdateListMacros;
  UpdateGUI;

  if Port <> nil then
    case Settings.Connect of
      TConnect.TConnCom       : begin
                                  TComPort(Port).SetCondOut(@Settings.Preset[numPreset].CondOut);
                                  Settings.Preset[numPreset].CondOut := TComPort(Port).GetCondOut;
                                end;
      TConnect.TConnTcpClient : begin
                                  TTcpPortClient(Port).SetCondOut(@Settings.Preset[numPreset].CondOut);
                                  Settings.Preset[numPreset].CondOut := TTcpPortClient(Port).GetCondOut;
                                end;
      TConnect.TConnTcpServer : begin
                                  TTcpPortServer(Port).SetCondOut(@Settings.Preset[numPreset].CondOut);
                                  Settings.Preset[numPreset].CondOut := TTcpPortServer(Port).GetCondOut;
                                end;
    end;

  UpdCondLineSep;
  isEventNoRx := false;
end;



procedure TFormMain.MPreSetLoadClick(Sender: TObject);
begin
  if LoadCfgDialog.Execute then
    begin
      SetDefaultSettings(@Settings);
      LoadCfgXmlFromFile(LoadCfgDialog.FileName);
      Settings.NameSettings := LoadCfgDialog.FileName;
      UpdatePreset(Settings.NumListMacros);
    end;
end;

procedure TFormMain.MPreSetSaveAsClick(Sender: TObject);
var
  DefSett : TSettings;
begin
  if SaveCfgDialog.Execute then
    begin
      Settings.NameSettings := SaveCfgDialog.FileName;
      SetDefaultSettings(@DefSett);
      try
        SetParam('NO', Settings.NameSettings, @DefSett);
      except
        ShowMessage('Save config Error!');
      end;
    end;
end;

procedure TFormMain.MPreSetSaveClick(Sender: TObject);
begin
  CfgWriteDumpCfgInFile;
end;

procedure OpenListPresets;
var
  i : byte;
begin
  FormSelectPresets.ListPresets.Clear;
  for i := 1 to MAX_CNT_LIST do
    FormSelectPresets.ListPresets.Items.Add(Format('%03d : ', [i]) + Settings.Preset[i].NameMacrosList);

  FormMain.TmrReadPort.Interval := 500;
  FormSelectPresets.ShowModal;
  FormMain.TmrReadPort.Interval := 5;
  if (FormSelectPresets.NumPreset > 0) and (FormSelectPresets.NumPreset <= MAX_CNT_LIST) then
    begin
      Settings.NumListMacros := FormSelectPresets.NumPreset;
      UpdatePreset(Settings.NumListMacros);
    end;
end;


procedure TFormMain.MSelPresetsClick(Sender: TObject);
begin
  OpenListPresets;
end;

procedure TFormMain.PnlLineSepClick(Sender: TObject);
begin

end;

procedure TFormMain.Panel2Click(Sender: TObject);
begin

end;

procedure TFormMain.PnlLogStatResize(Sender: TObject);
begin
  StBinLog.Width  := Round((PnlLogStat.Width - StWorkTime.Width) / 2) - 1 ;
  StTextLog.Width := Round((PnlLogStat.Width - StWorkTime.Width) / 2) - 1 ;
  //StBinLog.Left := StTextLog.Width + StWorkTime.Width + 1;
end;

procedure TFormMain.PnlMacrosClick(Sender: TObject);
begin

end;

procedure TFormMain.PnlMacrosResize(Sender: TObject);
var
  i : byte;
begin
  for i := 1 to CNT_MACROS do
    begin
      if i mod 8 > 0 then
        BtnMacros[i].Width := Integer(Round(PnlMacros.Width / 9))
      else
        BtnMacros[i].Width := Integer(2 * Round(PnlMacros.Width / 9));

    end;
end;

procedure TFormMain.RBComChange(Sender: TObject);
begin

end;



procedure TFormMain.RBComClick(Sender: TObject);
begin
  Settings.Connect := TConnect.TConnCom;
end;

procedure TFormMain.RBHelpClick(Sender: TObject);
begin
  if not isModeEditMacros then
    PnlStatistics.Visible := false;
  Settings.Preset[Settings.NumListMacros].ShowHelpMode := TShowHelpMode.TShowHelpMacros;
  TmrUpdStatistics.Enabled := false;
end;

procedure TFormMain.RBStatClick(Sender: TObject);
begin
  if not isModeEditMacros then
    PnlStatistics.Visible := True;
  Settings.Preset[Settings.NumListMacros].ShowHelpMode := TShowHelpMode.TShowStatPort;
  TmrUpdStatistics.Enabled := true;
end;


procedure TFormMain.RBTcpCClick(Sender: TObject);
begin
  Settings.Connect := TConnect.TConnTcpClient;
end;

procedure TFormMain.RBTcpSClick(Sender: TObject);
begin
  Settings.Connect := TConnect.TConnTcpServer;
end;




procedure TFormMain.SettingsClick(Sender: TObject);
begin

end;



procedure TFormMain.RBCmdChange(Sender: TObject);
begin
  ModeMacros := MM_Command;
  UpdateListMacros;
end;

procedure TFormMain.RBNameClick(Sender: TObject);
begin
  ModeMacros := MM_Name;
  UpdateListMacros;
end;

procedure TFormMain.STBinLogDblClick(Sender: TObject);
begin
  if curNameFileBinLog <> '' then
    if FileExists(curNameFileBinLog) then
      ShellExecute(Handle, 'open', 'c:\windows\notepad.exe', PChar(curNameFileBinLog), nil, SW_SHOWNORMAL);
end;



procedure TFormMain.STNameListClick(Sender: TObject);
begin
    OpenListPresets;
end;




procedure TFormMain.STNumListClick(Sender: TObject);
begin
  OpenListPresets;
end;

procedure TFormMain.STOutModeClick(Sender: TObject);
begin

end;

procedure TFormMain.STOutModeDblClick(Sender: TObject);
begin
  FormModeSendPackets.OutMode := Settings.Preset[Settings.NumListMacros].OutMode;
  FormModeSendPackets.Period  := Settings.Preset[Settings.NumListMacros].PeriodSend;
  FormModeSendPackets.ShowModal;
  if FormModeSendPackets.isOk then
    begin
      Settings.Preset[Settings.NumListMacros].OutMode    := FormModeSendPackets.OutMode;
      Settings.Preset[Settings.NumListMacros].PeriodSend := FormModeSendPackets.Period;
      SetModeOutPeriod;
      //BtnSend.Enabled     := Settings.Preset[Settings.NumListMacros].OutMode <> TOutMode.TOutPeriod;
      if Settings.Preset[Settings.NumListMacros].OutMode = TOutMode.TOutPeriod then
        begin
          TimerPeriodSend.Interval := Settings.Preset[Settings.NumListMacros].PeriodSend;
          TimerPeriodSend.Enabled  := true;
        end
      else
        begin
          TimerPeriodSend.Enabled  := false;
        end;

    end;
end;

procedure TFormMain.STReadAsciiClick(Sender: TObject);
begin
  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadAscii) = 0 then
    begin
      Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode + byte(TReadMode.TReadAscii);
      (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_RA;
    end
  else
    begin
      Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode - byte(TReadMode.TReadAscii);
      (Sender as TStaticText).Color := FormMain.Color;
    end;
  (Sender as TStaticText).Font.Color := InvertColor((Sender as TStaticText).Color);
end;

procedure TFormMain.STEditMacrosClick(Sender: TObject);
var
  i : byte;
begin
  for i := 1 to CNT_MACROS do
    begin
      EdtMacros[i].Visible := not EdtMacros[i].Visible;
    end;
end;

procedure TFormMain.StReadCustomClick(Sender: TObject);
begin
  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadCustom) = 0 then
    begin
      Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode + byte(TReadMode.TReadCustom);
      (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_RC;
    end
  else
    begin
      Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode - byte(TReadMode.TReadCustom);
      (Sender as TStaticText).Color := FormMain.Color;
    end;
  (Sender as TStaticText).Font.Color := InvertColor((Sender as TStaticText).Color);
end;

procedure TFormMain.StReadCustomDblClick(Sender: TObject);
begin
  FormCustomDecode.Caption := 'Custom decoding table for the "' + Settings.Preset[Settings.NumListMacros].NameMacrosList + '" configuration';
  FormCustomDecode.ItemStr := @Settings.Preset[Settings.NumListMacros].ItCustDecode;
  FormCustomDecode.ShowModal;
end;

procedure TFormMain.STReadDecClick(Sender: TObject);
begin
  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadDec) = 0 then
    begin
      Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode + byte(TReadMode.TReadDec);
      (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_RD;
    end
  else
    begin
      Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode - byte(TReadMode.TReadDec);
      (Sender as TStaticText).Color := FormMain.Color;
    end;
  (Sender as TStaticText).Font.Color := InvertColor((Sender as TStaticText).Color);
end;

procedure TFormMain.STReadHexClick(Sender: TObject);
begin
  if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadHex) = 0 then
    begin
      Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode + byte(TReadMode.TReadHex);
      (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_RH;
    end
  else
    begin
      Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode - byte(TReadMode.TReadHex);
      (Sender as TStaticText).Color := FormMain.Color;
    end;
  (Sender as TStaticText).Font.Color := InvertColor((Sender as TStaticText).Color);
end;

procedure TFormMain.StReadUTF8Click(Sender: TObject);
begin
 if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadUTF) = 0 then
   begin
     Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode + byte(TReadMode.TReadUTF);
     (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_RU;
   end
 else
   begin
     Settings.Preset[Settings.NumListMacros].ReadMode := Settings.Preset[Settings.NumListMacros].ReadMode - byte(TReadMode.TReadUTF);
     (Sender as TStaticText).Color := FormMain.Color;
   end;
  (Sender as TStaticText).Font.Color := InvertColor((Sender as TStaticText).Color);
end;

procedure TFormMain.STSendAsciiClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].DecodeMode := TDecodeMode.TDAscii;
  (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_Send;
  (Sender as TStaticText).Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_Send);
  //STSendAscii.Color := FormMain.Color;
  STSendHex.Color := FormMain.Color;
  STSendHex.Font.Color := InvertColor(FormMain.Color);

  STSendDec.Color := FormMain.Color;
  STSendDec.Font.Color := InvertColor(FormMain.Color);

end;

procedure TFormMain.STSendDecClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].DecodeMode := TDecodeMode.TDDec;
  (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_Send;
  (Sender as TStaticText).Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_Send);

  STSendAscii.Color := FormMain.Color;
  STSendAscii.Font.Color := InvertColor(FormMain.Color);

  STSendHex.Color := FormMain.Color;
  STSendHex.Font.Color := InvertColor(FormMain.Color);

  //STSendDec.Color := FormMain.Color;
end;

procedure TFormMain.STSendHexClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].DecodeMode := TDecodeMode.TDHex;
  (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_Send;
  (Sender as TStaticText).Font.Color := InvertColor(Settings.Preset[Settings.NumListMacros].ColorFont_Send);

  STSendAscii.Color := FormMain.Color;
  STSendAscii.Font.Color := InvertColor(FormMain.Color);

  //STSendHex.Color := FormMain.Color;
  STSendDec.Color := FormMain.Color;
  STSendDec.Font.Color := InvertColor(FormMain.Color);
end;

procedure TFormMain.STTextLogDblClick(Sender: TObject);
begin
  if curNameFileTxtLog <> '' then
    if FileExists(curNameFileTxtLog) then
      ShellExecute(Handle, 'open', 'c:\windows\notepad.exe', PChar(curNameFileTxtLog), nil, SW_SHOWNORMAL);
end;

procedure TFormMain.ST_EmptyLineClick(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].isInsertEmptLine := not  Settings.Preset[Settings.NumListMacros].isInsertEmptLine;
  if Settings.Preset[Settings.NumListMacros].isInsertEmptLine then
    (Sender as TStaticText).Color := Settings.Preset[Settings.NumListMacros].ColorFont_EL
  else
    (Sender as TStaticText).Color := FormMain.Color;
  (Sender as TStaticText).Font.Color := InvertColor((Sender as TStaticText).Color);
end;

procedure TFormMain.TimerClrHelpTimer(Sender: TObject);
begin
  MHelp.Clear;
  (Sender as TTimer).Enabled := false;
end;

procedure TFormMain.TimerConvertXMLTimer(Sender: TObject);
begin
  if iXmlStr < CntXmlStr then
    begin
      if Pos(VCFG, XmlStr[iXmlStr]) > 0 then
        begin
          SetParam(XmlStr[iXmlStr], '', nil);
          AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Convert ' + IntToStr(iXmlStr + 1) + ':' + IntToStr(cntXmlStr) + ' "' + XmlStr[iXmlStr] + '" ', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
        end;
      inc(iXmlStr);
    end
  else
    begin
      for iXmlStr := 0 to cntXmlStr do
        XmlStr[iXmlStr] := '';
      iXmlStr := 0;
      cntXmlStr := 0;
      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Settings conversion completed ', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
      Sleep(2000);
      UpdateGUI;
      (Sender as TTimer).Enabled:= false;
    end;
end;




procedure TFormMain.TimerPeriodSendTimer(Sender: TObject);
begin
  SendData;
end;

procedure TFormMain.TMAddLogChange(Sender: TObject);
begin

end;

procedure TFormMain.TmrCheckStatusTimer(Sender: TObject);
var
  isEnSendBt : boolean;
begin
  if Port = nil then
    begin
      BtnSend.Enabled := false;
      PnlBtSend.Color := clRed;
      isEventNoRx     := false;
    end
  else
    begin
      if Settings.Preset[Settings.NumListMacros].isControlPauseRX then
        begin
          if PauseRxMax > Settings.Preset[Settings.NumListMacros].PauseRXms then
            begin
              if not isEventNoRx then
                begin
                  ST_NoDataReadMS.Color := clYellow;
                  AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: There has been no incoming data for more than ' + IntToStr(Settings.Preset[Settings.NumListMacros].PauseRXms) +' milliseconds', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                  if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogTxt then
                    TMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorPauseRX;
                  if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogRTF then
                    RMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorPauseRX;
                  isEventNoRx := true;
                end;
            end
          else
           begin
              isEventNoRx := false;
              ST_NoDataReadMS.Color := FormMain.Color;
              if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogTxt then
                TMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorBG_TXT;
              if Settings.Preset[Settings.NumListMacros].OutLogMode = TOutLogMode.TOutLogRTF then
                RMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorBG_RTF;
           end;
        end
      else
        begin
          ST_NoDataReadMS.Color := FormMain.Color;
        end;

      isEnSendBt := false;
      case Settings.Connect of
        TConnect.TConnCom       : isEnSendBt := not TComPort(Port).GetIsBusyWrite;
        TConnect.TConnTcpClient : isEnSendBt := not TTcpPortClient(Port).GetIsBusyWrite;
        TConnect.TConnTcpServer : isEnSendBt := not TTcpPortServer(Port).GetIsBusyWrite;
      end;

      if not isEnSendBt then
        begin
          PnlBtSend.Color := clYellow;
          BtnSend.Enabled := false;
        end
      else
        begin
          PnlBtSend.Color := clGreen;
          BtnSend.Enabled := true;
        end;
    end;

 if ThrReadFile <> nil then
   begin
     if (ThrReadFile.GetCntByte > 0) and (not ThrReadFile.GetIsError) and (not ThrReadFile.GetIsCancelSend) then
       begin
         BtnSendFile.Caption := 'Stop send file';
         if Port <> nil then
           isSendFileProcess := SendDataInPort(@Port, Settings.Connect, @BufWrite, ThrReadFile.GetCntByte);

         if ThrReadFile.GetIsTruncFile then
           AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: The file did not fit into the buffer and was truncated to ' + IntToStr(ThrReadFile.GetCntByte) + ' bytes ', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);

         AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Send file START ' + '( ' + IntToStr(ThrReadFile.GetCntByte) + ' bytes )', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
         FormSendFile.rf := nil;
         ThrReadFile.Terminate;
         ThrReadFile.Free;
         ThrReadFile := nil;
       end
     else if ThrReadFile.GetIsError then
       begin
         AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Open file ERROR ', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
         FormSendFile.rf := nil;
         ThrReadFile.Terminate;
         ThrReadFile.Free;
         ThrReadFile := nil;
         isSendFileProcess := false;
       end
     else if ThrReadFile.GetIsCancelSend then
       begin
         AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Cancel file sending', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
         FormSendFile.rf := nil;
         ThrReadFile.Terminate;
         ThrReadFile.Free;
         ThrReadFile := nil;
         isSendFileProcess := false;
       end;
   end;


 if isSendFileProcess then
   begin
     isSendFileProcess := false;
     if Port <> nil then
       case Settings.Connect of
         TConnect.TConnCom       : isSendFileProcess := TComPort(Port).GetIsBusyWrite;
         TConnect.TConnTcpClient : isSendFileProcess := TTcpPortClient(Port).GetIsBusyWrite;
         TConnect.TConnTcpServer : isSendFileProcess := TTcpPortServer(Port).GetIsBusyWrite;
        end;

     if not isSendFileProcess then
       begin
         BtnSendFile.Caption := 'Send file';
         if Port = nil then
           AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Send file not OK', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv)
         else
           AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Send file OK', Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
       end;
   end;
end;



procedure EmergencPortAutoOpen;
  begin
    FormMain.BtnConnect.Caption := 'DisConnect';
    FormMain.RMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorBG_RTF;
    FormMain.TMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorBG_RTF;
    if Settings.Connect = TConnect.TConnCom then
      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Port is automatically open' , Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv)
    else if Settings.Connect = TConnect.TConnTcpClient then
      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Client is automatically connect' , Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv)
    else if Settings.Connect = TConnect.TConnTcpServer then
      AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Server is automatically start' , Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);

  end;

procedure TFormMain.TmrAutoConnectTimer(Sender: TObject);
begin
  UpdListPorts;
  if Settings.PortName <> '' then
    if FormMain.CBPortName.Items.Count > 0 then
      if Settings.PortName = FormMain.CBPortName.Items[FormMain.CBPortName.ItemIndex]  then
        if Settings.Connect = TConnect.TConnCom then
          begin
            PortConnect(Settings.Connect);
            SetPanelSettingsPort(Port <> nil, Settings.Connect);

          end;

  if (Settings.Preset[Settings.NumListMacros].IP_C <> '') and (Settings.Preset[Settings.NumListMacros].IPPortC <> 0) then
    if Settings.Connect = TConnect.TConnTcpClient then
      begin
        PortConnect(Settings.Connect);
        SetPanelSettingsPort(Port <> nil, Settings.Connect);
      end;

  if (Settings.Preset[Settings.NumListMacros].IP_S <> '') and (Settings.Preset[Settings.NumListMacros].IPPortS <> 0) then
    if Settings.Connect = TConnect.TConnTcpServer then
      begin
        PortConnect(Settings.Connect);
        SetPanelSettingsPort(Port <> nil, Settings.Connect);
      end;

  if Port <> nil then
    begin
      EmergencPortAutoOpen;
      SetPanelSettingsPort(Port <> nil, Settings.Connect);
      PnlPort.Visible := false;
      case Settings.Connect of
        TConnect.TConnCom       : BtnPort.Hint := TComPort(Port).GetName + ' ' + IntToStr(Settings.Preset[Settings.NumListMacros].BaudRate) + 'b/s';
        TConnect.TConnTcpClient : BtnPort.Hint := 'TCP Client ' + TTcpPortClient(Port).GetName;
        TConnect.TConnTcpServer : BtnPort.Hint := 'TCP Server ' + TTcpPortServer(Port).GetName;
      end;
    end
  else
    begin
      BtnPort.Hint := '';
    end;
  (Sender as TTimer).Enabled := (Port = nil) and Settings.Preset[Settings.NumListMacros].isAutoConnect;
end;

procedure TFormMain.TmrClearHelpTimer(Sender: TObject);
begin
  if TimeOutClearHelp > 0 then
    dec(TimeOutClearHelp)
  else
    begin
      MHelp.Clear;
      (Sender as TTimer).Enabled := false;
    end;
end;

procedure EmergencPortClosure(lastErr : integer; Connect : TConnect);
  begin
    case Connect of
      TConnect.TConnCom       : begin
                                  TComPort(Port).Free;
                                  FormMain.CBPortName.Clear;
                                  AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Port disconnect' , Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                end;
      TConnect.TConnTcpClient : begin
                                  TTcpPortClient(Port).Free;
                                  AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Client disconnect, Error: ' + IntToStr(lastErr), Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                end;
      TConnect.TConnTcpServer : begin
                                  TTcpPortServer(Port).Free;
                                  AddLogLine(GetDateTimeStr(now, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp) + 'TerminalMLT: Server stop, Error: ' + IntToStr(lastErr), Settings.Preset[Settings.NumListMacros].ColorFont_SM, TStrInLog.TStrEv);
                                end;
    end;

    Port := nil;
    FormMain.BtnConnect.Caption := 'Connect';

    if Settings.Preset[Settings.NumListMacros].isAlarmConnectLost then
      begin
        FormMain.RMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorBG_ConnectLost;
        FormMain.TMMainLog.Color := Settings.Preset[Settings.NumListMacros].ColorBG_ConnectLost;
      end;
  end;


procedure TFormMain.TmrReadPortTimer(Sender: TObject);
var
  isErr : boolean;
  isClosePort : boolean;
begin
  TRP_i              := 0;
  TRP_isSubStrAscii  := false;
  TRP_isSubStrHex    := false;
  TRP_isSubStrDec    := false;
  TRP_isSubStrCustom := false;
  TRP_isOutInLog     := false;
  TRP_isOutLine      := false;
  TRP_TimeStamp      := '';


  if Port <> nil then
    begin
      isErr := false;
      case Settings.Connect of
        TConnect.TConnCom       : begin
                                    isErr := TComPort(Port).GetIsError;
                                  end;
        TConnect.TConnTcpClient : begin
                                    isErr := TTcpPortClient(Port).GetIsError;
                                  end;
        TConnect.TConnTcpServer : begin
                                    isErr := TTcpPortServer(Port).GetIsError;
                                  end;
      end;

      isClosePort := false;
      if isErr then
        case Settings.Connect of
          TConnect.TConnCom       : begin
                                      if TComPort(Port).GetCntNotRead = 0 then
                                        begin
                                          EmergencPortClosure(0, Settings.Connect);
                                          isClosePort := true;
                                        end;
                                    end;
          TConnect.TConnTcpClient : begin
                                      if TTcpPortClient(Port).GetCntNotRead = 0 then
                                        begin
                                          EmergencPortClosure(TTcpPortClient(Port).GetLastError, Settings.Connect);
                                          isClosePort := true;
                                        end;
                                    end;
          TConnect.TConnTcpServer : begin
                                      if TTcpPortServer(Port).GetCntNotRead = 0 then
                                        begin
                                          EmergencPortClosure(TTcpPortServer(Port).GetLastError, Settings.Connect);
                                          isClosePort := true;
                                        end;
                                    end;
        end;

      if isClosePort then
        begin
          PnlPort.Visible := true;
          SetPanelSettingsPort(Port <> nil, Settings.Connect);
          UpdListPorts;
          TmrAutoConnect.Enabled := Settings.Preset[Settings.NumListMacros].isAutoConnect;
        end;
    end;



  if Port <> nil then
    begin
      TRP_isOutLine := false;

      ResRead.Cnt := 0;

      case Settings.Connect of
        TConnect.TConnCom       : ResRead := TComPort(Port).ReadPort(@BufRead,  BUF_SIZE_PORT);
        TConnect.TConnTcpClient : ResRead := TTcpPortClient(Port).ReadPort(@BufRead,  BUF_SIZE_PORT);
        TConnect.TConnTcpServer : ResRead := TTcpPortServer(Port).ReadPort(@BufRead,  BUF_SIZE_PORT);
      end;

      if ResRead.Cnt > 0 then
        begin
          TRP_TimeStamp := GetDateTimeStr(ResRead.DT, Settings.Preset[Settings.NumListMacros].isDateInTimeStamp);
          if isLogBin and Settings.isRxBinLog and not isPauseFileLogBin then
            begin
              try
                for TRP_i := 0 to ResRead.Cnt - 1 do
                  Write(BinFileLog, BufRead[TRP_i]);
              except
                on E: EInOutError do
                  ShowMessage('Ошибка ввода-вывода: ' + E.Message);
              end;
            end;

          CntShowRXBytes := CntShowRXBytes + ResRead.Cnt;
          inc(CntRXPackets);

          TRP_isOutInLog := true;

          if Settings.Preset[Settings.NumListMacros].isSkipReps then
            begin
              TRP_isOutInLog := ResReadOld.Cnt <> ResRead.Cnt;
              TRP_i := 0;
              while not TRP_isOutInLog and (TRP_i < ResRead.Cnt) do
                begin
                  TRP_isOutInLog := BufRead[TRP_i] <> BufReadOld[TRP_i];
                  inc(TRP_i);
                end;
              ResReadOld := ResRead;
              for TRP_i := 0 to ResRead.Cnt do
                BufReadOld[TRP_i] := BufRead[TRP_i];
            end;

          if TRP_isOutInLog then
            begin
              TRP_isSubStrAscii  := false;
              TRP_isSubStrHex    := false;
              TRP_isSubStrDec    := false;
              TRP_isSubStrCustom := false;

              StrOutHex    := '';
              StrOutDec    := '';
              StrOutCustom := '';
              StrOutAscii  := '';
              StrOutUTF    := '';

              StrAddInfo := '';

              if Settings.Preset[Settings.NumListMacros].isShowTime then
                StrAddInfo := TRP_TimeStamp;

              if Settings.Preset[Settings.NumListMacros].isShowPort and (Port <> nil) then
                begin
                  case Settings.Connect of
                    TConnect.TConnCom       : StrAddInfo  := Format('[%08s]', [TComPort(Port).GetName]) + StrAddInfo;
                    TConnect.TConnTcpClient : StrAddInfo  := Format('[%08s]', [TTcpPortClient(Port).GetName]) + StrAddInfo;
                    TConnect.TConnTcpServer : StrAddInfo  := Format('[%08s]', [TTcpPortServer(Port).GetName]) + StrAddInfo;
                  end;
                end;


              if Settings.Preset[Settings.NumListMacros].isShowCnt then
                StrAddInfo := StrAddInfo + Format('[%03d]', [ResRead.Cnt]);

              if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadAscii) > 0 then
                begin
                  StrAddTmp   := '';

                  if Settings.Preset[Settings.NumListMacros].isShowMode then
                    StrAddTmp := '[A]';
                  if Settings.Preset[Settings.NumListMacros].isShowDir then
                    StrAddTmp := StrAddTmp + '>';

                  StrOutAscii := ' ';

                  for TRP_i := 0 to ResRead.Cnt - 1 do
                    if Settings.Preset[Settings.NumListMacros].isNonPrintASCII then
                      StrOutAscii := StrOutAscii + ByteToAsciiTabl[BufRead[TRP_i]]
                    else
                      StrOutAscii := StrOutAscii + ByteToAsciiTablNP[BufRead[TRP_i]];



                  if Settings.Preset[Settings.NumListMacros].CondFilter <> TFilterLog.FL_NoFilter then
                    TRP_isSubStrAscii := Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutAscii) > 0;


                  if (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoFilter)                      or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoOut) and not TRP_isSubStrAscii) or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Out) and TRP_isSubStrAscii)       or
                     (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Capture)                       or
                     (Settings.Preset[Settings.NumListMacros].FilterStr = '') then
                       begin
                         if Settings.Preset[Settings.NumListMacros].FilterStr <> '' then
                           if Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutAscii) > 0 then
                             inc(CntMathSubstr);
                         AddLogLine(StrAddInfo + StrAddTmp + StrOutAscii, Settings.Preset[Settings.NumListMacros].ColorFont_RA, TStrInLog.TStrRx);
                         TRP_isOutLine := true;
                       end;
                end;

              if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadHex) > 0 then
                begin
                  StrAddTmp := '';

                  if Settings.Preset[Settings.NumListMacros].isShowMode then
                    StrAddTmp := '[H]';
                  if Settings.Preset[Settings.NumListMacros].isShowDir then
                    StrAddTmp := StrAddTmp + '>';

                  StrOutHex := ' ';

                  for TRP_i := 0 to ResRead.Cnt - 1 do
                    StrOutHex := StrOutHex + IntToHex(BufRead[TRP_i], 2) + ' ';

                  if Settings.Preset[Settings.NumListMacros].CondFilter <> TFilterLog.FL_NoFilter then
                    TRP_isSubStrHex := Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutHex) > 0;

                  if (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoFilter)                    or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoOut) and not TRP_isSubStrHex) or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Out) and TRP_isSubStrHex)       or
                     (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Capture)                     or
                     (Settings.Preset[Settings.NumListMacros].FilterStr = '') then
                     begin
                       if Settings.Preset[Settings.NumListMacros].FilterStr <> '' then
                         if Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutHex) > 0 then
                           inc(CntMathSubstr);
                       AddLogLine(StrAddInfo + StrAddTmp + StrOutHex, Settings.Preset[Settings.NumListMacros].ColorFont_RH, TStrInLog.TStrRx);
                       TRP_isOutLine := true;
                     end;
                end;

              if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadDec) > 0 then
                begin
                  StrAddTmp   := '';

                  if Settings.Preset[Settings.NumListMacros].isShowMode then
                    StrAddTmp := '[D]';
                  if Settings.Preset[Settings.NumListMacros].isShowDir then
                    StrAddTmp := StrAddTmp + '>';

                  StrOutDec := ' ';

                  for TRP_i := 0 to ResRead.Cnt - 1 do
                    StrOutDec := StrOutDec + Format('%.3d', [BufRead[TRP_i]]) + ' ';

                  if Settings.Preset[Settings.NumListMacros].CondFilter <> TFilterLog.FL_NoFilter then
                    TRP_isSubStrDec := Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutDec) > 0;

                  if (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoFilter)                    or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoOut) and not TRP_isSubStrDec) or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Out) and TRP_isSubStrDec)       or
                     (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Capture)                     or
                     (Settings.Preset[Settings.NumListMacros].FilterStr = '') then
                    begin
                      if Settings.Preset[Settings.NumListMacros].FilterStr <> '' then
                        if Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutDec) > 0 then
                          inc(CntMathSubstr);
                      AddLogLine(StrAddInfo + StrAddTmp + StrOutDec, Settings.Preset[Settings.NumListMacros].ColorFont_RD, TStrInLog.TStrRx);
                      TRP_isOutLine := true;
                    end;
                end;

              if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadCustom) > 0 then
                begin
                  StrAddTmp   := '';

                  if Settings.Preset[Settings.NumListMacros].isShowMode then
                    StrAddTmp := '[C]';
                  if Settings.Preset[Settings.NumListMacros].isShowDir then
                    StrAddTmp := StrAddTmp + '>';

                  StrOutCustom := ' ';

                  for TRP_i := 0 to ResRead.Cnt - 1 do
                    StrOutCustom := StrOutCustom + Settings.Preset[Settings.NumListMacros].ItCustDecode[BufRead[TRP_i]].StrDecode;

                  if Settings.Preset[Settings.NumListMacros].CondFilter <> TFilterLog.FL_NoFilter then
                    TRP_isSubStrCustom := Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutCustom) > 0;

                  if (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoFilter)                    or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoOut) and not TRP_isSubStrCustom) or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Out) and TRP_isSubStrCustom)       or
                     (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Capture) or
                     (Settings.Preset[Settings.NumListMacros].FilterStr = '') then
                    begin
                      if Settings.Preset[Settings.NumListMacros].FilterStr <> '' then
                        if Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutCustom) > 0 then
                          inc(CntMathSubstr);
                      AddLogLine(StrAddInfo + StrAddTmp + StrOutCustom, Settings.Preset[Settings.NumListMacros].ColorFont_RC, TStrInLog.TStrRx);
                      TRP_isOutLine := true;
                    end;
                end;

///
              if Settings.Preset[Settings.NumListMacros].ReadMode and byte(TReadMode.TReadUTF) > 0 then
                begin
                  StrAddTmp   := '';

                  if Settings.Preset[Settings.NumListMacros].isShowMode then
                    StrAddTmp := '[U]';
                  if Settings.Preset[Settings.NumListMacros].isShowDir then
                    StrAddTmp := StrAddTmp + '>';


                  SetString(StrOutUTF, PAnsiChar(@BufRead[0]), ResRead.Cnt);

                  StrOutUTF := ' ' + StrOutUTF;

                  if Settings.Preset[Settings.NumListMacros].CondFilter <> TFilterLog.FL_NoFilter then
                    TRP_isSubStrCustom := Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutCustom) > 0;

                  if (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoFilter)                    or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_NoOut) and not TRP_isSubStrCustom) or
                     ((Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Out) and TRP_isSubStrCustom)       or
                     (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Capture) or
                     (Settings.Preset[Settings.NumListMacros].FilterStr = '') then
                    begin
                      if Settings.Preset[Settings.NumListMacros].FilterStr <> '' then
                        if Pos(Settings.Preset[Settings.NumListMacros].FilterStr, StrOutCustom) > 0 then
                          inc(CntMathSubstr);
                      AddLogLine(StrAddInfo + StrAddTmp + StrOutUTF, Settings.Preset[Settings.NumListMacros].ColorFont_RU, TStrInLog.TStrRx);
                      TRP_isOutLine := true;
                    end;
                end;

///


                if (Settings.Preset[Settings.NumListMacros].CondFilter = TFilterLog.FL_Capture) and not isPauseLog and
                   (TRP_isSubStrAscii or TRP_isSubStrHex or TRP_isSubStrDec or TRP_isSubStrCustom) then
                    begin
                     isPauseLog := PauseLog(isPauseLog);
                    end;

              if Settings.Preset[Settings.NumListMacros].isInsertEmptLine and TRP_isOutLine then
                AddLogLine(Settings.Preset[Settings.NumListMacros].EmptyLine, Settings.Preset[Settings.NumListMacros].ColorFont_EL, TStrInLog.TStrRx);
            end;

          if Settings.Preset[Settings.NumListMacros].OutMode = TOutMode.TOutAfterAns then
            begin

              if not isModeListCmd then
                begin
                  StrCmd  := EdtCli.Text;
                  StrTail := EdtTail.Text;

                  if ((StrCmd <> '') or (StrTail <> '')) and (Port <> nil) then
                    SendPacket(@Port, Settings.Connect, StrCmd, StrTail)
                end
              else
                begin
                  if NumCmdInList < CntCmdInList then
                    begin
                      StrCmd  := LBCommands.Items[NumCmdInList];
                      LBCommands.Selected[NumCmdInList] := true;
                      StrTail := EdtTail.Text;
                      inc(NumCmdInList);
                      if isSendLoop and (NumCmdInList = CntCmdInList) then
                        NumCmdInList := 0;
                      if Port <> nil then
                        SendPacket(@Port, Settings.Connect, StrCmd, StrTail);
                    end;
                end;
            end;
        end;
    end;
end;


const
  SecPerDay = 86400;
  SecPerHour = 3600;
  SecPerMinute = 60;

function SecondToTime(const Seconds: Cardinal): string;
var
  mm, hh, dd: Cardinal;
begin
  dd := Seconds div SecPerDay;
  hh := (Seconds mod SecPerDay) div SecPerHour;
  mm := ((Seconds mod SecPerDay) mod SecPerHour) div SecPerMinute;

  Result := Format('%.4d:%.2d:%.2d', [dd, hh, mm]);
end;

procedure TFormMain.TmrTimeStampTimer(Sender: TObject);
begin
  DateTimeToString(Timestr, 'hh:nn:ss', Now);
  STTime.Caption     := Timestr;
  STWorkTime.Caption := SecondToTime(SecondsBetween(DTStart, now));
end;




procedure TFormMain.TBModeOutLogChange(Sender: TObject);
begin
  Settings.Preset[Settings.NumListMacros].OutLogMode := SetOutLogMode(Settings.Preset[Settings.NumListMacros].OutLogMode);
end;

procedure TFormMain.TBModeOutLogClick(Sender: TObject);
begin

end;






procedure TFormMain.TmrUpdStatisticsTimer(Sender: TObject);
begin

  if Port <> nil then
    begin
      case Settings.Connect of
        TConnect.TConnCom       : begin
                                    ST_CntReadRXBytes.Caption    := IntToStr(TComPort(Port).GetCntRead);
                                    ST_CntLostRXBytes.Caption    := IntToStr(TComPort(Port).GetLostRead);
                                    ST_CntInBufRXBytes.Caption   := IntToStr(TComPort(Port).GetCntNotRead);
                                    ST_CntOutTXBytes.Caption     := IntToStr(TComPort(Port).GetCntWrite);
                                    ST_CntLostTXBytes.Caption    := IntToStr(TComPort(Port).GetLostWrite);

                                    PauseRxMax                   := TComPort(Port).GetTimeLastRead;
                                    ST_NoDataReadMS.Caption      := IntToStr(PauseRxMax);
                                  end;
        TConnect.TConnTcpClient : begin
                                    ST_CntReadRXBytes.Caption    := IntToStr(TTcpPortClient(Port).GetCntRead);
                                    ST_CntLostRXBytes.Caption    := IntToStr(TTcpPortClient(Port).GetLostRead);
                                    ST_CntInBufRXBytes.Caption   := IntToStr(TTcpPortClient(Port).GetCntNotRead);
                                    ST_CntOutTXBytes.Caption     := IntToStr(TTcpPortClient(Port).GetCntWrite);
                                    ST_CntLostTXBytes.Caption    := IntToStr(TTcpPortClient(Port).GetLostWrite);

                                    PauseRxMax                   := TTcpPortClient(Port).GetTimeLastRead;
                                    ST_NoDataReadMS.Caption      := IntToStr(PauseRxMax);
                                  end;
        TConnect.TConnTcpServer : begin
                                    ST_CntReadRXBytes.Caption    := IntToStr(TTcpPortServer(Port).GetCntRead);
                                    ST_CntLostRXBytes.Caption    := IntToStr(TTcpPortServer(Port).GetLostRead);
                                    ST_CntInBufRXBytes.Caption   := IntToStr(TTcpPortServer(Port).GetCntNotRead);
                                    ST_CntOutTXBytes.Caption     := IntToStr(TTcpPortServer(Port).GetCntWrite);
                                    ST_CntLostTXBytes.Caption    := IntToStr(TTcpPortServer(Port).GetLostWrite);

                                    PauseRxMax                   := TTcpPortServer(Port).GetTimeLastRead;
                                    ST_NoDataReadMS.Caption      := IntToStr(PauseRxMax);
                                  end;
      end;

      ST_CntOutRXBytes.Caption     := IntToStr(CntShowRXBytes);
      ST_CntSendTXBytes.Caption    := IntToStr(CntShowTXBytes);
    end
  else
    begin
      ST_CntReadRXBytes.Caption    := '---';
      ST_CntOutRXBytes.Caption     := '---';
      ST_CntLostRXBytes.Caption    := '---';

      ST_CntInBufRXBytes.Caption   := '---';
      ST_CntSendTXBytes.Caption    := '---';

      ST_CntLostTXBytes.Caption    := '---';
      ST_NoDataReadMS.Caption      := '---';
      ST_CntOutTXBytes.Caption     := '---';
    end;

  ST_CntPacketWrite.Caption    := IntToStr(CntTXPackets);
  ST_CntPacketRead.Caption     := IntToStr(CntRXPackets);
  ST_CntSubStrPackets.Caption  := IntToStr(CntMathSubstr);
  ST_CntPortReconnect.Caption  := IntToStr(CntPortReconnect);
end;

procedure TFormMain.ToggleEdtMacrosChange(Sender: TObject);
begin
  UpdateListMacros;
end;

procedure TFormMain.ToggleEdtMacrosClick(Sender: TObject);
var
  i : byte;
begin
  isModeEditMacros := not isModeEditMacros;
  for i := 1 to CNT_MACROS do
    begin
      EdtMacros[i].Visible := isModeEditMacros;
    end;
  FormMain.EdtNameList.Visible := isModeEditMacros;
  FormMain.MHelpEdit.Visible   := isModeEditMacros;

  if not isModeEditMacros then
    PnlStatistics.Visible := Settings.Preset[Settings.NumListMacros].ShowHelpMode = TShowHelpMode.TShowStatPort
  else
    PnlStatistics.Visible := false;

  if isModeEditMacros then
    begin
      NumCurMacros := 1;
      EdtMacros[NumCurMacros].SetFocus;
    end;

end;



procedure TFormMain.UpChangeListClick(Sender: TObject; Button: TUDBtnType);
begin
  if (Button = TUDBtnType.btNext) and (Settings.NumListMacros < MAX_CNT_LIST) then
    begin
      inc(Settings.NumListMacros);
      UpdatePreset(Settings.NumListMacros);
    end;

  if (Button = TUDBtnType.btPrev) and (Settings.NumListMacros > 1) then
    begin
      dec(Settings.NumListMacros);
      UpdatePreset(Settings.NumListMacros);
    end;
end;

procedure TFormMain.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  if (Button = TUDBtnType.btNext) and (Settings.Preset[Settings.NumListMacros].CondOut.CntByte < 99999) then
    inc(Settings.Preset[Settings.NumListMacros].CondOut.CntByte)
  else if (Button = TUDBtnType.btPrev) and (Settings.Preset[Settings.NumListMacros].CondOut.CntByte > 0) then
    dec(Settings.Preset[Settings.NumListMacros].CondOut.CntByte);
  EdtCntByte.Caption := IntToStr(Settings.Preset[Settings.NumListMacros].CondOut.CntByte);

  if Port <> nil then
    case Settings.Connect of
      TConnect.TConnCom       : TComPort(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
      TConnect.TConnTcpClient : TTcpPortClient(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
      TConnect.TConnTcpServer : TTcpPortServer(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
    end;
end;

procedure TFormMain.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  if (Button = TUDBtnType.btNext) and (Settings.Preset[Settings.NumListMacros].CondOut.TimeOut < 99999999) then
    inc(Settings.Preset[Settings.NumListMacros].CondOut.TimeOut)
  else if (Button = TUDBtnType.btPrev) and (Settings.Preset[Settings.NumListMacros].CondOut.TimeOut > 0) then
    dec(Settings.Preset[Settings.NumListMacros].CondOut.TimeOut);

  EdtTimeOut.Caption := IntToStr(Settings.Preset[Settings.NumListMacros].CondOut.TimeOut);

  if Port <> nil then
    case Settings.Connect of
      TConnect.TConnCom       : TComPort(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
      TConnect.TConnTcpClient : TTcpPortClient(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
      TConnect.TConnTcpServer : TTcpPortServer(Port).SetCondOut(@Settings.Preset[Settings.NumListMacros].CondOut);
    end;
end;


end.

