unit ufUpdater;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ucFileSystem, ucFunctions, ucAutoUpdate, StdCtrls, ComCtrls,
  OverbyteIcsHttpProt, ucStdCtrls, ucTypes;

type
  TUpdater = class(TForm)
    PrBar: TProgressBar;
    Lbl_Info: TUcLabel;
    Btn_Cancel: TButton;
    procedure Btn_CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Closing: Boolean;
    procedure Msg(Txt: string; Fault: Boolean = False);
    procedure DoXrcNonification(Sender: TObject);
  public
    { Public declarations }
    procedure Execute;
    procedure Countdown;
  end;

  procedure CheckUpdate;
  function NewUpdateExists(var Ver: string): Boolean;

var
  Updater: TUpdater;

implementation

uses ufMain2, uRPC;

{$R *.dfm}
procedure CheckUpdate;
begin
  with TUpdater.Create(nil) do
  try
    Show;
    Execute;
    Countdown;
  finally
    Free;
  end;
end;

function NewUpdateExists(var Ver: string): Boolean;
var Path, SelfVer: string;
    fvi: TUcFileVersionInfo;
begin
  Result := False;
  if not RPC_ChekAccess(True) then Exit;

  if not RPC_ClientInfo(Ver, Path) then Exit;

  // Получаем версию "себя"
  fvi := TUcFileVersionInfo.Create(Application.ExeName);
  SelfVer := fvi.FileVersion;
  fvi.Free;

  // Если на сервере более новый релиз, то самообновляемся
  Result := UC_CompareVersions(Ver, SelfVer) > 0;
end;

{ TUpdater }

procedure TUpdater.Btn_CancelClick(Sender: TObject);
begin
  xrc.HttpCli.Close;
  Close;
end;

procedure TUpdater.Countdown;
const WaitSec = 10;
var t1: TDateTime;
begin
  t1 := Now;
  while ((Now - t1) * 24 * 60 * 60 < WaitSec) and not Closing do
  begin
    Btn_Cancel.Caption := 'OK (' + IntToStr(Round(WaitSec - (Now - t1) * 24 * 60 * 60)) + ')';
    Application.ProcessMessages;
  end;
end;

procedure TUpdater.DoXrcNonification(Sender: TObject);
const PrBarStyle: array[Boolean] of TProgressBarStyle = (pbstNormal, pbstMarquee);
      PrBarState: array[Boolean] of TProgressBarState = (pbsNormal, pbsError);
begin
  if (Sender = xrc) and (xrc.IsNormalState) then
  begin
    if niMax in xrc.NotifyInf then PrBar.Max := xrc.NotifyMax;
    if niPos in xrc.NotifyInf then
    begin
      PrBar.Style    := PrBarStyle[xrc.NotifyPos < 0];
      PrBar.Position := xrc.NotifyPos;

//      if (not (niTxt in xrc.NotifyInf)) and (xrc.NotifyPos >= 0) and
//         (xrc.NotifyMax <> 0) then
//        Lbl_Status.Caption := Format('Загружено %4.2f%%',
//                                     [(xrc.NotifyPos/xrc.NotifyMax) * 100]);
    end;

//    if (niTxt in xrc.NotifyInf) then
//      Lbl_Status.Caption := xrc.NotifyTxt;

    PrBar.State := PrBarState[xrc.WereErrors];
  end;
end;

procedure TUpdater.Execute;
var Ver, Path, SelfVer: string;
    ms: TMemoryStream;
    fvi: TUcFileVersionInfo;
begin
  PrBar.Style := pbstMarquee;
  Msg('Подключение к серверу обновлений.');
  if not RPC_ChekAccess(True) then
  begin
    Msg('Не удалось подключиться к серверу обновлений.', True);
    PrBar.Style := pbstNormal;
    Exit;
  end;

  Msg('Получаем информацию о доступной версии');
  if not RPC_ClientInfo(Ver, Path) then
  begin
    Msg('Не удалось получить информацию об обновлении.', True);
    PrBar.Style := pbstNormal;
    Exit;
  end;

  // Получаем версию "себя"
  fvi := TUcFileVersionInfo.Create(Application.ExeName);
  SelfVer := fvi.FileVersion;
  fvi.Free;

  PrBar.Style := pbstNormal;
  // Если на сервере более новый релиз, то самообновляемся
  if UC_CompareVersions(Ver, SelfVer) > 0 then
  begin
    ms := TMemoryStream.Create;
    try
//      xrc.ProgressBar := PrBar;
      xrc.RegisterNotify(DoXrcNonification);
      Msg('Загрузка новой версии ' + Ver + '.');
      if RPC_GetFile(Path, ms) then
      begin
        fMainLinker.SaveXML;
        UpdateFromStream(ms, 'updated');
      end else
      begin
//        xrc.ProgressBar := nil;
        xrc.UnregisterNotify(DoXrcNonification);
        Msg('Не удалось загрузить обновление.', True);
      end;
    finally
      ms.Free;
    end;
  end else
    Msg('У вас самая последняя версия программы.'#13#10'Следите за обновлениями!');
end;

procedure TUpdater.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Closing := True;
end;

procedure TUpdater.FormCreate(Sender: TObject);
begin
  Closing := False;
end;

procedure TUpdater.Msg(Txt: string; Fault: Boolean = False);
begin
  if Fault and (xrc.FaultString <> '') then
    Lbl_Info.Caption := Txt + #13#10 + xrc.FaultString
    else
    Lbl_Info.Caption := Txt;

  Lbl_Info.Top := PrBar.Top - Lbl_Info.Height - 6;
end;

end.
