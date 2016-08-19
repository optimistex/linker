unit ufEditLink;

interface

uses
  Windows, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees, UcButtons, uFunctions,
  ActnList, ExtCtrls, ucFileSystem, ucFunctions, FileCtrl, ucHint, ucStdCtrls;

type
  TfEditLink = class(TForm)
    LbEd_FilePath: TLabeledEdit;
    LbEd_FileName: TLabeledEdit;
    OpenDialog: TOpenDialog;
    UcWBtn_Ok: TUcWinButton;
    UcWBtn_Cancel: TUcWinButton;
    UniBtn_Open: TUcWinButton;
    UniBtn_RelPath: TUcWinButton;
    edIcon: TLabeledEdit;
    UniBtn_OpenIcon: TUcWinButton;
    edParameters: TLabeledEdit;
    cbShowCmd: TComboBox;
    Label1: TUcLabel;
    ActionList1: TActionList;
    actCommit: TAction;
    actOpenIcon: TAction;
    actOpen: TAction;
    actRelPath: TAction;
    chbCopy: TCheckBox;
    edFromFolder: TLabeledEdit;
    edToFolder: TLabeledEdit;
    btnSelectFromFolder: TUcWinButton;
    btnSelectToFolder: TUcWinButton;
    actSelectFromFolder: TAction;
    actSelectToFolder: TAction;
    mmNote: TMemo;
    Label2: TUcLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    chbAutoDeleteSrc: TCheckBox;
    chbRunAsAdmin: TCheckBox;
    procedure actCommitExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actOpenIconExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniBtn_RelPathClick(Sender: TObject);
    procedure chbCopyClick(Sender: TObject);
    procedure actSelectFromFolderExecute(Sender: TObject);
    procedure actSelectToFolderExecute(Sender: TObject);
    procedure mmNoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LbEd_FilePathChange(Sender: TObject);
    procedure edIconChange(Sender: TObject);
    procedure chbAutoDeleteSrcClick(Sender: TObject);
    procedure edIconMouseEnter(Sender: TObject);
  private
    { Private declarations }
    VST:  TVirtualStringTree;
    Node: PVirtualNode;
    //--
    fLastFilePath: string;
    //--
    procedure CheckControls;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; crVST: TVirtualStringTree; crNode:
        PVirtualNode; const aOperationKind: TOperationKind); reintroduce;
  end;

var
  fEditLink: TfEditLink;

implementation

uses
  uDM, ufMain2, StrUtils, Math;

{$R *.dfm}
type
  TLabeledEditCrack = class(TLabeledEdit);

constructor TfEditLink.Create(AOwner: TComponent; crVST: TVirtualStringTree;
    crNode: PVirtualNode; const aOperationKind: TOperationKind);
begin
  inherited Create(AOwner);
  fMainLinker.RestoreFromTray;

  LbEd_FilePath.OnChange := LbEd_FilePathChange;
  edIcon.OnChange        := edIconChange;
  LbEd_FileName.OnChange := edIconChange;

  // Инициализация
  fLastFilePath   := '';
  //--
  VST  := crVST;
  Node := crNode;

  if aOperationKind = okAdd then
    Caption := 'Добавление элемента'
  else begin
    Caption := 'Редактирование элемента';
    Panel2.Visible  := False;
    chbCopy.Enabled := False;
  end;

  chbAutoDeleteSrc.Enabled := False;
  DM.RestoreRootPath;
//  edToFolder.Text := IncludeTrailingBackslash(DM.WorkPath) + 'Apps';
  edToFolder.Text := UC_ExpandFileName(DM.Options['AppsPath'].AsString);

  with TTreeData(VST.GetNodeData(Node)^) do
  begin
    LbEd_FileName.Text    := rName;
    edIcon.Text           := rIcon + IconSeparator + IntToStr(rIconIndex);
    LbEd_FilePath.Text    := rPath;
    edParameters.Text     := rParameters;
    cbShowCmd.ItemIndex   := (rShowCmd - 1);
    mmNote.Lines.Text     := rNote;
    chbRunAsAdmin.Checked := rRunAsAdmin;
  end;

  if aOperationKind = okEdit then
    UniBtn_RelPath.Down := not UC_IsAbsolutePath(LbEd_FilePath.Text)
    else begin
      UniBtn_RelPath.Down := True;
      UniBtn_RelPath.Click;
    end;

  if cbShowCmd.ItemIndex < 0 then
    cbShowCmd.ItemIndex := 0;

  CheckControls;
end;

procedure TfEditLink.edIconChange(Sender: TObject);
begin
  CheckControls;
end;

procedure TfEditLink.edIconMouseEnter(Sender: TObject);
begin
  // Назначаем подсказку для пути к иконке
  ShowMyHint(Self,
             'Путь к иконке программы:'#13#10 +
             'd:\folder1\folder2\example.exe|0'#13#10 +
             '..\..\folder2\example.exe|0'#13#10 +
             'notepad.exe|0'#13#10 +
             '%SystemRoot%\system32\shell32.dll|43'
    );
end;

procedure TfEditLink.actCommitExecute(Sender: TObject);

  function CreateNewFilePath(FilePath: string): string;
  var s, src, fp: string;
      p: Integer;
  begin
    src := UC_ExpandFileName(ExcludeTrailingBackslash(edFromFolder.Text));
    fp  := UC_ExpandFileName(ExcludeTrailingBackslash(FilePath));

    p := Pos(src, fp);
    if p <> 1 then
      s := fp
    else begin
      s := Copy(fp, Length(src) + 1, Length(fp));
      if (s <> '')and(s[1] = PathDelim) then
        Delete(s, 1, 1);
//      s := ExtractRelativePath(src, fp);
      s := IncludeTrailingBackslash(edToFolder.Text) +
           IncludeTrailingBackslash(ExtractFileName(src)) + s;
    end;

    if UniBtn_RelPath.Down then
      Result := ExtractRelativePath(DM.WorkPath, s)
      else
      Result := UC_ExpandFileName(s);
  end;

var
  sFileName, ErrMsg: string;
  sIconPath : TIconPath;
  SaveRelBtnDownState: Boolean;
begin
  // Пытаемся инициировать автозаполнение на случай пустых полей!
  SaveRelBtnDownState := UniBtn_RelPath.Down;
  LbEd_FilePathChange(LbEd_FilePath);
  UniBtn_RelPath.Down := SaveRelBtnDownState;
  // Проверки
  ErrMsg := '';

  if (LbEd_FilePath.Text = '')or(LbEd_FileName.Text = '') then
    ErrMsg := ErrMsg + 'Не все поля заполнены!'#13#10;

  if chbCopy.Checked and 
     (Pos(UC_ExpandFileName(edFromFolder.Text), UC_ExpandFileName(LbEd_FilePath.Text)) <> 1) then
    ErrMsg := ErrMsg + 'Выбранный файл должен быть внутри иходной копируемой папки'#13#10;

  if ErrMsg <> '' then
  begin
    MessageDlg(ErrMsg, mtWarning, [mbOK], 0);
    ModalResult := mrNone;
    Exit;
  end;
  //**
  sFileName := LbEd_FilePath.Text;
  sIconPath := ParceIconPath(edIcon.Text);

  if chbCopy.Checked then
  begin
    Enabled := False;
    try
      ForceDirectories(UC_ExpandFileName(edToFolder.Text));
      if UC_SHCopyFiles(Handle,
                        UC_ExpandFileName(edFromFolder.Text),
                        UC_ExpandFileName(edToFolder.Text), False) then
      begin
        sFileName      := CreateNewFilePath(sFileName);
        sIconPath.Name := CreateNewFilePath(sIconPath.Name);
        if chbAutoDeleteSrc.Checked then
          UC_RemoveDir(UC_ExpandFileName(edFromFolder.Text));
      end else
      begin
        ModalResult := mrNone;
        Exit;
      end;
    finally
      Enabled := True;
    end;
  end;

  with TTreeData(VST.GetNodeData(Node)^) do
  begin
    rPath       := sFileName;
    rName       := Trim(LbEd_FileName.Text);
    rIcon       := sIconPath.Name;
    rIconIndex  := sIconPath.Index;
    rParameters := Trim(edParameters.Text);
    rShowCmd    := (cbShowCmd.ItemIndex + 1);
    rType       := itLink;
    rNote       := mmNote.Lines.Text;
    rRunAsAdmin := chbRunAsAdmin.Checked;
  end;

  VST.ReinitNode(Node, False);
end;

procedure TfEditLink.actOpenExecute(Sender: TObject);
begin
  OpenDialog.InitialDir := ExtractFilePath(UC_ExpandFileName(Trim(LbEd_FilePath.Text)));
  if not OpenDialog.Execute() then Exit;
  DM.RestoreRootPath;

  if UniBtn_RelPath.Down then
    LbEd_FilePath.Text := ExtractRelativePath(DM.WorkPath, OpenDialog.FileName)
    else
    LbEd_FilePath.Text := OpenDialog.FileName;
end;

procedure TfEditLink.LbEd_FilePathChange(Sender: TObject);

  function CreateFileName(FilePath: string): string;
  begin
    FilePath := ChangeFileExt(ExtractFileName(FilePath), ''); // Убираем расширение
    // Убираем слово Portable
    Result := Trim(StringReplace(FilePath, 'Portable', '', [rfReplaceAll, rfIgnoreCase]));
  end;

  function CreateFromPath(FilePath: string): string;
  begin
    Result := ExcludeTrailingBackslash(ExtractFilePath(UC_ExpandFileName(FilePath)));
  end;

var IconInfo: TIconPath;
begin
  // Кнопка относительного пути
  UniBtn_RelPath.Down := not UC_IsAbsolutePath(TEdit(Sender).Text);
  // Авто-заполнение пути к иконке
  IconInfo := ParceIconPath(edIcon.Text);
  if (Trim(IconInfo.Name) = '')or(IconInfo.Name = fLastFilePath) then
    edIcon.Text := TEdit(Sender).Text + IconSeparator + IntToStr(IconInfo.Index);
  // Авто-заполнение имени файла
  if (Trim(LbEd_FileName.Text) = '')or
     (CreateFileName(fLastFilePath) = LbEd_FileName.Text) then
    LbEd_FileName.Text := CreateFileName(TEdit(Sender).Text);
  // Авто-заполнение папки копирования
  if (Trim(edFromFolder.Text) = '')or
     (UC_ExpandFileName(edFromFolder.Text) = CreateFromPath(fLastFilePath)) then
    edFromFolder.Text := CreateFromPath(TEdit(Sender).Text);
  //**
  CheckControls;
  // Запоминаем текущее значение
  fLastFilePath := TEdit(Sender).Text;
  //**
end;

procedure TfEditLink.CheckControls;
begin
  LbEd_FilePath.Color := IfThen(LbEd_FilePath.Text = '', $00CECDF5, clWindow);
  edIcon.Color        := IfThen(edIcon.Text = '',        $00CECDF5, clWindow);
  LbEd_FileName.Color := IfThen(LbEd_FileName.Text = '', $00CECDF5, clWindow);
end;

procedure TfEditLink.actOpenIconExecute(Sender: TObject);
var
  xIconPath : TIconPath;
begin
  if Trim(edIcon.Text) <> '' then
    xIconPath := ParceIconPath(Trim(edIcon.Text))
    else
    if (Trim(LbEd_FilePath.Text) <> '') then
      xIconPath := ParceIconPath(Trim(LbEd_FilePath.Text))
      else
      xIconPath := ParceIconPath(Application.ExeName);

  DM.RestoreRootPath;
  xIconPath.Name := UC_ExpandFileName(xIconPath.Name);
  if PickIconDlg(Handle, xIconPath.Name, xIconPath.Index) then
  begin
    if UniBtn_RelPath.Down then
      edIcon.Text := ExtractRelativePath(DM.WorkPath, xIconPath.Name)+ IconSeparator + IntToStr(xIconPath.Index)
      else
      edIcon.Text := xIconPath.Name + IconSeparator + IntToStr(xIconPath.Index);
  end;
end;

procedure TfEditLink.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfEditLink.mmNoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  State : TKeyboardState;
begin
  case key of
    VK_RETURN: begin
      GetKeyboardState(State);
      if ((State[vk_Control] and 128) = 0) then
      begin
        actCommit.Execute;
        ModalResult := mrOk;
      end;
    end;
    VK_ESCAPE: ModalResult := mrCancel;
  end;
end;

procedure TfEditLink.UniBtn_RelPathClick(Sender: TObject);
begin
  if TUcWinButton(Sender).Down then
    LbEd_FilePath.Text := ExtractRelativePath(DM.WorkPath, LbEd_FilePath.Text)
    else
    LbEd_FilePath.Text := UC_ExpandFileName(LbEd_FilePath.Text);
end;

procedure TfEditLink.chbAutoDeleteSrcClick(Sender: TObject);
begin
  if TCheckBox(Sender).Tag <> 0 then
    TCheckBox(Sender).Tag := 0
    else
      if TCheckBox(Sender).Checked and
         (MessageDlg('Включение этой опции приведет к УДАЛЕНИЮ исходной папки программы!'#13#10 +
                     'В данный момент это папка: "' + edFromFolder.Text + '"'#13#10#13#10 +
                     'Вы подтверждаете включение этой опции?',
                     mtWarning, [mbYes, mbCancel], 0) <> mrYes) then
      begin
        TCheckBox(Sender).Tag     := 1;
        TCheckBox(Sender).Checked := False;
      end;
end;

procedure TfEditLink.chbCopyClick(Sender: TObject);
begin
  UC_SetEnabled(TCheckBox(Sender).Checked, [edFromFolder, edToFolder]);
  UC_SetEnabled(TCheckBox(Sender).Checked, [actSelectFromFolder, actSelectToFolder]);
  chbAutoDeleteSrc.Enabled := TCheckBox(Sender).Checked;

  if TCheckBox(Sender).Checked then
  begin
    edFromFolder.Color := clWindow;
    edToFolder.Color   := clWindow;
  end else
  begin
    edFromFolder.Color := clBtnFace;
    edToFolder.Color   := clBtnFace;
  end;
end;

procedure TfEditLink.actSelectFromFolderExecute(Sender: TObject);
begin
  if UC_SelectDirectoryCEdit(edFromFolder, 'Выберите папку - источник') then
    edFromFolder.Text := ExcludeTrailingBackslash(edFromFolder.Text);
end;

procedure TfEditLink.actSelectToFolderExecute(Sender: TObject);
begin
  if UC_SelectDirectoryCEdit(edToFolder, 'Выберите папку назначения', [sdNewFolder, sdNewUI]) then
    edToFolder.Text := ExcludeTrailingBackslash(edToFolder.Text);
end;

end.
