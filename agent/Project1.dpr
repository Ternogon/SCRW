program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FService};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '— ”–— Ч јгент безопасности';
  Application.CreateForm(TFService, FService);
  Application.ShowMainForm := False;
  Application.Run;
end.
