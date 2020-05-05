program WIGUSBEncPR;

uses
  Forms,
  MainForm in 'MainForm.pas' {WigFrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TWigFrmMain, WigFrmMain);
  Application.Run;
end.
