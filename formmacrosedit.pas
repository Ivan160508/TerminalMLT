unit FormMacrosEdit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormEditMacros }

  TFormEditMacros = class(TForm)
    EdtNameCmd: TEdit;
    EdtLineCmd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MHelp: TMemo;
    procedure EdtLineCmdChange(Sender: TObject);
    procedure EdtNameCmdChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MHelpChange(Sender: TObject);
  private

  public
    CmdName : string;
    CmdLine : String;
    CmdHelp : String;
  end;

var
  FormEditMacros: TFormEditMacros;

implementation

{$R *.lfm}

{ TFormEditMacros }

procedure TFormEditMacros.FormActivate(Sender: TObject);
begin
  EdtNameCmd.Text := CmdName;
  EdtLineCmd.Text := CmdLine;
  MHelp.Text      := StringReplace(CmdHelp, '[$0D$0A]', #13#10, [rfReplaceAll]);
end;

procedure TFormEditMacros.MHelpChange(Sender: TObject);
begin
  CmdHelp := (Sender as TMemo).Text;
end;

procedure TFormEditMacros.EdtNameCmdChange(Sender: TObject);
begin
  CmdName := (Sender as Tedit).Text;
end;

procedure TFormEditMacros.EdtLineCmdChange(Sender: TObject);
begin
  CmdLine := (Sender as Tedit).Text;
end;

end.

