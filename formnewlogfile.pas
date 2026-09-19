unit formnewlogfile;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormLogFileNew }

  TFormLogFileNew = class(TForm)
    BtnSelectFile: TButton;
    Cancel: TButton;
    BtnOK: TButton;
    CBRx: TCheckBox;
    CBTx: TCheckBox;
    CBEventsLog: TCheckBox;
    EdtNameLogFile: TEdit;
    GroupBox1: TGroupBox;
    OpenFileLog: TOpenDialog;
    RBAppend: TRadioButton;
    RBRewrite: TRadioButton;
    procedure BtnSelectFileClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure CBEventsLogClick(Sender: TObject);
    procedure CBRxClick(Sender: TObject);
    procedure CBTxClick(Sender: TObject);
    procedure EdtNameBinLogFileChange(Sender: TObject);
    procedure EdtNameLogFileChange(Sender: TObject);
    procedure EdtNameLogFileKeyPress(Sender: TObject; var Key: char);
    procedure FormActivate(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
  private

  public
    isOk : boolean;
    NameLogFile       : String;
    FolderInit        : String;
    isLog             : boolean;
    isTxLog           : boolean;
    isRxLog           : boolean;
    isEvTxtLog        : boolean;
    isRewrite         : boolean;
  end;

var
  FormLogFileNew: TFormLogFileNew;

implementation

{$R *.lfm}

{ TFormLogFileNew }

procedure TFormLogFileNew.CancelClick(Sender: TObject);
begin
  FormLogFileNew.Close;
end;

procedure TFormLogFileNew.CBEventsLogClick(Sender: TObject);
begin
  BtnOk.Enabled := (EdtNameLogFile.Text <> '') and (CbRx.Checked or CbTx.Checked or CbEventsLog.Checked) ;
end;

procedure TFormLogFileNew.CBRxClick(Sender: TObject);
begin
  BtnOk.Enabled := (EdtNameLogFile.Text <> '') and (CbRx.Checked or CbTx.Checked or CbEventsLog.Checked) ;
end;

procedure TFormLogFileNew.CBTxClick(Sender: TObject);
begin
  BtnOk.Enabled := (EdtNameLogFile.Text <> '') and (CbRx.Checked or CbTx.Checked or CbEventsLog.Checked) ;
end;

procedure TFormLogFileNew.EdtNameBinLogFileChange(Sender: TObject);
begin

end;

procedure TFormLogFileNew.EdtNameLogFileChange(Sender: TObject);
begin
   BtnOk.Enabled := (EdtNameLogFile.Text <> '') and (CbRx.Checked or CbTx.Checked or CbEventsLog.Checked) ;
end;

procedure TFormLogFileNew.EdtNameLogFileKeyPress(Sender: TObject;
  var Key: char);
begin

end;


procedure TFormLogFileNew.BtnSelectFileClick(Sender: TObject);
begin
  OpenFileLog.InitialDir := FolderInit;
  if OpenFileLog.Execute then
    EdtNameLogFile.Text := OpenFileLog.FileName;
end;

procedure TFormLogFileNew.FormActivate(Sender: TObject);
begin
  isOk := false;
  NameLogFile           := '';
  isLog                 := false;
  isTxLog               := false;
  isRxLog               := false;
  isRewrite             := true;
  EdtNameLogFile.Text   := '';
  CBTx.Checked          := false;
  CBRx.Checked          := false;
  RBRewrite.Checked     := true;
  BtnOk.Enabled         := false;
  CBEventsLog.Checked   := isEvTxtLog;
end;

procedure TFormLogFileNew.BtnOKClick(Sender: TObject);
begin
  NameLogFile       := EdtNameLogFile.Text;
  isTxLog           := CBTx.Checked;
  isRxLog           := CBRx.Checked;
  isEvTxtLog        := CBEventsLog.Checked;
  isLog             := (NameLogFile <> '') and (isTxLog or isRxLog or isEvTxtLog);
  isRewrite         := RBRewrite.Checked;
  isOk := true;
  FormLogFileNew.Close;
end;

end.

