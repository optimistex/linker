unit ufOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ComCtrls, Menus, Registry, IniFiles,
  ucDialogs, ucIDObjects, UcButtons, ExtCtrls, ucExtCtrls, ucClasses, ucFunctions,
  StdCtrls, frFrameColorEdit, ucStdCtrls;

type
  TOptions = class(TForm)
    UcPanel1: TUcPanel;
    UcWBtn_OK: TUcWinButton;
    UcWBtn_Cancel: TUcWinButton;
    HotKey: THotKey;
    ChBox_Autorun: TCheckBox;
    ChBox_StartMinimized: TCheckBox;
    GroupBox2: TGroupBox;
    ChBox_ClassicAppList: TCheckBox;
    Frm_ColorGroup: TFrameColorEdit;
    Frm_ColorItem: TFrameColorEdit;
    Frm_ColorCurGroup: TFrameColorEdit;
    PageControl: TPageControl;
    TabSheet_General: TTabSheet;
    TabSheet_Styles: TTabSheet;
    GroupBox1: TGroupBox;
    ChBox_MinimizeOnClose: TCheckBox;
    Frm_ColorCurItem: TFrameColorEdit;
    ChBox_AutorunUSB: TCheckBox;
    ChBox_SaveStateAppList: TCheckBox;
    TrackBar_AlphaBlendValue: TTrackBar;
    ChBox_AlphaBlend: TCheckBox;
    Frm_ColorLinkText: TFrameColorEdit;
    Frm_ColorLinkTextErr: TFrameColorEdit;
    Frm_ColorGroupText: TFrameColorEdit;
    Frm_ColorBorder: TFrameColorEdit;
    ChBox_ShowBorder: TCheckBox;
    Bevel1: TBevel;
    GroupBox3: TGroupBox;
    ChBox_AutoMinimeze: TCheckBox;
    ChBox_AutoClose: TCheckBox;
    TabSheet_Help: TTabSheet;
    Memo1: TMemo;
    GroupBox4: TGroupBox;
    BtndEd_AppsPath: TButtonedEdit;
    ChBox_StayOnTop: TCheckBox;
    ChBox_AutoCollapseGroups: TCheckBox;
    Frm_ColorCurItemText: TFrameColorEdit;
    Bevel2: TBevel;
    ChBox_SkipCorruptedLinks: TCheckBox;
    TabSheet_Additional: TTabSheet;
    ChBox_NumberOfStarts: TCheckBox;
    ChBox_AutoUpdate: TCheckBox;
    GroupBox5: TGroupBox;
    UcLbl_TitleUpdateDate: TUcLabel;
    UcWBtn_ResetUpdateDate: TUcWinButton;
    UcLbl_UpdateDate: TUcLabel;
    ChBox_MouseHinting: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UcWBtn_OKClick(Sender: TObject);
    procedure ChBox_AlphaBlendClick(Sender: TObject);
    procedure TrackBar_AlphaBlendValueChange(Sender: TObject);
    procedure ChBox_ClassicAppListClick(Sender: TObject);
    procedure ChBox_AutorunUSBClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChBox_ShowBorderClick(Sender: TObject);
    procedure ChBox_AutoCloseClick(Sender: TObject);
    procedure ChBox_AutoMinimezeClick(Sender: TObject);
    procedure ChBox_MinimizeOnCloseClick(Sender: TObject);
    procedure BtndEd_AppsPathRightButtonClick(Sender: TObject);
    procedure ChBox_AutoUpdateClick(Sender: TObject);
    procedure UcWBtn_ResetUpdateDateClick(Sender: TObject);
    procedure ChBox_SkipCorruptedLinksClick(Sender: TObject);
  private
    { Private declarations }
    fObj: TIDObject;
    fDoSave: Boolean;
    fSaveFields: TDBFields;

    procedure DoColorGroupChanged(Sender: TObject);
    procedure DoColorCurGroupChanged(Sender: TObject);
    procedure DoColorItemChanged(Sender: TObject);
    procedure DoColorCurItemChanged(Sender: TObject);
    procedure DoColorCurItemTextChanged(Sender: TObject);

    procedure DoColorGroupTextChanged(Sender: TObject);
    procedure DoColorBorderChanged(Sender: TObject);
    procedure DoColorLinkTextChanged(Sender: TObject);
    procedure DoColorLinkTextErrChanged(Sender: TObject);


    function ExeNameRelativeDrive: string;
    procedure SwitchMode(MainAction, OtherAction: TCheckBox);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Init(iObj: TIDObject);
    procedure ShowHelp;
  end;

var
  Options: TOptions;

implementation

uses uDM;

{$R *.dfm}

{ TOptions }

procedure TOptions.BtndEd_AppsPathRightButtonClick(Sender: TObject);
begin
  DM.RestoreRootPath;
  if UC_SelectDirectoryCEdit(BtndEd_AppsPath, 'Выбор папки') then
    BtndEd_AppsPath.Text := ExtractRelativePath(DM.WorkPath,
                                                BtndEd_AppsPath.Text);
end;

procedure TOptions.ChBox_AlphaBlendClick(Sender: TObject);
begin
  TrackBar_AlphaBlendValue.Enabled := TCheckBox(Sender).Checked;
  fObj['AlphaBlend'].AsBoolean := TCheckBox(Sender).Checked;
end;

procedure TOptions.ChBox_AutoCloseClick(Sender: TObject);
begin
  SwitchMode(ChBox_AutoClose, ChBox_AutoMinimeze);
end;

procedure TOptions.ChBox_AutoMinimezeClick(Sender: TObject);
begin
  SwitchMode(ChBox_AutoMinimeze, ChBox_AutoClose);
end;

procedure TOptions.ChBox_AutorunUSBClick(Sender: TObject);
begin
  if TCheckBox(Sender).Checked then
    MessageDlg('Внимание!'#13#10 +
           'Данное действие, многими антивирусами, распознается как вирусная активность!'#13#10 +
           'Если ваш антивирус выдаст сообщение об угрозе компьютеру, то не пугайтесь.'#13#10 +
           'Просто позвольте выполнить эту операцию.',
           mtWarning, [mbOK], 0);
end;

procedure TOptions.ChBox_AutoUpdateClick(Sender: TObject);
begin
  UC_SetEnabled(TCheckBox(Sender).Checked, [
    UcLbl_TitleUpdateDate, UcLbl_UpdateDate, UcWBtn_ResetUpdateDate]
  );
end;

procedure TOptions.ChBox_ClassicAppListClick(Sender: TObject);
begin
  fObj['ClassicAppList'].AsBoolean           := TCheckBox(Sender).Checked;
  Frm_ColorGroup.UcWBtn_Color.Enabled        := not TCheckBox(Sender).Checked;
  Frm_ColorCurGroup.UcWBtn_Color.Enabled     := not TCheckBox(Sender).Checked;
  Frm_ColorItem.UcWBtn_Color.Enabled         := not TCheckBox(Sender).Checked;
end;

procedure TOptions.ChBox_MinimizeOnCloseClick(Sender: TObject);
begin
  ChBox_AutoClose.Enabled := not TCheckBox(Sender).Checked;
  if TCheckBox(Sender).Checked and ChBox_AutoClose.Checked then
  begin
    ChBox_AutoClose.Checked    := False;
    ChBox_AutoMinimeze.Checked := True;
  end;
end;

procedure TOptions.ChBox_ShowBorderClick(Sender: TObject);
begin
  fObj['AppList_ShowBorder'].AsBoolean := TCheckBox(Sender).Checked;
end;

procedure TOptions.ChBox_SkipCorruptedLinksClick(Sender: TObject);
begin
  // При фильтрации пропускать ссылки на не найденные программы
  fObj['SkipCorruptedLinksOnFilter'].AsBoolean := ChBox_SkipCorruptedLinks.Checked;
end;

constructor TOptions.Create(AOwner: TComponent);
begin
  inherited;
  fSaveFields := TDBFields.Create;
  fDoSave     := False;
end;

destructor TOptions.Destroy;
begin
  fSaveFields.Free;
  inherited;
end;

procedure TOptions.DoColorCurGroupChanged(Sender: TObject);
begin
  fObj['AppList_ColorCurrentGroup'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.DoColorBorderChanged(Sender: TObject);
begin
  fObj['AppList_ColorBorder'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.DoColorCurItemChanged(Sender: TObject);
begin
  fObj['AppList_ColorCurrentItem'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.DoColorCurItemTextChanged(Sender: TObject);
begin
  fObj['AppList_ColorCurrentItemText'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.DoColorLinkTextErrChanged(Sender: TObject);
begin
  fObj['AppList_ColorLinkTextErr'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.DoColorGroupChanged(Sender: TObject);
begin
  fObj['AppList_ColorGroup'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.DoColorGroupTextChanged(Sender: TObject);
begin
  fObj['AppList_ColorGroupText'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.DoColorItemChanged(Sender: TObject);
begin
  fObj['AppList_ColorItem'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.DoColorLinkTextChanged(Sender: TObject);
begin
  fObj['AppList_ColorLinkText'].AsInteger := TFrameColorEdit(Sender).ColorActive;
end;

procedure TOptions.ShowHelp;
begin
  TabSheet_Help.Show;
end;

procedure TOptions.SwitchMode(MainAction, OtherAction: TCheckBox);
begin
  //  Делаем так, чтобы только одна из кнопок "Автозакрытие" или
  //  "Автоскрытие" могла быть нажата.
  if MainAction.Checked then
    if OtherAction.Checked then OtherAction.Checked := False;
end;

function TOptions.ExeNameRelativeDrive: string;
begin
  Result := ExtractRelativePath(IncludeTrailingBackslash(ExtractFileDrive(Application.ExeName)),
                                Application.ExeName);
end;

procedure TOptions.FormClose(Sender: TObject; var Action: TCloseAction);
var R: TRegistry;
    ini: TIniFile;
    s: string;
    n: SmallInt;
    NeedDelAutorun: Boolean;
begin
  if fDoSave then
  begin
    fDoSave := False;
    // Авотзапуск при старте Windows
    R := TRegistry.Create;
    try
      R.RootKey := HKEY_CURRENT_USER;
      R.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True);
      if ChBox_Autorun.Checked then
        R.WriteString(ExtractFileName(Application.ExeName), Application.ExeName)
        else
        R.DeleteValue(ExtractFileName(Application.ExeName));
      R.CloseKey;
    finally
      R.Free;
    end;
    // Автозапуск с флешки
    NeedDelAutorun := False;
    s := IncludeTrailingBackslash(ExtractFileDrive(Application.ExeName)) + 'autorun.inf';
    if FileExists(s) then
      SetFileAttributes(PChar(s), FILE_ATTRIBUTE_NORMAL);
    ini := TIniFile.Create(s);
    try
      if ChBox_AutorunUSB.Checked then
      begin
        ini.WriteString('autorun', 'UseAutoPlay', '1');
        ini.WriteString('autorun', 'action', 'Linker USB-Menu');
        ini.WriteString('autorun', 'open', ExeNameRelativeDrive);
        ini.WriteString('autorun', 'icon', ExeNameRelativeDrive);
        ini.WriteString('autorun', 'Shell', 'cmd1');
        ini.WriteString('autorun', 'Shell\cmd1', 'Linker USB-Menu');
        ini.WriteString('autorun', 'Shell\cmd1\Command', ExeNameRelativeDrive);
      end else
      begin
        if CompareText(ini.ReadString('autorun', 'open', ''), ExeNameRelativeDrive) = 0 then
          NeedDelAutorun := True;
      end;
    finally
      ini.Free;
    end;
    if NeedDelAutorun then
    begin
      n := 0;
      while FileExists(s) and (n < 5) do
        if not DeleteFile(s) then
          begin
            Sleep(1000);
            Inc(n);
          end;
    end;
    if FileExists(s) then
      SetFileAttributes(PChar(s), FILE_ATTRIBUTE_READONLY or FILE_ATTRIBUTE_HIDDEN);
    // Автозакрытие
    fObj['AutoMinimize'].AsBoolean        := ChBox_AutoMinimeze.Checked;
    // Автосворачивание
    fObj['AutoClose'].AsBoolean           := ChBox_AutoClose.Checked;
    // Горячая клавиша показа окна
    fObj['GlobalHotKey_ShowApp'].AsString := ShortCutToText(HotKey.HotKey);
    // Запускать свернутым
    fObj['StartMinimized'].AsBoolean      := ChBox_StartMinimized.Checked;
    // Свернуть при закрытии
    fObj['MinimizeOnClose'].AsBoolean     := ChBox_MinimizeOnClose.Checked;
    // Сохранять состояние дерева программ при закрытии
    fObj['SaveStateAppList'].AsBoolean    := ChBox_SaveStateAppList.Checked;
    // Путь для сохранения программ
    fObj['AppsPath'].AsString             := BtndEd_AppsPath.Text;
    // Поверх остальных окон
    fObj['StayOnTop'].AsBoolean           := ChBox_StayOnTop.Checked;
    // Автосворачивание групп
    fObj['AutoCollapseGroups'].AsBoolean  := ChBox_AutoCollapseGroups.Checked;
    // Вести статистику количества запусков программы
    fObj['Stat_NumberOfStarts'].AsBoolean := ChBox_NumberOfStarts.Checked;
    // Показывать подсказки сразу при наведении мыши
    fObj['MouseHinting'].AsBoolean := ChBox_MouseHinting.Checked;
    // Выполнять автоматическое обновление программы
    fObj['AutoUpdate_Enabled'].AsBoolean  := ChBox_AutoUpdate.Checked;
  end else
    fObj.FieldList.AssignFields(fSaveFields);

  Action := caFree;
end;

procedure TOptions.FormCreate(Sender: TObject);
begin
  TabSheet_General.Show;
end;

procedure TOptions.Init(iObj: TIDObject);
var R: TRegistry;
    ini: TIniFile;
    s: string;
begin
  fObj := iObj;
  fSaveFields.Clear;
  fSaveFields.AssignFields(fObj.FieldList);

  // Настройка окна
    // Авотзапуск при старте Windows
  R := TRegistry.Create;
  try
    R.RootKey := HKEY_CURRENT_USER;
    R.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', True);

    s := ExtractFileName(Application.ExeName);
    ChBox_Autorun.Checked := R.ValueExists(s) and
                             (CompareText(R.ReadString(s), Application.ExeName) = 0);
    R.CloseKey;
  finally
    R.Free;
  end;
    // Автозапуск с флешки
  s := IncludeTrailingBackslash(ExtractFileDrive(Application.ExeName)) + 'autorun.inf';
  ini := TIniFile.Create(s);
  try
    ChBox_AutorunUSB.Checked := CompareText(ini.ReadString('autorun', 'OPEN', ''), ExeNameRelativeDrive) = 0;
  finally
    ini.Free;
  end;
  ChBox_AutorunUSB.OnClick := ChBox_AutorunUSBClick;
    // Запускать свернутым
  ChBox_StartMinimized.Checked      := fObj['StartMinimized'].AsBoolean;
    // Свернуть при закрытии
  ChBox_MinimizeOnClose.Checked     := fObj['MinimizeOnClose'].AsBoolean;
    // Автозакрытие
  ChBox_AutoClose.Checked           := fObj['AutoClose'].AsBoolean;
    // Автосворачивание
  ChBox_AutoMinimeze.Checked        := fObj['AutoMinimize'].AsBoolean;
    // Сохранять состояние дерева программ при закрытии
  ChBox_SaveStateAppList.Checked    := fObj['SaveStateAppList'].AsBoolean;
    // Горячая клавиша показа окна
  HotKey.HotKey := TextToShortCut(fObj['GlobalHotKey_ShowApp'].AsString);
    // Путь для сохранения программ
  BtndEd_AppsPath.Text              := fObj['AppsPath'].AsString;
    // Поверх остальных окон
  ChBox_StayOnTop.Checked           := fObj['StayOnTop'].AsBoolean;
    // Автосворачивание групп
  ChBox_AutoCollapseGroups.Checked  := fObj['AutoCollapseGroups'].AsBoolean;
    // При фильтрации пропускать ссылки на не найденные программы
  ChBox_SkipCorruptedLinks.Checked  := fObj['SkipCorruptedLinksOnFilter'].AsBoolean;
    // Вести статистику количества запусков программы
  ChBox_NumberOfStarts.Checked      := fObj['Stat_NumberOfStarts'].AsBoolean;
    // Показывать подсказки сразу при наведении мыши
  ChBox_MouseHinting.Checked        := fObj['MouseHinting'].AsBoolean;

    // Выполнять автоматическое обновление программы
  ChBox_AutoUpdate.Checked          := fObj['AutoUpdate_Enabled'].AsBoolean;
    // Дата следующего автообновления
  UcLbl_UpdateDate.Caption          := fObj['AutoUpdate_Date'].AsString;

    // Прозрачность окна программы
  ChBox_AlphaBlend.Checked          := fObj['AlphaBlend'].AsBoolean;
  TrackBar_AlphaBlendValue.Position := fObj['AlphaBlendValue'].AsInteger;
    // Настройка отображения списка программ
  ChBox_ClassicAppList.Checked        := fObj['ClassicAppList'].AsBoolean;
  ChBox_ClassicAppListClick(ChBox_ClassicAppList);

  ChBox_ShowBorder.Checked            := fObj['AppList_ShowBorder'].AsBoolean;

  Frm_ColorGroup.ColorActive          := fObj['AppList_ColorGroup'].AsInteger;
  Frm_ColorGroup.OnColorChanged       := DoColorGroupChanged;

  Frm_ColorCurGroup.ColorActive       := fObj['AppList_ColorCurrentGroup'].AsInteger;
  Frm_ColorCurGroup.OnColorChanged    := DoColorCurGroupChanged;

  Frm_ColorItem.ColorActive           := fObj['AppList_ColorItem'].AsInteger;
  Frm_ColorItem.OnColorChanged        := DoColorItemChanged;

  Frm_ColorCurItem.ColorActive        := fObj['AppList_ColorCurrentItem'].AsInteger;
  Frm_ColorCurItem.OnColorChanged     := DoColorCurItemChanged;

  Frm_ColorCurItemText.ColorActive    := fObj['AppList_ColorCurrentItemText'].AsInteger;
  Frm_ColorCurItemText.OnColorChanged := DoColorCurItemTextChanged;

  Frm_ColorGroupText.ColorActive      := fObj['AppList_ColorGroupText'].AsInteger;
  Frm_ColorGroupText.OnColorChanged   := DoColorGroupTextChanged;

  Frm_ColorBorder.ColorActive         := fObj['AppList_ColorBorder'].AsInteger;
  Frm_ColorBorder.OnColorChanged      := DoColorBorderChanged;

  Frm_ColorLinkText.ColorActive       := fObj['AppList_ColorLinkText'].AsInteger;
  Frm_ColorLinkText.OnColorChanged    := DoColorLinkTextChanged;

  Frm_ColorLinkTextErr.ColorActive    := fObj['AppList_ColorLinkTextErr'].AsInteger;
  Frm_ColorLinkTextErr.OnColorChanged := DoColorLinkTextErrChanged;

  // Настройка обработчиков событий
  ChBox_AlphaBlend.OnClick := ChBox_AlphaBlendClick;
  ChBox_AlphaBlendClick(ChBox_AlphaBlend);
  ChBox_MinimizeOnCloseClick(ChBox_MinimizeOnClose);
  TrackBar_AlphaBlendValue.OnChange := TrackBar_AlphaBlendValueChange;
  //**
end;

procedure TOptions.TrackBar_AlphaBlendValueChange(Sender: TObject);
begin
  fObj['AlphaBlendValue'].AsInteger := TTrackBar(Sender).Position;
end;

procedure TOptions.UcWBtn_OKClick(Sender: TObject);
begin
  fDoSave := True;
end;

procedure TOptions.UcWBtn_ResetUpdateDateClick(Sender: TObject);
begin
  fObj['AutoUpdate_Date'].AsDateTime := Now;
  UcLbl_UpdateDate.Caption := fObj['AutoUpdate_Date'].AsString;
end;

end.
