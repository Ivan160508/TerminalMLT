unit FormSendMode;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Common;

type

  { TFormModeSendPackets }

  TFormModeSendPackets = class(TForm)
    BtnCancel: TButton;
    BtnOk: TButton;
    EdtPeriod: TEdit;
    GroupBox1: TGroupBox;
    RBByteByByte: TRadioButton;
    RBPeriodic: TRadioButton;
    RBAfterAnswering: TRadioButton;
    RBWhenShoosing: TRadioButton;
    RBManualSend: TRadioButton;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RBAfterAnsweringClick(Sender: TObject);
    procedure RBByteByByteClick(Sender: TObject);
    procedure RBManualSendClick(Sender: TObject);
    procedure RBPeriodicClick(Sender: TObject);
    procedure RBWhenShoosingClick(Sender: TObject);
  private

  public
    OutMode : TOutMode;
    Period  : Cardinal;
    isOk    : boolean;
  end;

var
  FormModeSendPackets: TFormModeSendPackets;

implementation

{$R *.lfm}

{ TFormModeSendPackets }

procedure TFormModeSendPackets.FormActivate(Sender: TObject);
begin
  isOk := false;

  case OutMode of
    TOutMode.TOutManual       : RBManualSend.Checked     := true;
    TOutMode.TOutClickMacros  : RBWhenShoosing.Checked   := true;
    TOutMode.TOutAfterAns     : RBAfterAnswering.Checked := true;
    TOutMode.TOutPeriod       : RBPeriodic.Checked       := true;
    TOutMode.TOutByteToByte   : RBByteByByte.Checked     := true;
  end;

  EdtPeriod.Text := IntToStr(Period);
end;

procedure TFormModeSendPackets.RBAfterAnsweringClick(Sender: TObject);
begin
  OutMode := TOutMode.TOutAfterAns;
end;

procedure TFormModeSendPackets.RBByteByByteClick(Sender: TObject);
begin
  OutMode := TOutMode.TOutByteToByte;
end;

procedure TFormModeSendPackets.RBManualSendClick(Sender: TObject);
begin
  OutMode := TOutMode.TOutManual;
end;

procedure TFormModeSendPackets.RBPeriodicClick(Sender: TObject);
begin
  OutMode := TOutMode.TOutPeriod;
end;

procedure TFormModeSendPackets.RBWhenShoosingClick(Sender: TObject);
begin
  OutMode := TOutMode.TOutClickMacros;
end;

procedure TFormModeSendPackets.BtnOkClick(Sender: TObject);
begin
  isOk := true;
  Period := StrToInt(EdtPeriod.Text);
  FormModeSendPackets.Close;
end;

procedure TFormModeSendPackets.BtnCancelClick(Sender: TObject);
begin
  isOk := false;
  FormModeSendPackets.Close;
end;

end.

