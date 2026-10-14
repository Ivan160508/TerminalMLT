unit FormMacrosEdit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, common;

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
    procedure FormCreate(Sender: TObject);
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

procedure TFormEditMacros.FormCreate(Sender: TObject);
begin
  EdtLineCmd.MaxLength:= LEN_MACROS_STR shr 1;
  EdtNameCmd.MaxLength:= LEN_MACROS_STR shr 1;

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

