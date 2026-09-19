unit SendFileForm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ReadFile;

type

  { TFormSendFile }

  TFormSendFile = class(TForm)
    BTCancel: TButton;
    BtStopCancelSend: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    StReadData: TStaticText;
    TmrUpd: TTimer;
    procedure BTCancelClick(Sender: TObject);
    procedure BtStopCancelSendClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TmrUpdTimer(Sender: TObject);
  private

  public
    rf : ^TReadFileThr;
  end;

var
  FormSendFile: TFormSendFile;

implementation

{$R *.lfm}

{ TFormSendFile }

procedure TFormSendFile.FormActivate(Sender: TObject);
begin
  TmrUpd.Enabled := true;
end;

procedure TFormSendFile.BTCancelClick(Sender: TObject);
begin
  if rf <> nil then
    rf^.Terminate;
end;

procedure TFormSendFile.BtStopCancelSendClick(Sender: TObject);
begin
  if rf <> nil then
    begin
      if rf^.GetCntByte = 0 then
        rf^.SetIsCancelSend;
    end;
end;

procedure TFormSendFile.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  TmrUpd.Enabled := false;
end;

procedure TFormSendFile.FormCreate(Sender: TObject);
begin
  rf := nil;
end;

procedure TFormSendFile.TmrUpdTimer(Sender: TObject);
begin
  if rf <> nil then
    begin
    STReadData.Caption := IntToStr(rf^.GetCntReadCur);
    if rf^.GetCntByte > 0 then
      begin
        Sleep(50);
        FormSendFile.Close;
      end;
    end
  else
    begin
      FormSendFile.Close;
    end;
end;

end.

