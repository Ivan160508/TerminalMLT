unit formoldcmd;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TOldcmdform }

  TOldcmdform = class(TForm)
    BtClear: TButton;
    LBOldCmd: TListBox;
    RBEn: TRadioButton;
    procedure BtClearClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LBOldCmdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure RBEnClick(Sender: TObject);
  private

  public
    select : string;
    isClear: boolean;
  end;

var
  Oldcmdform: TOldcmdform;

implementation

{$R *.lfm}

{ TOldcmdform }

procedure TOldcmdform.LBOldCmdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    begin
      select := LBOldCmd.Items[LBOldCmd.ItemIndex];
      Oldcmdform.Close;
      Key := 0;
    end;

  if Key = 27 then
    begin
      select := '';
      Oldcmdform.Close;
      Key := 0;
    end;
end;

procedure TOldcmdform.RBEnClick(Sender: TObject);
begin
  BtClear.Enabled:= true;
end;

procedure TOldcmdform.FormCreate(Sender: TObject);
begin
  select := '';
  isClear := false;
  BtClear.Enabled:= false;
end;

procedure TOldcmdform.FormActivate(Sender: TObject);
begin
  select := '';
  isClear := false;
  BtClear.Enabled:= false;
  RBEn.Checked   := false;
  if LBOldCmd.Count > 0 then
    LBOldCmd.Selected[0] := true;
end;

procedure TOldcmdform.BtClearClick(Sender: TObject);
begin
  LBOldCmd.Clear;
  select := '';
  isClear := true;
  Oldcmdform.Close;
end;

end.

