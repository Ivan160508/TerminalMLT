unit FormSetColors;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls;

type

  { TFormColors }

  TFormColors = class(TForm)
    BtCancel: TButton;
    BtOk: TButton;
    CBEnterClear: TCheckBox;
    CBNoRxData: TCheckBox;
    CB_PrintDateInTimeStamp: TCheckBox;
    CB_NonPrintInASCII: TCheckBox;
    CBAlarm: TCheckBox;
    ColorDialog: TColorDialog;
    EdtMaxLenLog: TEdit;
    EdtEmptyLine: TEdit;
    EdtMaxPauseRX: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
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
    PColorBG_NoDataRX: TPanel;
    PColorFont_EL: TPanel;
    PColorBG_ConnectLostAlarm: TPanel;
    PnlFont: TPanel;
    PColorBG_PAUSE_RTF: TPanel;
    PColorBG_TXT: TPanel;
    PColorBG_RTF: TPanel;
    PColorBG_PAUSE_TXT: TPanel;
    PColorFont_SM: TPanel;
    PColorFont_TXT: TPanel;
    PColorFont_Send: TPanel;
    PColorFont_RA: TPanel;
    PColorFont_RH: TPanel;
    PColorFont_RD: TPanel;
    PColorFont_RC: TPanel;
    TBFontSize: TTrackBar;
    procedure BtCancelClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure CBAlarmClick(Sender: TObject);
    procedure CBEnterClearClick(Sender: TObject);
    procedure CBNoRxDataClick(Sender: TObject);
    procedure CB_NonPrintInASCIIClick(Sender: TObject);
    procedure CB_PrintDateInTimeStampClick(Sender: TObject);
    procedure EdtEmptyLineChange(Sender: TObject);
    procedure EdtMaxLenLogChange(Sender: TObject);
    procedure EdtMaxPauseRXChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PColorBG_ConnectLostAlarmClick(Sender: TObject);
    procedure PColorBG_NoDataRXClick(Sender: TObject);
    procedure PColorBG_PAUSE_RTFClick(Sender: TObject);
    procedure PColorBG_PAUSE_TXTClick(Sender: TObject);
    procedure PColorBG_RTFClick(Sender: TObject);
    procedure PColorBG_TXTClick(Sender: TObject);
    procedure PColorFont_ELClick(Sender: TObject);
    procedure PColorFont_RAClick(Sender: TObject);
    procedure PColorFont_RCClick(Sender: TObject);
    procedure PColorFont_RDClick(Sender: TObject);
    procedure PColorFont_RHClick(Sender: TObject);
    procedure PColorFont_SendClick(Sender: TObject);
    procedure PColorFont_SMClick(Sender: TObject);
    procedure PColorFont_TXTClick(Sender: TObject);
    procedure TBFontSizeChange(Sender: TObject);
  private

  public
    isOK : boolean;
    ColorBG_TXT    : Tcolor;
    ColorBG_RTF    : Tcolor;
    ColorBG_PAUSE_TXT  : Tcolor;
    ColorBG_PAUSE_RTF  : Tcolor;

    ColorFont_TXT  : TColor;
    ColorFont_Send : TColor;
    ColorFont_RA   : TColor;
    ColorFont_RH   : TColor;
    ColorFont_RD   : TColor;
    ColorFont_RC   : TColor;
    ColorFont_EL   : TColor;
    ColorFont_SM   : TColor;

    FontSize : byte;
    EmptLine : string;
    MaxLenLog : Cardinal;
    isClearLogEnter : boolean;

    isControlPauseRX : boolean;
    PauseRXms        : Cardinal;
    ColorPauseRX     : Tcolor;

    isDateInTimeStamp  : boolean;
    isNonPrintASCII    : boolean;

    isAlarmConnectLost : boolean;
    ColorBG_AlarmLost   : TColor;

  end;

const
  MIN_FONT_SIZE = 8;
  MAX_FONT_SIZE = 72;

var
  FormColors: TFormColors;

implementation

{$R *.lfm}

{ TFormColors }

procedure TFormColors.FormActivate(Sender: TObject);
begin
  isOk := false;
  PColorBG_TXT.Color    := ColorBG_TXT;
  PColorBG_RTF.Color    := ColorBG_RTF;
  PColorBG_PAUSE_TXT.Color  := ColorBG_PAUSE_TXT;
  PColorBG_PAUSE_RTF.Color  := ColorBG_PAUSE_RTF;

  PColorFont_TXT.Color  := ColorFont_TXT;
  PColorFont_Send.Color := ColorFont_Send;
  PColorFont_RA.Color   := ColorFont_RA;
  PColorFont_RH.Color   := ColorFont_RH;
  PColorFont_RD.Color   := ColorFont_RD;
  PColorFont_RC.Color   := ColorFont_RC;
  PColorFont_EL.Color   := ColorFont_EL;
  PColorFont_SM.Color   := ColorFont_SM;

  CBAlarm.Checked := isAlarmConnectLost;
  PColorBG_ConnectLostAlarm.Color := ColorBG_AlarmLost;

  if FontSize < MIN_FONT_SIZE then FontSize := MIN_FONT_SIZE;
  if FontSize > MAX_FONT_SIZE then FontSize := MAX_FONT_SIZE;

  PnlFont.Font.Size := FontSize;
  PnlFont.Caption :='Size ' + IntToStr(FontSize);
  TBFontSize.Position := MAX_FONT_SIZE - FontSize + MIN_FONT_SIZE;
  EdtEmptyLine.Text := EmptLine;

  EdtMaxLenLog.Text := IntToStr(MaxLenLog);

  CBEnterClear.Checked := isClearLogEnter;

  CBNoRxData.Checked             := isControlPauseRX;
  EdtMaxPauseRx.Text             := IntToStr(PauseRXms);
  PColorBG_NoDataRX.Color        := ColorPauseRX;

  CB_PrintDateInTimeStamp.Checked := isDateInTimeStamp;
  CB_NonPrintInASCII.Checked      := isNonPrintASCII;
end;

procedure TFormColors.FormCreate(Sender: TObject);
begin
  TBFontSize.Min := MIN_FONT_SIZE;
  TBFontSize.Max := MAX_FONT_SIZE;

end;

procedure TFormColors.PColorBG_ConnectLostAlarmClick(Sender: TObject);
begin
  ColorDialog.Color := ColorBG_AlarmLost;
  if ColorDialog.Execute then
    ColorBG_AlarmLost := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorBG_NoDataRXClick(Sender: TObject);
begin
  ColorDialog.Color := ColorPauseRX;
  if ColorDialog.Execute then
    ColorPauseRX := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorBG_PAUSE_RTFClick(Sender: TObject);
begin
    ColorDialog.Color := ColorBG_Pause_RTF;
  if ColorDialog.Execute then
    ColorBG_Pause_RTF := ColorDialog.Color;
 (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.BtCancelClick(Sender: TObject);
begin
  isOk := false;
  FormColors.Close;
end;

procedure TFormColors.BtOkClick(Sender: TObject);
begin
  isOk := true;
  FormColors.Close;
end;

procedure TFormColors.CBAlarmClick(Sender: TObject);
begin
  isAlarmConnectLost := (Sender as TCheckBox).Checked;
end;

procedure TFormColors.CBEnterClearClick(Sender: TObject);
begin
  isClearLogEnter := (Sender as TCheckBox).Checked;
end;

procedure TFormColors.CBNoRxDataClick(Sender: TObject);
begin
  isControlPauseRX := (Sender as TCheckBox).Checked;
end;

procedure TFormColors.CB_NonPrintInASCIIClick(Sender: TObject);
begin
  isNonPrintASCII   := (Sender as TCheckBox).Checked;
end;

procedure TFormColors.CB_PrintDateInTimeStampClick(Sender: TObject);
begin
  isDateInTimeStamp := (Sender as TCheckBox).Checked;
end;

procedure TFormColors.EdtEmptyLineChange(Sender: TObject);
begin
  EmptLine := (Sender as TEdit).Text;
end;

procedure TFormColors.EdtMaxLenLogChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
    try
      MaxLenLog := StrToInt((Sender as TEdit).Text);
    Except
      MaxLenLog := 1000;
    end;
end;

procedure TFormColors.EdtMaxPauseRXChange(Sender: TObject);
begin
  if (Sender as TEdit).Text <> '' then
    try
      PauseRXms := StrToInt((Sender as TEdit).Text);
    Except
      PauseRXms := 10000;
    end;
end;

procedure TFormColors.PColorBG_PAUSE_TXTClick(Sender: TObject);
begin
  ColorDialog.Color := ColorBG_Pause_TXT;
  if ColorDialog.Execute then
    ColorBG_Pause_TXT := ColorDialog.Color;
 (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorBG_RTFClick(Sender: TObject);
begin
  ColorDialog.Color := ColorBG_RTF;
  if ColorDialog.Execute then
    ColorBG_RTF := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorBG_TXTClick(Sender: TObject);
begin
  ColorDialog.Color := ColorBG_TXT;
  if ColorDialog.Execute then
    ColorBG_TXT := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorFont_ELClick(Sender: TObject);
begin
  ColorDialog.Color := ColorFont_EL;
  if ColorDialog.Execute then
    ColorFont_EL := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;

end;

procedure TFormColors.PColorFont_RAClick(Sender: TObject);
begin
  ColorDialog.Color := ColorFont_RA;
  if ColorDialog.Execute then
    ColorFont_RA := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorFont_RCClick(Sender: TObject);
begin
  ColorDialog.Color := ColorFont_RC;
  if ColorDialog.Execute then
    ColorFont_RC := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorFont_RDClick(Sender: TObject);
begin
      ColorDialog.Color := ColorFont_RD;
  if ColorDialog.Execute then
    ColorFont_RD := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorFont_RHClick(Sender: TObject);
begin
      ColorDialog.Color := ColorFont_RH;
  if ColorDialog.Execute then
    ColorFont_RH := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorFont_SendClick(Sender: TObject);
begin
  ColorDialog.Color := ColorFont_Send;
  if ColorDialog.Execute then
    ColorFont_Send := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.PColorFont_SMClick(Sender: TObject);
begin
  ColorDialog.Color := ColorFont_SM;
  if ColorDialog.Execute then
    ColorFont_SM := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;

end;

procedure TFormColors.PColorFont_TXTClick(Sender: TObject);
begin
  ColorDialog.Color := ColorFont_TXT;
  if ColorDialog.Execute then
    ColorFont_TXT := ColorDialog.Color;
  (Sender as TPanel).Color := ColorDialog.Color;
end;

procedure TFormColors.TBFontSizeChange(Sender: TObject);
begin
  FontSize := MAX_FONT_SIZE - (Sender as TTrackBar).Position + MIN_FONT_SIZE;
  PnlFont.Font.Size := FontSize;
  PnlFont.Caption :='Size ' + IntToStr(FontSize);
end;

end.

