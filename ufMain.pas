unit ufMain;

interface

uses
  Windows, Variants, Forms, Classes,  ShellAPI, IniFiles, VirtualTrees,
  SysUtils, Controls, Menus, ActnList, Graphics, ActiveX,  Math, Messages,
  StrUtils, SpTBXItem, TB2Item, ShlObj, TB2Dock, TB2Toolbar,
  ucHint, ucDialogs, UcButtons, ucFunctions, ucFileSystem, ucWindows, ucClasses,
  ucHotKeys, ucIDObjects;

const
  CM_RestoreFromTray = WM_USER + 1;

type
  TfMainLinker = class(TForm)
    actAddGroup: TAction;
    actAddLink: TAction;
    actDelete: TAction;
    actEdit: TAction;
    ActionList: TActionList;
    N_FindObject: TMenuItem;
    PopupMenu: TPopupMenu;
    VST_Tree: TVirtualStringTree;
    actHelp: TAction;
    actSaveTree: TAction;
    actAutoClose: TAction;
    actAutoMinimize: TAction;
    SpTBXToolbar1: TSpTBXToolbar;
    SpTBXItem1: TSpTBXItem;
    SpTBXItem2: TSpTBXItem;
    Sp_Add: TSpTBXSubmenuItem;
    SpTBXSubmenuItem2: TSpTBXSubmenuItem;
    SpTBXItem5: TSpTBXItem;
    SpTBXItem6: TSpTBXItem;
    SpTBXItem7: TSpTBXItem;
    SpTBXItem8: TSpTBXItem;
    SpTBXItem9: TSpTBXItem;
    SpTBXItem10: TSpTBXItem;
    actExpandAll: TAction;
    actCollapseAll: TAction;
    SpTBXItem3: TSpTBXItem;
    SpTBXItem4: TSpTBXItem;
    mnuExpandAll: TMenuItem;
    mnuCollapseAll: TMenuItem;
    UcBtn_Info: TUcWinButton;
    actInfo: TAction;
    SpTBXSeparatorItem1: TSpTBXSeparatorItem;
    SpTBXItem11: TSpTBXItem;
    SpTBXSeparatorItem2: TSpTBXSeparatorItem;
    actCheckUpdate: TAction;
    SpTBXItem12: TSpTBXItem;
    actRunAsAdmin: TAction;
    mnuRunAsAdmin: TMenuItem;
    actOpen: TAction;
    N1: TMenuItem;
    Act_LeaveDeveloper: TAction;
    SpTBXItem13: TSpTBXItem;
    actOptions: TAction;
    actAbout: TAction;
    SpTBXItem14: TSpTBXItem;
    actFileLocation: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure actAddGroupExecute(Sender: TObject);
    procedure actAddLinkExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure ChBox_AutoCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure VST_TreeBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure VST_TreeDblClick(Sender: TObject);
    procedure VST_TreeDragAllowed(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure VST_TreeDragDrop(Sender: TBaseVirtualTree; Source: TObject;
      DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState;
      Pt: TPoint; var Effect: Integer; Mode: TDropMode);
    procedure VST_TreeDragOver(Sender: TBaseVirtualTree; Source: TObject;
      Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
      var Effect: Integer; var Accept: Boolean);
    procedure VST_TreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VST_TreeGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VST_TreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
        TextType: TVSTTextType; var CellText: string);
    procedure VST_TreeInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure VST_TreeKeyPress(Sender: TObject; var Key: Char);
    procedure VST_TreeMeasureItem(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; var NodeHeight: Integer);
    procedure VST_TreePaintText(Sender: TBaseVirtualTree; const TargetCanvas:
        TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure actHelpExecute(Sender: TObject);
    procedure actSaveTreeExecute(Sender: TObject);
    procedure actAutoCloseExecute(Sender: TObject);
    procedure actAutoMinimizeExecute(Sender: TObject);
    procedure actExpandAllExecute(Sender: TObject);
    procedure actCollapseAllExecute(Sender: TObject);
    procedure VST_TreeFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure VST_TreeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure UcBtn_InfoMouseLeave(Sender: TObject);
    procedure actInfoExecute(Sender: TObject);
    procedure UcBtn_InfoEnter(Sender: TObject);
    procedure VST_TreeScroll(Sender: TBaseVirtualTree; DeltaX, DeltaY: Integer);
    procedure VST_TreeExpanded(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure actCheckUpdateExecute(Sender: TObject);
    procedure actRunAsAdminExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure VST_TreeAfterCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellRect: TRect);
    procedure Act_LeaveDeveloperExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actOptionsExecute(Sender: TObject);
    procedure actFileLocationExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FilterValue: string;
    fNeedSave: Boolean;
    fReadOnlyFS: Boolean;

    GHK_ShowApp: TUcGlobalHotkey; // Глобальная горячая клавиша

    IsFiltered: Boolean;
    Accessed: Boolean;
    function AddItem(FileName: string;
                     Target: PVirtualNode = nil;
                     Mode: TVTNodeAttachMode = amInsertAfter): Boolean;
    procedure FilterTree(const SearchText: string = '');
    procedure ExpandNodes(Expand: Boolean);
    procedure SwitchMode(MainAction, OtherAction : TAction);
    procedure UpdateNodeControls(Node: PVirtualNode);
    procedure DoMouseLeave(Sender: TObject);
    procedure DoOptionsChanged(Sender: TObject);
    function GetIniFormSection: string;
    procedure LoadOptions;
    // Загрузка списка программ
    procedure LoadList; // Загрузка из ini-файла (оставлено для совместимости со старыми версиями)
    procedure LoadXML;  // Загрузка из xml-файла
    //**
    procedure RunProgs(ForceRunAsAdmin : Boolean = False);
    procedure UpdateCaption(const AddText: string = '');
    procedure WMHotKey(var HTK: TWMHotKey); message WM_HOTKEY;
    procedure DoMinimizeProc(Sender: TObject);
    procedure WindowMessage(var Msg: TMessage); message WM_SYSCOMMAND;  //*
    procedure DoRestoreFromTray(var Message: TMessage); message CM_RestoreFromTray;

    procedure AddFiles(DataObject: IDataObject;
                       Target: TVirtualStringTree; Mode: TVTNodeAttachMode); overload;
    procedure AddFiles(DataObject: IDataObject; StrList: TStringList); overload;
    procedure DoStartUpActions(Sender: TObject; var Done: Boolean);
  public
    fCanClose: Boolean;
    procedure SaveOptions;
    procedure SaveXML;
    procedure MinimizeToTray;
    procedure RestoreFromTray;
  end;

  TTreeData = record
    rPath: string;
    rName: string;
    rIcon: string;
    rIconIndex : Integer;
    rParameters: string;
    rShowCmd: Integer;
    //--
    rImageIndex: Integer;
    rNeedIcon: Boolean;
    rIsGroup : Boolean;
    rNote : string;
    rRunAsAdmin : Boolean;
  end;
  PTreeData = ^TTreeData;

var
  fMainLinker: TfMainLinker;

implementation

uses
  uDM, ufEditLink, uIconExtractor, uFunctions, XMLDoc, XMLIntf,
  ufEditGroup, ufHelp, uVTFunctions, ufAbout, ufUpdater, uRPC, ufOptions;

{$R *.dfm}

procedure TfMainLinker.actAboutExecute(Sender: TObject);
begin
  TAbout.Create(Self).ShowModal;
end;

procedure TfMainLinker.actAddGroupExecute(Sender: TObject);
var
  Nd, FocusedNd: PVirtualNode;
begin
  // Подготовка
  FocusedNd := VST_Tree.FocusedNode;
  if FocusedNd <> nil then
    begin
      if TTreeData(VST_Tree.GetNodeData(FocusedNd)^).rIsGroup then
        Nd := VST_Tree.AddChild(FocusedNd)
      else begin
        Nd := VST_Tree.AddChild(FocusedNd.Parent);
        VST_Tree.MoveTo(Nd, FocusedNd, amInsertAfter, False);
      end;
    end
  else
    Nd := VST_Tree.AddChild(nil);

  // Добавление группы
  if TfEditGroup.Create(Self, VST_Tree, Nd, okAdd).ShowModal = mrOk then
    fNeedSave := True
    else
    VST_Tree.DeleteNode(Nd);
end;

procedure TfMainLinker.actAddLinkExecute(Sender: TObject);
begin
  AddItem('');
end;

procedure TfMainLinker.actAutoCloseExecute(Sender: TObject);
begin
//--
  SwitchMode(actAutoClose, actAutoMinimize);
end;

procedure TfMainLinker.actAutoMinimizeExecute(Sender: TObject);
begin
//--
  SwitchMode(actAutoMinimize, actAutoClose);
end;

procedure TfMainLinker.actCheckUpdateExecute(Sender: TObject);
begin
  ufUpdater.CheckUpdate;
end;

procedure TfMainLinker.actCollapseAllExecute(Sender: TObject);
begin
  ExpandNodes(False);
end;

procedure TfMainLinker.actDeleteExecute(Sender: TObject);
var
  s : string;
  NewSelNode: PVirtualNode;
begin
  if Assigned(VST_Tree.GetFirstSelected()) then
  begin
    if VST_Tree.SelectedCount > 1 then
      s := 'Удалить записи?'
      else
      s := 'Удалить запись?';

    if  MessageDlg(s, mtWarning, [mbYes, mbCancel], 0) = mrYes then
    begin
      NewSelNode := VST_Tree.GetNextSibling(VST_Tree.FocusedNode);
      if not Assigned(NewSelNode) then
        NewSelNode := VST_Tree.GetPreviousSibling(VST_Tree.FocusedNode);
      if not Assigned(NewSelNode) then
        NewSelNode := VST_Tree.NodeParent[VST_Tree.FocusedNode];
      if NewSelNode = VST_Tree.RootNode then
        NewSelNode := nil;

      VST_Tree.DeleteSelectedNodes;
      fNeedSave := True;

      if Assigned(NewSelNode) then
      begin
        VST_Tree.FocusedNode := NewSelNode;
        VST_Tree.Selected[NewSelNode] := True;
      end;
    end;
  end;
end;

procedure TfMainLinker.actEditExecute(Sender: TObject);
var MResult: TModalResult;
begin
  MResult := mrNone;
  if Assigned(VST_Tree.FocusedNode) then
    if TTreeData(VST_Tree.GetNodeData(VST_Tree.FocusedNode)^).rIsGroup then
      MResult := TfEditGroup.Create(Self, VST_Tree, VST_Tree.FocusedNode,okEdit).ShowModal
    else
      MResult := TfEditLink.Create(Self, VST_Tree, VST_Tree.FocusedNode,okEdit).ShowModal;
  if MResult = mrOk then
    fNeedSave := True;
end;

procedure TfMainLinker.actExpandAllExecute(Sender: TObject);
begin
  ExpandNodes(True);
end;

procedure TfMainLinker.actFileLocationExecute(Sender: TObject);
var Td: TTreeData;
    fPath: string;
begin
  if Assigned(VST_Tree.FocusedNode) then
  begin
    Td := TTreeData(VST_Tree.GetNodeData(VST_Tree.FocusedNode)^);
    fPath := ExtractFilePath(UC_ExpandFileName(Td.rPath));

    ShellExecute(0, 'open', 'explorer',
                 PChar('/select, ' + UC_ExpandFileName(Td.rPath)),
                 nil, SW_NORMAL);
  end;
end;

procedure TfMainLinker.actHelpExecute(Sender: TObject);
begin
  ShowHelp;
end;

procedure TfMainLinker.actInfoExecute(Sender: TObject);
var Node: PVirtualNode;
    TreeData : PTreeData;
begin
  if UcBtn_Info.Visible then
  begin
    Node:= VST_Tree.GetNodeAt(UcBtn_Info.Left, UcBtn_Info.Top);
    UpdateNodeControls(Node);
  end else
    Node := VST_Tree.FocusedNode;

  TreeData := VST_Tree.GetNodeData(Node);
  if Assigned(TreeData) then
    ShowMyHint(Self, Trim(TreeData^.rPath + ' ' +
                          TreeData^.rParameters + #13#10#13#10 +
                          TreeData^.rNote), 300, 500);
end;

procedure TfMainLinker.actOpenExecute(Sender: TObject);
begin
  RunProgs();
end;

procedure TfMainLinker.actOptionsExecute(Sender: TObject);
begin
  with TOptions.Create(Self) do
  begin
    Init(DM.Options);
    ShowModal;
  end;
end;

procedure TfMainLinker.actRunAsAdminExecute(Sender: TObject);
begin
  RunProgs(True);
end;

procedure TfMainLinker.actSaveTreeExecute(Sender: TObject);
begin
  try
    SaveOptions;
    SaveXML;
    MessageDlg('Список программ успешно сохранен!', mtInformation, [mbOK], 0);
  except
    MessageDlg('Не удалось сохранить список программ!', mtError, [mbOK], 0);
  end;
end;

procedure TfMainLinker.ChBox_AutoCloseClick(Sender: TObject);
begin
  fNeedSave := True;
end;

procedure TfMainLinker.DoStartUpActions(Sender: TObject; var Done: Boolean);
var Ver: string;
begin
  Application.OnIdle := nil;
  // Обработка опций программы
  if DM.Options['StartMinimized'].AsBoolean then
    MinimizeToTray;

  // Проверка обновлений
  if NewUpdateExists(Ver) then
  begin
    if MessageDlg('Доступна новая версия программы Linker v' + Ver + '.'#13#10 + 
                  'Установить эту версию сейчас?',
                  mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
      actCheckUpdate.Execute;
  end;
  //**
end;

function TfMainLinker.AddItem(FileName: string;
                              Target: PVirtualNode = nil;
                              Mode: TVTNodeAttachMode = amInsertAfter): Boolean;
var
    Nd, FocusedNd: PVirtualNode;
    TreeData : PTreeData;
begin
  // Подготовка
  if Assigned(Target) then
    FocusedNd := Target
    else
    FocusedNd := VST_Tree.FocusedNode;

  if FocusedNd <> nil then
    begin
      if TTreeData(VST_Tree.GetNodeData(FocusedNd)^).rIsGroup then
        Nd := VST_Tree.AddChild(FocusedNd)
      else begin
        Nd := VST_Tree.AddChild(FocusedNd.Parent);
        VST_Tree.MoveTo(Nd, FocusedNd, Mode, False);
      end;
    end
  else begin
    Nd := VST_Tree.AddChild(nil);
  end;

  // Редактирование добавленного элемента
  if FileName <> '' then
  begin
    TreeData := VST_Tree.GetNodeData(Nd);
    TreeData^.rPath := FileName;
  end;

  Result := TfEditLink.Create(Self, VST_Tree, Nd, okAdd).ShowModal = mrOk;
  if Result then
    fNeedSave := True
    else
    VST_Tree.DeleteNode(Nd);
end;

procedure TfMainLinker.FilterTree(const SearchText: string = '');
var
  Node: PVirtualNode;
  TreeData : PTreeData;
  SelectedNode: PVirtualNode;
begin
  if SearchText = '' then
  begin
    FilterValue := '';
    UpdateCaption;
  end
  else
    UpdateCaption(' Фильтр: ' + SearchText);

  VST_Tree.BeginUpdate;
  try
    SelectedNode := nil;
    VST_Tree.FocusedNode := nil;

    // Первый проход для фильтрации нодов, кроме групп
    Node := VST_Tree.GetLast;
    while Assigned(Node) do
    begin
      TreeData := VST_Tree.GetNodeData(Node);

      if SearchText = '' then // Показываем все дерево
      begin
        VST_Tree.IsVisible[Node] := True;
        VST_Tree.VisiblePath[Node] := True;
        IsFiltered := False;
      end else
      if Assigned(TreeData) then  // Группы не скрываем
      begin
        if TreeData^.rIsGroup then
          VST_Tree.IsVisible[Node] := VST_Tree.GetFirstVisibleChild(Node) <> nil
        else if Pos(AnsiUpperCase(SearchText), AnsiUpperCase(TreeData^.rName)) > 0 then
        begin
          VST_Tree.IsVisible[Node] := True;
          if Assigned(Node) then
            VST_Tree.VisiblePath[Node] := True;

            SelectedNode := Node;
        end else
        begin
          VST_Tree.IsVisible[Node] := False;
          IsFiltered := True;
        end;
      end;
      VST_Tree.Expanded[Node] := False;

      Node := VST_Tree.GetPrevious(Node);
    end;

  finally
    VST_Tree.EndUpdate;
    VST_Tree.Refresh;
  end;

  ExpandNodes(True);

  if Assigned(SelectedNode) then
  begin
    VST_Tree.ClearSelection;
    VST_Tree.FocusedNode := SelectedNode;
    VST_Tree.Selected[SelectedNode] := True;
  end;
  VST_Tree.FocusedNode := VST_Tree.GetFirstSelected();

  if Assigned(VST_Tree.FocusedNode) then
    VST_Tree.ScrollIntoView(VST_Tree.FocusedNode, True);
end;

procedure TfMainLinker.ExpandNodes(Expand: Boolean);
var Node: PVirtualNode;
begin
  VST_Tree.BeginUpdate;
  try
    Node := VST_Tree.GetFirst();
    while Assigned(Node) do
    begin
      VST_Tree.Expanded[Node] := Expand;
      Node := VST_Tree.GetNext(Node);
    end;
  finally
    VST_Tree.EndUpdate;
  end;

  if Assigned(VST_Tree.FocusedNode) then
    VST_Tree.ScrollIntoView(VST_Tree.FocusedNode, True);
end;

procedure TfMainLinker.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveOptions;
  SaveXML;
  GHK_ShowApp.UnRegisterHotkey;
end;

procedure TfMainLinker.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not fCanClose and DM.Options['MinimizeOnClose'].AsBoolean then
  begin
    CanClose := False;
    MinimizeToTray;
  end;
end;

type
  TCustomControlCrack = class(TCustomControl);

procedure TfMainLinker.FormCreate(Sender: TObject);
begin
  // Инициализация глобальных переменных
  Accessed := False;
  GHK_ShowApp := TUcGlobalHotkey.Create;
  GHK_ShowApp.Handle := Handle;

  fCanClose   := False;
  fNeedSave   := False;
  fReadOnlyFS := False;
  IsFiltered := False;
  FilterValue := '';
  // Инициализация RPC-клиента
  PublicKey := 'linker_secure_pass';
  xrc.URL   := 'optitrex.ru/rpc/index.php';

//  xrc.Proxy := '192.168.1.25';
//  xrc.HttpCli.ProxyAuth := httpAuthBasic;
//  xrc.HttpCli.ProxyUsername := '123';
//  xrc.HttpCli.ProxyPassword := '123';

  // Инициализация проверки обновлений
  Application.OnIdle := DoStartUpActions;
  // Обработки загрузки окна
  VST_Tree.NodeDataSize := SizeOf(TTreeData);

  UpdateCaption;

  DM.Options.RegisterNotify(DoOptionsChanged);
  LoadOptions;

  if FileExists('Links.xml') then
    LoadXML
  else
  if FileExists('Links.ini') then
    LoadList;
  // Tray
  Application.OnMinimize := DoMinimizeProc;
  DM.TrayIcon.Visible := True;
  //--
  UcBtn_Info.Parent := VST_Tree;
  TCustomControlCrack(VST_Tree).OnMouseLeave := DoMouseLeave;
  UpdateNodeControls(nil);
end;

procedure TfMainLinker.FormDestroy(Sender: TObject);
begin
  GHK_ShowApp.Free;
  DM.Options.UnregisterNotify(DoOptionsChanged);
end;

function TfMainLinker.GetIniFormSection: string;
begin
  Result := Format('Screen %dx%d', [Screen.WorkAreaWidth, Screen.WorkAreaHeight]);;
end;

procedure TfMainLinker.LoadList;
var ini: TMemIniFile;
    Ss: TStringList;
    i: integer;
    Nd: PVirtualNode;
    xIconPath : TIconPath;
begin
  ini := TMemIniFile.Create('Links.ini');
  Ss  := TStringList.Create;
  with ini do
  try
    ini.ReadSections(Ss);
    for I := 0 to Ss.Count - 1 do
    begin
      Nd := VST_Tree.AddChild(nil);
      xIconPath := ParceIconPath(ReadString(Ss[i], 'Icon', ''));
      with TTreeData(VST_Tree.GetNodeData(Nd)^) do
      begin
        rName  := ReadString(Ss[i], 'Name', '?');
        rPath  := ReadString(Ss[i], 'Path', '?');
        rIcon  := IfThen(xIconPath.Name <> '', xIconPath.Name, rPath);
        rIconIndex := xIconPath.Index;
        rParameters := ReadString(Ss[i], 'Parameters', '');
        rShowCmd := ReadInteger(Ss[i], 'ShowCmd', 1);
      end;
    end;
  finally
    ini.Free;
    Ss.Free;
  end;
end;

procedure TfMainLinker.LoadOptions;
var ini: TMemIniFile;
    OpNames: TStringList;
    i: Integer;
    FormSection: string;
begin
  ini := TMemIniFile.Create('Options.ini');
  with ini do
  try
    // ПредУстановка опций (если они отсутствуют в ini-файле)
    DM.Options['StartMinimized'].AsBoolean            := False;
    DM.Options['GlobalHotKey_ShowApp'].AsString       := 'Alt+F1';
    DM.Options['AlphaBlend'].AsBoolean                := False;
    DM.Options['AlphaBlendValue'].AsInteger           := 150;
    DM.Options['MinimizeOnClose'].AsBoolean           := False;
    DM.Options['ClassicAppList'].AsBoolean            := False;
    DM.Options['AppList_ColorGroup'].AsInteger        := clGreen;
    DM.Options['AppList_ColorCurrentGroup'].AsInteger := clCream;
    DM.Options['AppList_ColorItem'].AsInteger         := $00FDFDFD;
    DM.Options['AppList_ColorCurrentItem'].AsInteger  := $00A8CAAA;

    // Загрузка настроек
    actAutoMinimize.Checked := ReadBool('General', 'AutoMinimize', false);
    actAutoClose.Checked := (not actAutoMinimize.Checked) and
                            ReadBool('General', 'AutoClose', false);
    // Прозрачность окна (Оставлено для совместимости со старой версией настроек)
    if ini.ValueExists('General', 'AlphaBlend') then
      DM.Options['AlphaBlend'].AsBoolean :=
        ReadBool('General', 'AlphaBlend', false);

    if ini.ValueExists('General', 'AlphaBlendValue') then
      DM.Options['AlphaBlendValue'].AsInteger :=
        ReadInteger('General', 'AlphaBlendValue', 255);
    // Загрузка параметра (Оставлено для совместимости со старой версией настроек)
    if ini.ValueExists('General', 'GlobalHotKey') then
      DM.Options['GlobalHotKey_ShowApp'].AsString :=
        ReadString('General', 'GlobalHotKey', '');
    // Размер/позиция окна
    FormSection := GetIniFormSection;
    Left  := ReadInteger(FormSection, 'Left',   300);
    Top   := ReadInteger(FormSection, 'Top',    300);
    Width := ReadInteger(FormSection, 'Width',  350);
    Height:= ReadInteger(FormSection, 'Height', 380);

    if Left > Screen.WorkAreaWidth then Left := Screen.WorkAreaWidth - Width;
    if Left + Width < 20           then Left := 0;
    if Top > Screen.WorkAreaHeight then Top := Screen.WorkAreaHeight - Height;
    if Top + Height < 20           then Top := 0;
    // !!!!! Загрузка опций программы !!!!! (отработка настроек тут: DoOptionsChanged)
    OpNames := TStringList.Create;
    try
      ini.ReadSection('options', OpNames);
      for i := 0 to OpNames.Count - 1 do
        DM.Options[OpNames[i]].AsString := ReadString('options', OpNames[i], '');
    finally
      OpNames.Free;
    end;
    // Проверка возможности записи файлов настроек
    try
      if FileExists('Options.ini') then
        TFileStream.Create('Options.ini', fmOpenReadWrite).Free
      else
        TFileStream.Create('Options.ini', fmCreate).Free;

      if FileExists('Links.xml') then
        TFileStream.Create('Links.xml', fmOpenReadWrite).Free
      else
        TFileStream.Create('Links.xml', fmCreate).Free;
    except
      fReadOnlyFS         := True;
      Sp_Add.Enabled      := False;
      actEdit.Enabled     := False;
      actDelete.Enabled   := False;
      actSaveTree.Enabled := False;
      actOptions.Enabled  := False;
      MessageDlg('Файлы конфигурации доступны только для чтения!', mtWarning, [mbOK], 0);
    end;
    //**
  finally
    ini.Free;
  end;
end;

procedure TfMainLinker.LoadXML;
var 
  XMLDocument: TXMLDocument;

  procedure LoadXML_(const ANodeList: IXMLNodeList; AParent: PVirtualNode);
  var 
    i: Integer; 
    NewNode: PVirtualNode;
    NodeData: PTreeData;
    xIconPath : TIconPath;
  begin
    for i := 0 to ANodeList.Count - 1 do 
    begin
      NewNode := VST_Tree.AddChild(AParent);
      NodeData := VST_Tree.GetNodeData(NewNode);
      with NodeData^ do
      begin
        rName := VarToWideStr(ANodeList[i].Attributes['Name']);
        rPath := VarToWideStr(ANodeList[i].Attributes['Path']);
        //--
        xIconPath := ParceIconPath(VarToWideStr(ANodeList[i].Attributes['Icon']));
        rIcon := xIconPath.Name;
        rIconIndex := xIconPath.Index;
        //**
        rParameters := VarToWideStr(ANodeList[i].Attributes['Parameters']);
        rShowCmd := StrToInt(VarToWideStr(ANodeList[i].Attributes['ShowCmd']));
        rIsGroup := StrToBool(VarToWideStr(ANodeList[i].Attributes['IsGroup']));
        rNote := VarToWideStr(ANodeList[i].Attributes['Note']);
        rRunAsAdmin := (ANodeList[i].Attributes['RunAsAdmin'] = True);
      end;
      LoadXML_(ANodeList[i].ChildNodes, NewNode);
    end;
  end;

begin
  XMLDocument := TXMLDocument.Create(Self);
  VST_Tree.BeginUpdate;
  try
    try
      // Для каждой ветки XML дерева создать узел в дереве и зарузить поля
      // для структуры данных из аттрибутов
      // Не забываем использовать блоки Begin/End Update.
      XMLDocument.LoadFromFile('Links.xml');
      LoadXML_(XMLDocument.DocumentElement.ChildNodes, nil);
    except // глушим сообщения об ошибке!
    end;
  finally
    VST_Tree.EndUpdate;
    FreeAndNil(XMLDocument);
  end;
end;

procedure TfMainLinker.PopupMenuPopup(Sender: TObject);
var Td: TTreeData;
    VisibleVal: Boolean;
begin
  if Assigned(VST_Tree.FocusedNode) then
    Td := TTreeData(VST_Tree.GetNodeData(VST_Tree.FocusedNode)^);

  VisibleVal := Assigned(VST_Tree.FocusedNode) and (not Td.rIsGroup);
  actRunAsAdmin.Visible   := VisibleVal;
  actFileLocation.Visible := VisibleVal;
  actOpen.Visible         := VisibleVal;
end;

procedure TfMainLinker.RunProgs(ForceRunAsAdmin : Boolean = False);
// ForceRunAsAdmin - принудительно запускать программы с правами админа

var Nd: PVirtualNode;
    Td: TTreeData;
    xPath: string;
    FocusedIsGroup: Boolean;

    procedure RunAsAdministrator(const AExeFile, AParamStr, ADirectory: string;
      AShowCmd : Integer);
    var
      shExecInfo : PShellExecuteInfo;
    begin
    //  Запускает файл с повышенными привилегиями.
      New(shExecInfo);
      shExecInfo^.cbSize := sizeof(ShellExecuteInfo);
      shExecInfo^.fMask := 0;
      shExecInfo^.Wnd := 0;
      shExecInfo^.lpVerb := 'runas';
      shExecInfo^.lpFile := PChar(ExtractFileName(AExeFile));
      shExecInfo^.lpParameters := PChar(AParamStr);
      shExecInfo^.lpDirectory :=  PChar(ADirectory);
      shExecInfo^.nShow := AShowCmd;
      shExecInfo^.hInstApp := 0;
      ShellExecuteEx(shExecInfo);
      Dispose(shExecInfo);
    end;

begin
//  StopExtractIcons;
  ExtractIconsPause;
  DM.RestoreRootPath;
  Nd := VST_Tree.GetFirst;
  while Assigned(Nd) do
  begin
    if (VST_Tree.Selected[Nd]) and
       (VST_Tree.IsVisible[Nd]) and
       (not TTreeData(VST_Tree.GetNodeData(Nd)^).rIsGroup) then
    begin
      Td := TTreeData(VST_Tree.GetNodeData(Nd)^);
      xPath := UC_ExpandFileName(Td.rPath);
      if not (FileExists(xPath)or DirectoryExists(xPath)) then
        xPath := Td.rPath;

      if ForceRunAsAdmin or Td.rRunAsAdmin then
        RunAsAdministrator(PChar(xPath),
                           PChar(Td.rParameters),
                           PChar(ExtractFilePath(xPath)),
                           Td.rShowCmd)
      else
        ShellExecute(0,
                     'open',
                     PChar(xPath),
                     PChar(Td.rParameters),
                     PChar(ExtractFilePath(xPath)),
                     Td.rShowCmd);
    end;

    Nd := VST_Tree.GetNext(Nd);
  end;

  if Assigned(VST_Tree.FocusedNode) then
  begin
    FocusedIsGroup := TTreeData(VST_Tree.GetNodeData(VST_Tree.FocusedNode)^).rIsGroup;

    if actAutoClose.Checked and not FocusedIsGroup then
      Close
    else if actAutoMinimize.Checked and not FocusedIsGroup then
      Application.Minimize
    else
      ExtractIcons(VST_Tree);
  end;
end;

procedure TfMainLinker.SaveOptions;
var ini: TMemIniFile;
    i: Integer;
    fl: TDBFields;
    FormSection: string;
begin
  if not fReadOnlyFS then
  begin
    try
      ini := TMemIniFile.Create('Options.ini');
      try
        with ini do
        begin
          WriteBool('General', 'AutoClose', actAutoClose.Checked);
          WriteBool('General', 'AutoMinimize', actAutoMinimize.Checked);
          // Размер/позиция окна
          FormSection := GetIniFormSection;
          WriteInteger(FormSection, 'Left',   Left);
          WriteInteger(FormSection, 'Top',    Top);
          WriteInteger(FormSection, 'Width',  Width);
          WriteInteger(FormSection, 'Height', Height);
          //**
          fl := DM.Options.FieldList;
          for i := 0 to fl.Count - 1 do
            WriteString('options', fl.Fields[i].FieldName, fl.Fields[i].AsString);

          UpdateFile;
        end;
      finally
        ini.Free;
      end;
    except
    end;
  end;
end;

procedure TfMainLinker.SaveXML;
var
  XMLDocument: TXMLDocument;

  procedure SaveXML_(ANode: PVirtualNode; const AParent: IXMLNode);
  var
    NewNode: IXMLNode;
    NextNode: PVirtualNode;
    NodeData: PTreeData;
  begin
    NextNode := ANode.FirstChild;
    if Assigned(NextNode) then
      repeat 
        NodeData := VST_Tree.GetNodeData(NextNode);
        NewNode := AParent.AddChild('Node');
        with NewNode, NodeData^ do
        begin
          Attributes['Name'] := rName;
          Attributes['Path'] := rPath;
          Attributes['Icon'] := IfThen(rIcon <> '',
                                       rIcon + IconSeparator + IntToStr(rIconIndex),
                                       '');
          Attributes['Parameters'] := rParameters;
          Attributes['ShowCmd'] := rShowCmd;
          Attributes['IsGroup'] := rIsGroup;
          Attributes['Note'] := rNote;
          Attributes['RunAsAdmin'] := rRunAsAdmin;
        end;
        SaveXML_(NextNode, NewNode);
        NextNode := NextNode.NextSibling;
      until 
        NextNode = nil;
  end; 
 
begin
  if fNeedSave and (not fReadOnlyFS) then
  begin
    DeleteFile('Links.xml.bak');
    RenameFile('Links.xml', 'Links.xml.bak');
    XMLDocument := TXMLDocument.Create(Self);
    try
      with XMLDocument do
      begin
        Active := True;
        Encoding := 'UTF-16';
        AddChild('Root');
        Options := Options + [doNodeAutoIndent];
      end;
      SaveXML_(VST_Tree.RootNode, XMLDocument.DocumentElement);
      XMLDocument.SaveToFile('Links.xml');
    finally
      FreeAndNil(XMLDocument);
    end;
  end;
end;

procedure TfMainLinker.SwitchMode(MainAction, OtherAction: TAction);
begin
  //  Делаем так, чтобы только одна из кнопок "Автозакрытие" или
  //  "Автоскрытие" могла быть нажата.
  if MainAction.Checked then
    if OtherAction.Checked then OtherAction.Checked := False;
end;

procedure TfMainLinker.UpdateNodeControls(Node: PVirtualNode);
var R: TRect;
    dTop, NewTop, NewLeft: Integer;
    P: TPoint;
    TreeData : PTreeData;
begin
  if not Assigned(Node) then
    UcBtn_Info.Visible := False
  else begin
    //--
    Windows.GetCursorPos(P);
    P := VST_Tree.ScreenToClient(P);
    R := VST_Tree.GetDisplayRect(Node, -1, False);
    TreeData := VST_Tree.GetNodeData(Node);

    UcBtn_Info.Visible := PtInRect(Rect(R.Right - integer(VST_Tree.DefaultNodeHeight),
                                        R.Top, R.Right, R.Bottom),
                                   P) and
                          (not TreeData^.rIsGroup or
                          (TreeData^.rIsGroup and (TreeData^.rNote <> '')));
    //--
    if UcBtn_Info.Visible then
    begin
      dTop := (R.Bottom - R.Top - UcBtn_Info.Height) div 2;

      NewTop  := R.Top + dTop;
      NewLeft := R.Right - UcBtn_Info.Width - dTop - integer(VST_Tree.GetNodeLevel(Node));

      if (UcBtn_Info.Top <> NewTop)or(UcBtn_Info.Left <> NewLeft) then
      begin
        UcBtn_Info.Top  := NewTop;
        UcBtn_Info.Left := NewLeft;
        UcBtn_Info.Invalidate;
      end;
    end;
  end;
end;

procedure TfMainLinker.DoMouseLeave(Sender: TObject);
var Node: PVirtualNode;
    P: TPoint;
    R: TRect;
begin
  Windows.GetCursorPos(P);
  P := VST_Tree.ScreenToClient(P);
  Node:= VST_Tree.GetNodeAt(P.X, P.Y);

  if Assigned(Node) then
  begin
    R := VST_Tree.GetDisplayRect(Node, -1, False);
    if not PtInRect(UcBtn_Info.BoundsRect, P) then
      UpdateNodeControls(nil);
  end;
end;

procedure TfMainLinker.DoOptionsChanged(Sender: TObject);
var Obj: TIDObject;
    ChField: TDBField;
    FldLst: TDBFields;
begin
  if (Sender is TIDObject) and TIDObject(Sender).IsNormalState then
  begin
    Obj := TIDObject(Sender);
    ChField := Obj.FieldList.ChangedField;
    if Assigned(ChField) then
    begin
      FldLst := DM.Options.FieldList;

      if ChField = FldLst.FindField('GlobalHotKey_ShowApp') then
      begin
        GHK_ShowApp.UnRegisterHotkey;
        GHK_ShowApp.HotkeyStr := ChField.AsString;
        GHK_ShowApp.RegisterHotkey;
      end;

      if ChField = FldLst.FindField('AlphaBlend') then
        AlphaBlend := ChField.AsBoolean;

      if ChField = FldLst.FindField('AlphaBlendValue') then
        AlphaBlendValue := ChField.AsInteger;

      if ChField = FldLst.FindField('ClassicAppList') then
      begin
        if ChField.AsBoolean then
        begin
          VST_Tree.OnBeforeCellPaint := nil;

          VST_Tree.TreeOptions.PaintOptions :=
            VST_Tree.TreeOptions.PaintOptions + [toShowTreeLines];
          VST_Tree.TreeOptions.PaintOptions :=
            VST_Tree.TreeOptions.PaintOptions - [toAlwaysHideSelection];

          VST_Tree.LineStyle                          := lsDotted;
          VST_Tree.Colors.TreeLineColor               := clBtnShadow;
          VST_Tree.Colors.FocusedSelectionColor       := clHighlight;
          VST_Tree.Colors.FocusedSelectionBorderColor := clHighlight
        end else
        begin
          VST_Tree.OnBeforeCellPaint := VST_TreeBeforeCellPaint;

          VST_Tree.TreeOptions.PaintOptions :=
            VST_Tree.TreeOptions.PaintOptions - [toShowTreeLines];
          VST_Tree.TreeOptions.PaintOptions :=
            VST_Tree.TreeOptions.PaintOptions + [toAlwaysHideSelection];

          VST_Tree.LineStyle                          := lsSolid;
          VST_Tree.Colors.TreeLineColor               := clGreen;
          VST_Tree.Colors.FocusedSelectionColor       := $00A8CAAA;
          VST_Tree.Colors.FocusedSelectionBorderColor := clWindowText
        end;
        VST_Tree.Invalidate;
      end;

      if (ChField = FldLst.FindField('AppList_ColorGroup')) or
         (ChField = FldLst.FindField('AppList_ColorCurrentGroup')) or
         (ChField = FldLst.FindField('AppList_ColorItem')) or
         (ChField = FldLst.FindField('AppList_ColorCurrentItem')) then
        VST_Tree.Invalidate;

    end;
  end;
end;

procedure TfMainLinker.UcBtn_InfoEnter(Sender: TObject);
begin
  VST_Tree.SetFocus;
end;

procedure TfMainLinker.UcBtn_InfoMouseLeave(Sender: TObject);
begin
  DoMouseLeave(Sender);
end;

procedure TfMainLinker.UpdateCaption(const AddText: string = '');
begin
  Caption := 'Linker ' + UC_GetExeFileVersionInfo.FileVersion + AddText;
end;

procedure TfMainLinker.VST_TreeAfterCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellRect: TRect);
var
  vst_: TVirtualStringTree;
  TreeData : PTreeData;
  vLvl, L, T: Integer;
begin
  TreeData := Sender.GetNodeData(Node);
  if Assigned(TreeData) and TreeData.rRunAsAdmin then
  begin
    vst_ := TVirtualStringTree(Sender);
    vLvl := vst_.GetNodeLevel(Node) + 1;
    L := CellRect.Left + vLvl * Integer(vst_.Indent) + vst_.Images.Width - DM.ImgList_Buttons.Width;
    T := CellRect.Top + vst_.Images.Height - DM.ImgList_Buttons.Height;
    DM.ImgList_Buttons.Draw(TargetCanvas, L, T, 13);
  end;
end;

procedure TfMainLinker.VST_TreeBeforeCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);

const GrColorDec = 0.05;
      CntColorDec = 0.05;

var
  vst_: TVirtualStringTree;
  GrColor, CntColor, GrSelColor, CntSelColor: TColor;
  Cnv: TCanvas;
  CR: TRect;
  SelLvl, vIndent: Integer;

  function GetColor_(Cl: TColor; Percent: Single): TColor;
  var r, g, b: Byte;
  begin
    percent := IfThen(percent < 0.4, 1 - percent, percent);
    r := Round(GetRValue(Cl) * percent);
    g := Round(GetGValue(Cl) * percent);
    b := Round(GetBValue(Cl) * percent);
    Result := RGB(r, g, b);
  end;

  procedure PaintCell(Lvl: Integer; IsGroup: Boolean);
  begin

    if IsGroup then
    begin
      if Node = vst_.NodeParent[vst_.FocusedNode] then
        Cnv.Brush.Color := GrSelColor
        else
        Cnv.Brush.Color := GetColor_(GrColor, 1 - Lvl * GrColorDec)
    end else
    begin
      if Lvl = SelLvl then
        Cnv.Brush.Color := CntSelColor
        else
        Cnv.Brush.Color := GetColor_(CntColor, 1 - Lvl * CntColorDec);
    end;

    Cnv.FillRect(Rect(CR.Left + vIndent * Lvl,
                 CR.Top, CR.Right, CR.Bottom));
  end;

  procedure PaintFocus(Lvl: Integer; IsGroup: Boolean);
  var R: TRect;
  begin
    R := Rect(CR.Left + Integer(Lvl > 0)*2 + Integer(Lvl = 0) - 1 +
                vIndent * (Lvl - Integer((Lvl > 0) and not IsGroup) + Integer(IsGroup)),
              CR.Top ,
              CR.Right - (Lvl + 1) + 1,
              CR.Bottom  - Integer(not Assigned(vst_.GetNextSibling(Node))) * 1
              );

    if vst_.Selected[Node] then
    begin
//      Cnv.Brush.Color := vst_.Colors.FocusedSelectionColor;
      Cnv.Brush.Color := DM.Options['AppList_ColorCurrentItem'].AsInteger;
      Cnv.FillRect(R);
    end;

    if vst_.FocusedNode = Node then
    begin
      Cnv.Pen.Color := vst_.Colors.FocusedSelectionBorderColor;
      Cnv.Rectangle(R);
    end;
  end;

  procedure PaintVertLines(Lvl: Integer; IsGroup: Boolean);
  var i: Integer;
  begin
    for i := 0 to Lvl do
    begin
      if IsGroup and (i = Lvl) then
      begin
        if Node = vst_.NodeParent[vst_.FocusedNode] then
        begin
          Cnv.Brush.Color := GrSelColor;
          Cnv.Pen.Color   := GrSelColor;
        end else
        begin
          Cnv.Brush.Color := GetColor_(GrColor, 1 - i * GrColorDec);
          Cnv.Pen.Color   := Cnv.Brush.Color;
        end;
      end else
      begin
        if i = SelLvl - 1 then
        begin
          Cnv.Brush.Color := CntSelColor;
          Cnv.Pen.Color   := GrSelColor;
        end else
        begin
          Cnv.Brush.Color := GetColor_(CntColor, 1 - (i + 1) * CntColorDec);
          Cnv.Pen.Color   := GetColor_(GrColor, 1 - i * GrColorDec);
        end;
      end;
      // Рисуем
      Cnv.FillRect(Rect(vIndent * i, CR.Top,
                   vIndent * (i + 1), CR.Bottom));

      Cnv.MoveTo(vIndent * i, CR.Top);
      Cnv.LineTo(vIndent * i, CR.Bottom);

      Cnv.MoveTo(CR.Right - i - 1, CR.Top);
      Cnv.LineTo(CR.Right - i - 1, CR.Bottom);
    end;
  end;

  procedure PaintHorsLines(Lvl: Integer; IsGroup: Boolean);
  var TopNode: PVirtualNode;
  begin
    if (not Assigned(vst_.GetNextSibling(Node)))and
       ((not IsGroup) or (IsGroup and not vst_.Expanded[Node])) then
    begin
      Cnv.Pen.Color := GetColor_(GrColor, 1 - Lvl * GrColorDec);

      TopNode := vst_.NodeParent[Node];
      while Assigned(TopNode) do
      begin
        if not Assigned(vst_.GetNextSibling(TopNode)) then
          Dec(Lvl)
          else begin
            if TopNode = vst_.NodeParent[vst_.FocusedNode] then
              Cnv.Pen.Color   := GrSelColor;
            break;
          end;
        TopNode := vst_.NodeParent[TopNode];
      end;

      if IsGroup then
        Dec(Lvl);

      Cnv.MoveTo(vIndent * Lvl + 1, CR.Bottom - 1);
      Cnv.LineTo(CR.Right - Lvl + 1, CR.Bottom - 1);
    end;
  end;

var
  TreeData : PTreeData;
  vLvl: Integer;
begin
  TreeData := Sender.GetNodeData(Node);
  if Assigned(TreeData) then
    with TargetCanvas do
    begin
      vst_ := TVirtualStringTree(Sender);
      //Настройка цветовой гаммы
//      CntColor    := vst_.Color;
//      GrColor     := clGreen;
//      CntSelColor := clCream;
      CntColor    := DM.Options['AppList_ColorItem'].AsInteger;
      CntSelColor := DM.Options['AppList_ColorCurrentGroup'].AsInteger;
      GrColor     := DM.Options['AppList_ColorGroup'].AsInteger;
      GrSelColor  := GetColor_(CntSelColor, 0.55);
      //**
      Cnv := TargetCanvas;
      CR := CellRect;
      vIndent := vst_.Indent;
//      vIndent := 0;
      Pen.Width := 1;

      try
      // Определяем уровень выделенного узла для подсветки дружественных
        if VT_IsNodeSibling(vst_, vst_.FocusedNode, Node)or
           VT_IsNodeParent(vst_, Node, vst_.NodeParent[vst_.FocusedNode]) then
          SelLvl := vst_.GetNodeLevel(vst_.FocusedNode)
          else
          SelLvl := -1;
      except
        // Иногда при получении уровня узла вылетает ошибка
        SelLvl := -1;
      end;

      // Рисуем ячейку
      PaintCell(vst_.GetNodeLevel(Node), TreeData.rIsGroup);

      vLvl := (Integer(vst_.GetNodeLevel(Node)) - integer(not TreeData.rIsGroup));
      //  Рисуем вертикальную линию группы
      PaintVertLines(vLvl, TreeData.rIsGroup);

      //  ... и горизонтальную линию группы
      PaintHorsLines(vLvl, TreeData.rIsGroup);

      // Рисуем фокус
      PaintFocus(vst_.GetNodeLevel(Node), TreeData.rIsGroup);
    end;
end;

procedure TfMainLinker.VST_TreeDblClick(Sender: TObject);
begin
  if Assigned(VST_Tree.HotNode) and not (TTreeData(VST_Tree.GetNodeData(VST_Tree.HotNode)^).rIsGroup) then
    RunProgs;
end;

procedure TfMainLinker.VST_TreeDragAllowed(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := not fReadOnlyFS;
end;

//---------------------------------------------------------------------------
// Получение имён файлов, брошеных на нас из Explorer’а.
//---------------------------------------------------------------------------
procedure TfMainLinker.AddFiles(DataObject: IDataObject;
                                Target: TVirtualStringTree; Mode: TVTNodeAttachMode);
var
    FormatEtc: TFormatEtc;
    Medium: TStgMedium;
    OLEData: PDropFiles;
    Files: PAnsiChar;
    Str: String;
begin
  if Mode <> amNowhere then
  begin
    // На этот раз нас интересует есть ли в буфере CF_HDROP формат
    with FormatEtc do
    begin
      cfFormat := CF_HDROP;
      ptd := nil;
      dwAspect := DVASPECT_CONTENT;
      lindex := -1;
      tymed := TYMED_HGLOBAL;
    end;
    if DataObject.QueryGetData(FormatEtc) = S_OK then
    begin
      if DataObject.GetData(FormatEtc, Medium) = S_OK then
      begin
        OLEData := GlobalLock(Medium.hGlobal);
        if Assigned(OLEData) then
        begin
          Target.BeginUpdate;
          try
            // А вот с этим Я долго мучался. В Microsoft зажрались и не дали
            // примера работы с DROPFILES структурой.
            // Оказывается, список брошенных файлов хранится в адресе
            // структуры
            // + offset, который и есть OLEData^.pFiles.
            Files := PAnsiChar(OLEData) + OLEData^.pFiles;
            // Список оканчивается двойным null символом
            while Files^ <> #0 do
            begin
              if OLEData^.fWide then
              begin
                Str := PWideChar(Files);
                // +1 нужен для того, чтобы перешагнуть null символ одного
                // из имён файлов в списке
                Inc(Files, (Length(PWideChar(Files)) + 1)*SizeOf(WideChar));
              end
              else begin
                Str := string(Files);
                // Аналогично
                Inc(Files, (Length(PChar(Files)) + 1)*SizeOf(Char));
              end;

              if not AddItem(Str) then Exit;
            end;
          finally
            GlobalUnlock(Medium.hGlobal);
            Target.EndUpdate;
          end;
        end;
        ReleaseStgMedium(Medium);
      end;
    end;
  end;
end;

procedure TfMainLinker.Act_LeaveDeveloperExecute(Sender: TObject);
begin
  GoToWebSite('http://optitrex.ru/pages/602_vashi_idei');
end;

procedure TfMainLinker.AddFiles(DataObject: IDataObject; StrList: TStringList);
var
    FormatEtc: TFormatEtc;
    Medium: TStgMedium;
    OLEData: PDropFiles;
    Files: PAnsiChar;
    Str: String;
begin
    // На этот раз нас интересует есть ли в буфере CF_HDROP формат
    with FormatEtc do
    begin
      cfFormat := CF_HDROP;
      ptd := nil;
      dwAspect := DVASPECT_CONTENT;
      lindex := -1;
      tymed := TYMED_HGLOBAL;
    end;
    if DataObject.QueryGetData(FormatEtc) = S_OK then
    begin
      if DataObject.GetData(FormatEtc, Medium) = S_OK then
      begin
        OLEData := GlobalLock(Medium.hGlobal);
        if Assigned(OLEData) then
        begin
          try
            // А вот с этим Я долго мучался. В Microsoft зажрались и не дали
            // примера работы с DROPFILES структурой.
            // Оказывается, список брошенных файлов хранится в адресе
            // структуры
            // + offset, который и есть OLEData^.pFiles.
            Files := PAnsiChar(OLEData) + OLEData^.pFiles;
            // Список оканчивается двойным null символом
            while Files^ <> #0 do
            begin
              if OLEData^.fWide then
              begin
                Str := PWideChar(Files);
                // +1 нужен для того, чтобы перешагнуть null символ одного
                // из имён файлов в списке
                Inc(Files, (Length(PWideChar(Files)) + 1)*SizeOf(WideChar));
              end
              else begin
                Str := string(Files);
                // Аналогично
                Inc(Files, (Length(PChar(Files)) + 1)*SizeOf(Char));
              end;
              // Заполняем список
              StrList.Add(Str);
              //**
            end;
          finally
            GlobalUnlock(Medium.hGlobal);
          end;
        end;
        ReleaseStgMedium(Medium);
      end;
    end;
end;

procedure TfMainLinker.VST_TreeDragDrop(Sender: TBaseVirtualTree;
  Source: TObject; DataObject: IDataObject; Formats: TFormatArray;
  Shift: TShiftState; Pt: TPoint; var Effect: Integer; Mode: TDropMode);

var
  Attachmode: TVTNodeAttachMode;
  Nodes: TNodeArray;
  TargetNode: PVirtualNode;
  i: Integer;
  StrList: TStringList;
begin
//
  Nodes := nil;
  // Определяем куда добавлять узел в зависимости от того, куда была
  // брошена ветка.
  case Mode of
    dmAbove:
      AttachMode := amInsertBefore;
    dmOnNode:
      AttachMode := amAddChildLast;
    dmBelow:
      AttachMode := amInsertAfter;
  else
    AttachMode := amAddChildLast;
  end;

  if Assigned(Sender.DropTargetNode) then
    TargetNode := Sender.DropTargetNode
    else
    TargetNode := Sender.RootNode;

  if Source is TVirtualStringTree then
  begin
    // Вставка из VT. Можем спокойно пользоваться его методами
    // копирования и перемещения.
    Effect := DROPEFFECT_MOVE;
    // Получем список узлов, которые будут участвовать в Drag&Drop
    Nodes := VST_Tree.GetSortedSelection(True);
    // И работаем с каждым
    for i := 0 to High(Nodes) do
      VST_Tree.MoveTo(Nodes[i], TargetNode, AttachMode, False);
    fNeedSave := True;
  end
  else if Assigned(DataObject) then
  begin
    StrList := TStringList.Create;
    try
      AddFiles(DataObject, StrList);
      for i := 0 to StrList.Count - 1 do
        if not AddItem(StrList[i], TargetNode, AttachMode) then
          Break;
    finally
      StrList.Free;
    end;
  end;
end;

procedure TfMainLinker.VST_TreeDragOver(Sender: TBaseVirtualTree;
  Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint;
  Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
var
  i: Integer;
  Nodes: TNodeArray;
begin
  Accept := (Mode <> dmOnNode)or
            (Assigned(Sender.DropTargetNode)and
             TTreeData(Sender.GetNodeData(Sender.DropTargetNode)^).rIsGroup);

  SetLength(Nodes, 0);
  if (Assigned(Sender.DropTargetNode)) and (Sender.DropTargetNode <> Sender.RootNode) then
    Nodes := (Sender as TVirtualStringTree).GetSortedSelection(True);
  if Length(Nodes) > 0 then
    for i := 0 to Length(Nodes) - 1 do
    begin
      Accept :=
        // Узел не должен быть родителем ветки, в которую производится вставка
        ((not (Source is TVirtualStringTree)) or
        (not VT_IsNodeParent(Sender, Sender.DropTargetNode, Nodes[i])))

        // Также, узел не должен равняться ветке-местоназначению вставки.
        // Т.е. мы должны запретить вставку узла в самого себя.
        {and ((Sender.DropTargetNode <> Nodes[i]))};
      // Отключаем вставку, если хотя бы одно из условий вернуло False
      if ((not TTreeData(Sender.GetNodeData(Sender.DropTargetNode)^).rIsGroup)
          and
         (Mode = dmOnNode)) then Accept := False;

      if not Accept then
        Exit;
    end;

  VTAutoscrollVertical(Sender, Pt);
end;

procedure TfMainLinker.VST_TreeExpanded(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  UpdateNodeControls(nil);
end;

procedure TfMainLinker.VST_TreeFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
  Sender.Invalidate;
  UcBtn_Info.Invalidate;
end;

procedure TfMainLinker.VST_TreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  Finalize(TTreeData(VST_Tree.GetNodeData(Node)^));
end;

procedure TfMainLinker.VST_TreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
var
  TreeData : PTreeData;
begin
  TreeData := Sender.GetNodeData(Node);
  if TreeData.rIsGroup then
    ImageIndex := -1
    else
    ImageIndex := TreeData.rImageIndex;
end;

procedure TfMainLinker.VST_TreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column:
    TColumnIndex; TextType: TVSTTextType; var CellText: String);
begin
  if Column = 0 then CellText := TTreeData(Sender.GetNodeData(Node)^).rName;
end;

procedure TfMainLinker.VST_TreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  i : Integer;
begin
  with TTreeData(VST_Tree.GetNodeData(Node)^) do
  begin
    if rIsGroup then
      i := -1
    else
      i := Integer((rPath <> '') and (ExtractFileExt(rPath) = ''));

    if i in [0, 1] then
      rImageIndex := VST_Tree.Images.AddImage(DM.PngImageList3, i)
      else
      rImageIndex := 0;
    if ((rIcon = '') and (i = 1)) or (rIsGroup and (rIcon = '')) then
      rNeedIcon := False
    else
      rNeedIcon := True;
  end;
  ExtractIcons(VST_Tree);
end;

procedure TfMainLinker.VST_TreeKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13:
      begin
        RunProgs;
        if FilterValue <> '' then
          FilterTree;
      end;
    #27:
      if IsFiltered then // По первому Esc сбрасываем фильтр, по второму сворачиваем окно
        FilterTree
      else
        MinimizeToTray;
    #32..#126, #192..#255: //Сиволы, цифры
      begin
        FilterValue := FilterValue + Key;
        FilterTree(FilterValue);
      end;
    #8: //BackSpace
      begin
        Delete(FilterValue, Length(FilterValue), 1);
        FilterTree(FilterValue);
      end;
  end;
end;

procedure TfMainLinker.VST_TreeMeasureItem(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; var NodeHeight: Integer);
begin
  if TTreeData(Sender.GetNodeData(Node)^).rIsGroup then
    NodeHeight := 20
  else
    NodeHeight := TVirtualStringTree(Sender).DefaultNodeHeight;
end;

procedure TfMainLinker.VST_TreeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var Node: PVirtualNode;
    P: TPoint;
begin
  Windows.GetCursorPos(P);
  P := VST_Tree.ScreenToClient(P);
  Node:= VST_Tree.GetNodeAt(P.X, P.Y);
  UpdateNodeControls(Node);
end;

procedure TfMainLinker.VST_TreePaintText(Sender: TBaseVirtualTree; const
    TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType:
    TVSTTextType);
var
  TreeData: PTreeData;
begin
  TreeData := VST_Tree.GetNodeData(Node);
  if Assigned(TreeData) then
    if TTreeData(VST_Tree.GetNodeData(Node)^).rIsGroup then
    begin
      TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
      if not DM.Options['ClassicAppList'].AsBoolean then
        TargetCanvas.Font.Color := clCream;
    end;

	if (vsSelected in Node.States) and (Sender.Focused) then
    TargetCanvas.Font.Color := clHighlightText;
end;

procedure TfMainLinker.VST_TreeScroll(Sender: TBaseVirtualTree; DeltaX,
  DeltaY: Integer);
begin     UcBtn_Info.CustomHint
end;

// перехват Windows-сообщений при нажатии горячих клавиш
procedure TfMainLinker.WMHotKey(var HTK: TWMHotKey);
begin
  if HTK.HotKey <> GHK_ShowApp.HotkeyID then
    Exit;

  RestoreFromTray;
end;

procedure TfMainLinker.DoMinimizeProc(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE, 0);
end;

procedure TfMainLinker.WindowMessage(var Msg: TMessage);
begin
  if Msg.WParam = SC_MINIMIZE then
    MinimizeToTray
    else
    inherited;
end;

procedure TfMainLinker.DoRestoreFromTray(var Message: TMessage);
begin
  RestoreFromTray;
end;

procedure TfMainLinker.MinimizeToTray;
begin
  Visible := False;
  ShowWindow(Handle, SW_HIDE); // Скрываем программу
  ShowWindow(Application.Handle, SW_HIDE); // Скрываем кнопку с TaskBar'а
end;

procedure TfMainLinker.RestoreFromTray;
begin
  Visible := True;
  ShowWindow(Application.Handle, SW_SHOW); // Восстанавливаем кнопку программы
  ShowWindow(Handle, SW_SHOWNORMAL); // Восстанавливаем окно программы
  Application.BringToFront;
  BringToFront;
  //--
  VST_Tree.SetFocus;
  if (VST_Tree.FocusedNode = nil) and (VST_Tree.TotalCount > 0) then
    VST_Tree.FocusedNode := VST_Tree.GetFirst;

  if Assigned(VST_Tree.FocusedNode) then
    VST_Tree.ScrollIntoView(VST_Tree.FocusedNode, True);
end;

initialization
  IsLibrary := True;

finalization
  IsLibrary := False;

end.
