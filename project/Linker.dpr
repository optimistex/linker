program Linker;

{$R *.dres}

uses
  FastMM4,
  Forms,
  Windows,
  ucWindows,
  ufMain2 in 'forms\ufMain2.pas' {fMainLinker},
  ufEditLink in 'forms\ufEditLink.pas' {fEditLink},
  uIconExtractor in 'units\uIconExtractor.pas',
  uFunctions in 'units\uFunctions.pas',
  ufEditGroup in 'forms\ufEditGroup.pas' {fEditGroup},
  uDM in 'DataModule\uDM.pas' {DM: TDataModule},
  uVTFunctions in 'units\uVTFunctions.pas',
  ufAbout in 'forms\ufAbout.pas' {About},
  ufUpdater in 'forms\ufUpdater.pas' {Updater},
  uRPC in 'units\uRPC.pas',
  ufOptions in 'forms\ufOptions.pas' {Options},
  frFrameColorEdit in 'frame\frFrameColorEdit.pas' {FrameColorEdit: TFrame},
  ufStatistics in 'forms\ufStatistics.pas' {Statistics},
  ufTaskReminder in 'forms\ufTaskReminder.pas' {TaskReminder},
  uClasses in 'units\uClasses.pas',
  fmApplicationList in 'frame\fmApplicationList.pas' {ApplicationList: TFrame};

{$R *.res}
var
  h: HWND;

begin
  if not UC_InitMutex('Linker_Mutex') then
  begin
    h := FindWindow('TfMainLinker', nil);
    if h <> 0 then
      PostMessage(h, CM_RestoreFromTray, 0, 0);
  end else
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TDM, DM);
  Application.CreateForm(TfMainLinker, fMainLinker);
  Application.Run;
  end;
end.
