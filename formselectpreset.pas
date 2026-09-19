unit FormSelectPreset;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormSelectPresets }

  TFormSelectPresets = class(TForm)
    GroupBox1: TGroupBox;
    ListPresets: TListBox;
    StaticText1: TStaticText;
    procedure FormActivate(Sender: TObject);
    procedure ListPresetsDblClick(Sender: TObject);
  private

  public
    NumPreset : integer;
  end;

var
  FormSelectPresets: TFormSelectPresets;

implementation

{$R *.lfm}

{ TFormSelectPresets }

procedure TFormSelectPresets.FormActivate(Sender: TObject);
begin
  NumPreset := 0;
end;

procedure TFormSelectPresets.ListPresetsDblClick(Sender: TObject);
begin
  NumPreset := (Sender as TListBox).ItemIndex + 1;
  FormSelectPresets.Close;
end;

end.

