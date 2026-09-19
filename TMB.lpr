program TMB;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainForm, FormSendMode, formnewlogfile, formsetlog, FormSetColors,
  readfile, SendFileForm, FormSelectPreset, formdecodecustom, formoldcmd,
FormMacrosEdit, TMBOld, FormAbout, tcpportclient, tcpportserver;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='MLT';
  Application.Scaled:=True;
  {$PUSH}{$WARN 5044 OFF}
  Application.MainFormOnTaskbar:=True;
  {$POP}
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormModeSendPackets, FormModeSendPackets);
  Application.CreateForm(TFormLogFileNew, FormLogFileNew);
  Application.CreateForm(TFormLogSetting, FormLogSetting);
  Application.CreateForm(TFormColors, FormColors);
  Application.CreateForm(TFormSendFile, FormSendFile);
  Application.CreateForm(TFormSelectPresets, FormSelectPresets);
  Application.CreateForm(TFormCustomDecode, FormCustomDecode);
  Application.CreateForm(TOldcmdform, Oldcmdform);
  Application.CreateForm(TFormEditMacros, FormEditMacros);
  Application.CreateForm(TFormInfo, FormInfo);
  Application.Run;
end.

