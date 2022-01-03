program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FAuth},
  Unit2 in 'Unit2.pas' {FMainScreen},
  UserInfo in 'UserInfo.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.Title := 'яйспя';
  Application.CreateForm(TFAuth, FAuth);
  Application.CreateForm(TFMainScreen, FMainScreen);
  Application.Run;
end.
