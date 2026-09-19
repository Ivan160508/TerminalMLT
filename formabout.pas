unit FormAbout;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFormInfo }

  TFormInfo = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    LblDonat: TLabel;
    LblDonat1: TLabel;
    LblVer: TLabel;
    Memo1: TMemo;
  private

  public

  end;

var
  FormInfo: TFormInfo;

implementation

{$R *.lfm}

end.

