unit formsetlog;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormLogSetting }

  TFormLogSetting = class(TForm)
    AutoLogBin: TCheckBox;
    BtnSearch: TButton;
    AutoLogTxt: TCheckBox;
    BtCancel: TButton;
    BtOK: TButton;
    RBCreateNewFileLogBin: TRadioButton;
    EdtLogFolder: TEdit;
    GBTextLog: TGroupBox;
    GBBinLog: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    RBCreateNewFileLogTxt: TRadioButton;
    RBContinueLogFileTxt: TRadioButton;
    RBContinueLogFileBin: TRadioButton;
    SelectDirectoryDialog: TSelectDirectoryDialog;
    procedure BtCancelClick(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure BtOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private

  public
    isOk : boolean;
    Directory : string;
    isAutoLogText : boolean;
    isAutoLogBin  : boolean;
    isNewLogText  : boolean;
    isNewLogBin   : boolean;
  end;

var
  FormLogSetting: TFormLogSetting;

implementation

{$R *.lfm}

{ TFormLogSetting }

procedure TFormLogSetting.BtCancelClick(Sender: TObject);
begin
  FormLogSetting.Close;
end;

procedure TFormLogSetting.BtnSearchClick(Sender: TObject);
begin
  if SelectDirectoryDialog.Execute then
    EdtLogFolder.Text := SelectDirectoryDialog.FileName;
end;

procedure TFormLogSetting.BtOKClick(Sender: TObject);
begin
  Directory     := EdtLogFolder.Text;
  isAutoLogText := AutoLOgTxt.Checked;
  isAutoLogBin  := AutoLOgBin.Checked;
  isNewLogText  := RBCreateNewFileLogTxt.Checked;
  isNewLogBin   := RBCreateNewFileLogBin.Checked;
  isOk := true;
  FormLogSetting.Close;
end;

procedure TFormLogSetting.FormActivate(Sender: TObject);
begin
  isOk := false;
  EdtLogFolder.Text            := Directory;
  AutoLOgTxt.Checked           := isAutoLogText;
  AutoLOgBin.Checked           := isAutoLogBin;
  RBCreateNewFileLogTxt.Checked:= isNewLogText;
  RBContinueLogFileTxt.Checked := not isNewLogText;
  RBCreateNewFileLogBin.Checked:= isNewLogBin;
  RBContinueLogFileBin.Checked := not isNewLogBin;
end;

end.

