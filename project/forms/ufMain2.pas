unit ufMain2;

interface

uses
  Windows, Variants, Forms, Classes,  ShellAPI, IniFiles, VirtualTrees,
  SysUtils, Controls, Menus, ActnList, Graphics, ActiveX,  Math, Messages,
  StrUtils, SpTBXItem, TB2Item, ShlObj, TB2Dock, TB2Toolbar, XMLDoc, XMLIntf,
  ucHint, ucDialogs, UcButtons, ucFunctions, ucFileSystem, ucWindows, ucClasses,
  ucHotKeys, ucIDObjects, uVTFunctions, uClasses, ExtCtrls, UcNetscapeSplitter,
  fmApplicationList;

const
  // ���������
  CM_RestoreFromTray = WM_USER + 1;

  // �����
  flXML_Linker     = 'Linker.xml';      // ��������� ���������
  flXML_Linker_Bak = 'Linker.xml.bak';  // ��������� ����� ���������� ���������
  flINI_Options    = 'Options.ini';     // ��������� ���������
  // ������ ����� (��� �������������)
  flXML_Links      = 'Links.xml';       // ��������� ��������� (�� ��������������)
  flXML_Links_Bak  = 'Links.xml.bak';   // ��������� ����� ���������� ��������� (�� ��������������)
  flINI_Links      = 'Links.ini';       // ��������� ��������� (�� ������ 1.x.x.x)

  // ������ XML �����. �� ������ ������� ��������� � ������ �������� ������
  verXML_11  = '1.1'; // ��������� ������ XML ���������� ���������
  verXML_10  = '1.0';

  // ����������������� ����� XML �����
  ndRoot    = 'linker';   // �������� ����

  ndOptions = 'options';  // ���� � ����������� ���������
  ndOption  = 'option';   // ���� � ������ ���������
  ndScreen  = 'screen';   // ���� �������� ������� �� ������

  ndAppList = 'applist';  // ������ ��������
  ndAppItem = 'el';     // ������� ������ ��������
  // ����������������� ����� ���������� XML �����
  ndRoot_v0     = 'Root';  // �������� ���� (��� ������ verXML_0)
  ndItem_v0     = 'Node';  // ������� ������ �������� (��� ������ verXML_0)
  ndAppItem_v10 = 'item';     // ������� ������ ��������

type
  TItemType = (itLink, itGroup, itDivider);

  TfMainLinker = class(TForm)
    actAddGroup: TAction;
    actAddLink: TAction;
    actDelete: TAction;
    actEdit: TAction;
    ActionList: TActionList;
    N_FindObject: TMenuItem;
    PopupMenu: TPopupMenu;
    VST: TVirtualStringTree;
    actHelp: TAction;
    actSaveTree: TAction;
    SpTBXToolbar1: TSpTBXToolbar;
    SpTBXItem1: TSpTBXItem;
    SpTBXItem2: TSpTBXItem;
    Sp_Add: TSpTBXSubmenuItem;
    SpTBXSubmenuItem2: TSpTBXSubmenuItem;
    SpTBXItem5: TSpTBXItem;
    SpTBXItem6: TSpTBXItem;
    SpTBXItem7: TSpTBXItem;
    SpTBXItem10: TSpTBXItem;
    actExpandAll: TAction;
    actCollapseAll: TAction;
    SpTBXItem3: TSpTBXItem;
    SpTBXItem4: TSpTBXItem;
    mnuExpandAll: TMenuItem;
    mnuCollapseAll: TMenuItem;
    UcBtn_Info: TUcWinButton;
    actInfo: TAction;
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
    SpTBXRightAlignSpacerItem1: TSpTBXRightAlignSpacerItem;
    actShowProperties: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    actAddDivider: TAction;
    SpTBXItem15: TSpTBXItem;
    N10: TMenuItem;
    actShowStat: TAction;
    SpTBXItem16: TSpTBXItem;
    actExit: TAction;
    SpTBXItem8: TSpTBXItem;
    ActShowCorruptedLinks: TAction;
    SpTBXItem9: TSpTBXItem;
    actClone: TAction;
    N11: TMenuItem;
    procedure actAddGroupExecute(Sender: TObject);
    procedure actAddLinkExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure ChBox_AutoCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure VSTBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure VSTDblClick(Sender: TObject);
    procedure VSTDragAllowed(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
    procedure VSTDragDrop(Sender: TBaseVirtualTree; Source: TObject;
      DataObject: IDataObject; Formats: TFormatArray; Shift: TShiftState;
      Pt: TPoint; var Effect: Integer; Mode: TDropMode);
    procedure VSTDragOver(Sender: TBaseVirtualTree; Source: TObject;
      Shift: TShiftState; State: TDragState; Pt: TPoint; Mode: TDropMode;
      var Effect: Integer; var Accept: Boolean);
    procedure VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTGetImageIndex(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
        TextType: TVSTTextType; var CellText: string);
    procedure VSTInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure VSTKeyPress(Sender: TObject; var Key: Char);
    procedure VSTMeasureItem(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; var NodeHeight: Integer);
    procedure VSTPaintText(Sender: TBaseVirtualTree; const TargetCanvas:
        TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure actHelpExecute(Sender: TObject);
    procedure actSaveTreeExecute(Sender: TObject);
    procedure actExpandAllExecute(Sender: TObject);
    procedure actCollapseAllExecute(Sender: TObject);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure VSTMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure UcBtn_InfoMouseLeave(Sender: TObject);
    procedure actInfoExecute(Sender: TObject);
    procedure UcBtn_InfoEnter(Sender: TObject);
    procedure VSTScroll(Sender: TBaseVirtualTree; DeltaX, DeltaY: Integer);
    procedure VSTExpanded(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure actCheckUpdateExecute(Sender: TObject);
    procedure actRunAsAdminExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure VSTAfterCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellRect: TRect);
    procedure Act_LeaveDeveloperExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actOptionsExecute(Sender: TObject);
    procedure actFileLocationExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actShowPropertiesExecute(Sender: TObject);
    procedure actAddDividerExecute(Sender: TObject);
    procedure actShowStatExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure VSTClick(Sender: TObject);
    procedure ActShowCorruptedLinksExecute(Sender: TObject);
    procedure actCloneExecute(Sender: TObject);
  private
    FilterValue: string;
    fNeedSave: Boolean;
    fReadOnlyFS: Boolean;

    GHK_ShowApp: TUcGlobalHotkey; // ���������� ������� �������

    IsFiltered: Boolean;
    Accessed: Boolean;
    DOM: IXMLDocument; // XML � ����������� ���������
    fXML_Corrupted: Boolean; //
    procedure UpdateActionControls;
    procedure ShowOptions(iShowHelp: Boolean);
    function CreateXMLDocument: IXMLDocument;
    procedure SetReadOnlyFS(const Value, SilentMode: Boolean);
    procedure SetFocusToNode(Node: PVirtualNode; ScrollTo: Boolean);

    function AddItem(ItemTtype: TItemType; FileName: string = '';
                      Target: PVirtualNode = nil;
                      Mode: TVTNodeAttachMode = amInsertBefore): Boolean;
    procedure FilterTree(SearchText: string = '');
    procedure ExpandNodes(Expand: Boolean);
    procedure UpdateNodeControls(Node: PVirtualNode);
    procedure DoMouseLeave(Sender: TObject);
    procedure DoOptionsChanged(Sender: TObject);
    function GetIniFormSection: string;
    function GetMonResolution: string;
    procedure RunProgs(ForceRunAsAdmin: Boolean = False);
    procedure UpdateCaption(const AddText: string = '');
    procedure WMHotKey(var HTK: TWMHotKey); message WM_HOTKEY;
    procedure DoMinimizeProc(Sender: TObject);
    procedure WindowMessage(var Msg: TMessage); message WM_SYSCOMMAND;  //*
    procedure WMQueryEndSession(var Message: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure DoRestoreFromTray(var Message: TMessage); message CM_RestoreFromTray;

    procedure AddFiles(DataObject: IDataObject; StrList: TStringList);
    procedure DoStartUpActions(Sender: TObject; var Done: Boolean);
    procedure SelfUpdate(SilentMode: Boolean);
    procedure ShowNodesWithCorruptedLinks;
  public
    fCanClose: Boolean;
    // �������� ������
      // �������� ������ �������� �� ini-����� (��������� ��� ������������� �� ������� ��������)
    procedure LoadListFromIniFile;
      // �������� �������� ��������� �� ini-����� (��������� ��� ������������� �� ������� ��������)
    procedure LoadOptionsFromIniFile;
    function  LoadXML(FileName: string): Boolean;  // �������� �� xml-�����
    // ���������� ������
    function SaveXML(Forcibly: Boolean = False): Boolean;
    //**
    procedure MinimizeToTray;
    procedure RestoreFromTray;
  end;

  TTreeData = record
    rPath: string;        // ���� � ����� ������� ���������
    rName: string;        // ��� ���������
    rIcon: string;        // ���� � ������ ��� ���������
    rIconIndex: Integer;  // ����� ������
    rParameters: string;  // ��������� �������
    rShowCmd: Integer;    // ��������� ���� ��������� ��� ������
    rNote: string;        // ����� ���������� � ���������
    rRunAsAdmin: Boolean; // ���� ������� �� ����� ��������������
    rType: TItemType;     // ��� ��������
    rNumberOfStarts: Integer; // (����������) ���������� �������� ���������
    //--
    rNeedIcon: Boolean;   // ���� ������������, ��� ����� �������� ������
    rImageIndex: Integer; // ������ ������ � ImageList ��� ����������� � ������
    rFileExists: Boolean; // ������� ������������� ����� �� �����
    rHidden: Boolean;     // ������� ������������ ������� �������� (�������� ��������)
  end;
  PTreeData = ^TTreeData;

  function ITC_Type(ItemType: TItemType): string; overload;
  function ITC_Type(ItemType: string): TItemType; overload;
  procedure UpdateNode(VST: TVirtualStringTree; Node: PVirtualNode);

var
  fMainLinker: TfMainLinker;

implementation

uses
  uDM, ufEditLink, uIconExtractor, uFunctions,
  ufEditGroup, ufAbout, ufUpdater, uRPC, ufOptions, ufStatistics,
  ufTaskReminder;

{$R *.dfm}

function ITC_Type(ItemType: TItemType): string;
begin
  case ItemType of
    itLink    : Result := 'link';
    itGroup   : Result := 'group';
    itDivider : Result := 'divider';
  end;
end;

function ITC_Type(ItemType: string): TItemType;
begin
  if ItemType = 'link'         then Result := itLink
  else if ItemType = 'group'   then Result := itGroup
  else if ItemType = 'divider' then Result := itDivider
  else Result := itLink;
end;

{ TfMainLinker }

procedure TfMainLinker.actAboutExecute(Sender: TObject);
begin
  TAbout.Create(Self).ShowModal;
end;

procedure TfMainLinker.actAddGroupExecute(Sender: TObject);
begin
  AddItem(itGroup);
end;

procedure TfMainLinker.actAddLinkExecute(Sender: TObject);
begin
  AddItem(itLink);
end;

procedure TfMainLinker.actCheckUpdateExecute(Sender: TObject);
begin
  SelfUpdate(False);
//  ufUpdater.CheckUpdate;
end;

procedure TfMainLinker.actCloneExecute(Sender: TObject);
var Nd, FocusedNd: PVirtualNode;
    Td, FocusedTd: PTreeData;
begin
  //--
  FocusedNd := VST.FocusedNode;
  FocusedTd := VST.GetNodeData(FocusedNd);

  Nd := VST.AddChild(FocusedNd.Parent);
  VST.MoveTo(Nd, FocusedNd, amInsertAfter, False);

  Td := VST.GetNodeData(Nd);

  Td.rPath           := FocusedTd.rPath;           // ���� � ����� ������� ���������
  Td.rName           := '����� ' + FocusedTd.rName; // ��� ���������
  Td.rIcon           := FocusedTd.rIcon;           // ���� � ������ ��� ���������
  Td.rIconIndex      := FocusedTd.rIconIndex;      // ����� ������
  Td.rParameters     := FocusedTd.rParameters;     // ��������� �������
  Td.rShowCmd        := FocusedTd.rShowCmd;        // ��������� ���� ��������� ��� ������
  Td.rNote           := FocusedTd.rNote;           // ����� ���������� � ���������
  Td.rRunAsAdmin     := FocusedTd.rRunAsAdmin;     // ���� ������� �� ����� ��������������
  Td.rType           := FocusedTd.rType;           // ��� ��������
  Td.rNumberOfStarts := FocusedTd.rNumberOfStarts; // (����������) ���������� �������� ���������
  //--
  Td.rNeedIcon       := FocusedTd.rNeedIcon;       // ���� ������������, ��� ����� �������� ������
  Td.rImageIndex     := FocusedTd.rImageIndex;     // ������ ������ � ImageList ��� ����������� � ������
  Td.rFileExists     := FocusedTd.rFileExists;     // ������� ������������� ����� �� �����
  Td.rHidden         := FocusedTd.rHidden;         // ������� ������������ ������� �������� (�������� ��������)

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
  if Assigned(VST.GetFirstSelected()) then
  begin
    if VST.SelectedCount > 1 then
      s := '������� ������?'
      else
      s := '������� ������?';

    if  MessageDlg(s, mtWarning, [mbYes, mbCancel], 0) = mrYes then
    begin
      NewSelNode := VST.GetNextSibling(VST.FocusedNode);
      if not Assigned(NewSelNode) then
        NewSelNode := VST.GetPreviousSibling(VST.FocusedNode);
      if not Assigned(NewSelNode) then
        NewSelNode := VST.NodeParent[VST.FocusedNode];
      if NewSelNode = VST.RootNode then
        NewSelNode := nil;

      VST.DeleteSelectedNodes;
      fNeedSave := True;

      if Assigned(NewSelNode) then
      begin
        VST.FocusedNode := NewSelNode;
        VST.Selected[NewSelNode] := True;
      end;
    end;
  end;
end;

procedure TfMainLinker.actAddDividerExecute(Sender: TObject);
begin
  AddItem(itDivider);
end;

procedure TfMainLinker.actEditExecute(Sender: TObject);
var MResult: TModalResult;
begin
  MResult := mrNone;

  if Assigned(VST.FocusedNode) then
    case TTreeData(VST.GetNodeData(VST.FocusedNode)^).rType of
      itLink  : TfEditLink.Create(Self, VST, VST.FocusedNode, okEdit).ShowModal;
      itGroup : TfEditGroup.Create(Self, VST, VST.FocusedNode, okEdit).ShowModal;
    end;

  if MResult = mrOk then fNeedSave := True;
end;

procedure TfMainLinker.actExitExecute(Sender: TObject);
begin
  fCanClose := True;
  Close;
end;

procedure TfMainLinker.actExpandAllExecute(Sender: TObject);
begin
  ExpandNodes(True);
end;

procedure TfMainLinker.actFileLocationExecute(Sender: TObject);

  function GetExistsPath(Path: string): string;
  begin
    if (Path = '') or DirectoryExists(Path) then
      Result := Path
      else begin
        Result := ExtractFilePath(ExcludeTrailingBackslash(Path));
        if Result <> Path then
          Result := GetExistsPath(Result);
      end;
  end;

var Nd: PVirtualNode;
    fPath: string;
begin
  Nd := VST.GetFirstSelected();
  while Assigned(Nd) do
  begin
    fPath := UC_ExpandFileName(TTreeData(VST.GetNodeData(Nd)^).rPath);
    if not (DirectoryExists(fPath) or FileExists(fPath)) then
      fPath := GetExistsPath(fPath);
    ShellExecute(0, 'open', 'explorer', PChar('/select, ' + fPath),
                 nil, SW_SHOWNORMAL);

    Nd := VST.GetNextSelected(Nd);
  end;
end;

procedure TfMainLinker.actHelpExecute(Sender: TObject);
begin
  ShowOptions(True);
end;

procedure TfMainLinker.actInfoExecute(Sender: TObject);
var Node: PVirtualNode;
    Td : PTreeData;
begin
  if UcBtn_Info.Visible then
  begin
    Node:= VST.GetNodeAt(UcBtn_Info.Left, UcBtn_Info.Top);
    UpdateNodeControls(Node);
  end else
    Node := VST.FocusedNode;

  Td := VST.GetNodeData(Node);
  if Assigned(Td) then
  begin
    if Td^.rType = itLink then
      ShowMyHint(Self, Trim(Td^.rPath + ' ' +
                            Td^.rParameters + #13#10 +
                            '���������� ��������: ' + IntToStr(Td^.rNumberOfStarts) + #13#10#13#10 +
                            Td^.rNote), 300, 500)
      else
      ShowMyHint(Self, Trim(Td^.rNote), 300, 500);
  end;
end;

procedure TfMainLinker.actOpenExecute(Sender: TObject);
begin
  RunProgs();
end;

procedure TfMainLinker.actOptionsExecute(Sender: TObject);
begin
  ShowOptions(False);
end;

procedure TfMainLinker.actRunAsAdminExecute(Sender: TObject);
begin
  RunProgs(True);
end;

procedure TfMainLinker.actSaveTreeExecute(Sender: TObject);
begin
  if SaveXML then
    MessageDlg('������ �������� ������� ��������!', mtInformation, [mbOK], 0)
    else
    MessageDlg('�� ������� ��������� ������ ��������!', mtError, [mbOK], 0);
end;

procedure TfMainLinker.ActShowCorruptedLinksExecute(Sender: TObject);
begin
  DM.Options['SkipCorruptedLinksOnFilter'].AsBoolean := TAction(Sender).Checked;
end;

procedure TfMainLinker.actShowPropertiesExecute(Sender: TObject);
var Nd: PVirtualNode;
    Td: PTreeData;
begin
  Nd := VST.GetFirstSelected();
  while Assigned(Nd) do
  begin
    Td := VST.GetNodeData(Nd);
    if Td^.rType = itLink then
      UC_ShowFileProperties(Td^.rPath);

    Nd := VST.GetNextSelected(Nd);
  end;
end;

procedure TfMainLinker.actShowStatExecute(Sender: TObject);
begin
  with TStatistics.Create(Self) do
  try
    Init;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfMainLinker.ChBox_AutoCloseClick(Sender: TObject);
begin
  fNeedSave := True;
end;

function TfMainLinker.CreateXMLDocument: IXMLDocument;
begin
  Result               := NewXMLDocument();
//  Result.Active        := True;
  Result.Encoding      := 'UTF-8';
  Result.NodeIndentStr := #9;
  Result.Options       := Result.Options + [doNodeAutoIndent];
end;

procedure TfMainLinker.DoStartUpActions(Sender: TObject; var Done: Boolean);
var Ver: string;
begin
  Application.OnIdle := nil;
  // ��������� ����� ���������
  if DM.Options['StartMinimized'].AsBoolean then
    MinimizeToTray;

  // �������� ����������
  if DM.Options['AutoUpdate_Enabled'].AsBoolean and
     (DM.Options['AutoUpdate_date'].AsDateTime <= Now) then
  begin
    if NewUpdateExists(Ver) then
    begin
      if ShowQueryUserForPendingActions(
            'AutoUpdate_date', '��������������',
            '�������� ����� ������ ��������� Linker v' + Ver + '.'#13#10 +
            '���������� ��� ������ ������?') then
        SelfUpdate(True);
    end else
      DM.Options['AutoUpdate_date'].AsDateTime := Now + 1;
  end;

//  if DM.Options['AutoUpdate_Enabled'].AsBoolean and NewUpdateExists(Ver) then
//  begin
//    if MessageDlg('�������� ����� ������ ��������� Linker v' + Ver + '.'#13#10 +
//                  '���������� ��� ������ ������?',
//                  mtConfirmation, [mbYes, mbCancel], 0) = mrYes then
//      actCheckUpdate.Execute;
//  end;
  //**
end;

function TfMainLinker.AddItem(ItemTtype: TItemType; FileName: string = '';
                               Target: PVirtualNode = nil;
                               Mode: TVTNodeAttachMode = amInsertBefore): Boolean;

  procedure LoadDataFromShellLink(Td: PTreeData; FileName: string);
  var sc: TUcShortCut;
      Buffer, s: string;
      IconIndex: Integer;
  begin
    sc := TUcShortCut.Create;
    try
      if sc.Load(PChar(FileName)) then
      begin
        // �������� ���� � �����/�����
        if sc.GetPath(Buffer) then
        begin
          s := UC_ExpandFileName(Buffer);
          Td^.rPath := Buffer;
          Td^.rName := StringReplace(ExtractFileName(FileName),
                                     ExtractFileExt(FileName), '',
                                     [rfReplaceAll, rfIgnoreCase]);
        end;
        // �������� ��������� ������
        if sc.GetIconLocation(Buffer, IconIndex) then
        begin
          Td^.rIcon := Buffer;
          Td^.rIconIndex := IconIndex;
        end;
        // �������� �������� ������
        if sc.GetDescription(Buffer)       then Td^.rNote       := Buffer;
        // �������� ��������� �������
        if not sc.GetShowCmd(Td^.rShowCmd) then Td^.rShowCmd    := 0;
        // �������� ��������� ��������� ������
        if sc.GetArguments(Buffer)         then Td^.rParameters := Buffer;
      end;
    finally
      sc.Free;
    end;
  end;

var Nd, FocusedNd: PVirtualNode;
    Td: PTreeData;
begin
  // ����������
  if Assigned(Target) then
    FocusedNd := Target
    else
    FocusedNd := VST.FocusedNode;

  if Assigned(FocusedNd) and Assigned(VST.GetNodeData(FocusedNd)) then
    begin
      if TTreeData(VST.GetNodeData(FocusedNd)^).rType = itGroup then
        Nd := VST.AddChild(FocusedNd)
      else begin
        Nd := VST.AddChild(FocusedNd.Parent);
        VST.MoveTo(Nd, FocusedNd, Mode, False);
      end;
    end
  else
    Nd := VST.AddChild(nil);

  Td := VST.GetNodeData(Nd);
  Td^.rType := ItemTtype;
  Td^.rNumberOfStarts := 0;
  //**

  case Td^.rType of
    itLink    : begin
        // ���������� ����� � ������������ ���
        if CompareText(ExtractFileExt(FileName), '.lnk') = 0 then
          LoadDataFromShellLink(Td, FileName)
          else
          Td^.rPath := FileName;

        // �������������� ������������ ��������
        Result := TfEditLink.Create(Self, VST, Nd, okAdd).ShowModal = mrOk;
        if Result then
        begin
          VST.ClearSelection;
          SetFocusToNode(Nd, True);
          fNeedSave := True;
        end else
          VST.DeleteNode(Nd);
      end;

    itGroup   : begin
        // ���������� ������
        Result := TfEditGroup.Create(Self, VST, Nd, okAdd).ShowModal = mrOk;
        if Result then
        begin
          VST.ClearSelection;
          SetFocusToNode(Nd, True);
          fNeedSave := True;
        end else
          VST.DeleteNode(Nd);
      end;

    itDivider : begin
        Result := True;
      end;

    else Result := False;
  end;
end;

procedure TfMainLinker.FilterTree(SearchText: string = '');
const Ru = '���������������������������������.';
      En = '`QWERTYUIOP[]ASDFGHJKL;'#39'ZXCVBNM,./';

  procedure ReplaceChars(var Str: string; StrCrs, StrDest: string);
  var i, p, maxI: Integer;
  begin
    maxI := Min(Length(StrCrs), Length(StrDest));
    for i := 1 to Length(Str) do
    begin
      p := Pos(Str[i], StrCrs);
      if (p > 0) and (p <= maxI) then
        Str[i] := StrDest[p];
    end;
  end;

var
  Node: PVirtualNode;
  Td: PTreeData;
  SelectedNode: PVirtualNode;
  SearchAlt: string;
begin
  if SearchText = '' then
  begin
    FilterValue := '';
    UpdateCaption;
  end
  else
    UpdateCaption(' [' + SearchText + ']');

  VST.BeginUpdate;
  try
    SelectedNode := nil;
    VST.FocusedNode := nil;

    SearchText := AnsiUpperCase(SearchText);
    SearchAlt  := AnsiUpperCase(SearchText);
    ReplaceChars(SearchAlt, Ru, En);
    // ������ ������ ��� ���������� �����, ����� �����
    Node := VST.GetLast;
    while Assigned(Node) do
    begin
      Td := VST.GetNodeData(Node);

      if SearchText = '' then // ���������� ��� ������
      begin
        VST.IsVisible[Node] := True;
        VST.VisiblePath[Node] := True;
        IsFiltered := False;
        UpdateNode(VST, Node);
      end else
      if Assigned(Td) then  // ������ �� ��������
      begin
        if Td^.rType = itGroup then
          VST.IsVisible[Node] := Assigned(VST.GetFirstVisibleChild(Node))
        else if (Td^.rType = itLink) and
                ((Pos(SearchText, AnsiUpperCase(Td^.rName)) > 0) or
                (Pos(SearchAlt,  AnsiUpperCase(Td^.rName)) > 0)) then
        begin
          UpdateNode(VST, Node);
          if VST.IsVisible[Node] then
            SelectedNode := Node;

          if Assigned(Node) then
            VST.VisiblePath[Node] := True;
        end else
        begin
          VST.IsVisible[Node] := False;
          IsFiltered := True;
        end;
      end;
      VST.Expanded[Node] := False;

      Node := VST.GetPrevious(Node);
    end;

  finally
    VST.EndUpdate;
    VST.Refresh;
  end;

  ExpandNodes(True);

  if Assigned(SelectedNode) then
  begin
    VST.ClearSelection;
    VST.FocusedNode := SelectedNode;
    VST.Selected[SelectedNode] := True;
  end;
  VST.FocusedNode := VST.GetFirstSelected();

  if Assigned(VST.FocusedNode) then
    VST.ScrollIntoView(VST.FocusedNode, True);
end;

procedure TfMainLinker.ExpandNodes(Expand: Boolean);
var Node: PVirtualNode;
    SaveAutoCollapseGroups: Boolean;
begin
  SaveAutoCollapseGroups := DM.Options['AutoCollapseGroups'].AsBoolean;
  try
    DM.Options['AutoCollapseGroups'].AsBoolean := False;

    VST.BeginUpdate;
    try
      Node := VST.GetFirst();
      while Assigned(Node) do
      begin
        VST.Expanded[Node] := Expand;
        Node := VST.GetNext(Node);
      end;
    finally
      VST.EndUpdate;
    end;

    if Assigned(VST.FocusedNode) then
      VST.ScrollIntoView(VST.FocusedNode, True);
  finally
    DM.Options['AutoCollapseGroups'].AsBoolean := SaveAutoCollapseGroups;
  end;
end;

procedure UpdateNode(VST: TVirtualStringTree; Node: PVirtualNode);
var Td: PTreeData;
begin
  if Assigned(Node) then
  begin
    Td := VST.GetNodeData(Node);
    if Assigned(Td) then
      VST.IsVisible[Node] := Td^.rFileExists or
                             (not DM.Options['SkipCorruptedLinksOnFilter'].AsBoolean);
  end;
end;

procedure TfMainLinker.ShowNodesWithCorruptedLinks;
var Node: PVirtualNode;
begin

  VST.BeginUpdate;
  try
    Node := VST.GetFirst();
    while Assigned(Node) do
    begin
      UpdateNode(VST, Node);
      Node := VST.GetNext(Node);
    end;
  finally
    VST.EndUpdate;
  end;

  if Assigned(VST.FocusedNode) then
    VST.ScrollIntoView(VST.FocusedNode, True);
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
  UC_SetupSystemCursors;
  // ������������� ���������� ����������
  Accessed := False;
  GHK_ShowApp := TUcGlobalHotkey.Create;
  GHK_ShowApp.Handle := Handle;

  fCanClose   := False;
  fNeedSave   := False;
  fReadOnlyFS := False;
  fXML_Corrupted := False;
  IsFiltered  := False;
  FilterValue := '';
  // ������������� RPC-�������
  PublicKey := 'linker_secure_pass';
  xrc.URL   := 'optitrex.ru/rpc/index.php';

//  xrc.Proxy := '192.168.1.25';
//  xrc.HttpCli.ProxyAuth := httpAuthBasic;
//  xrc.HttpCli.ProxyUsername := '123';
//  xrc.HttpCli.ProxyPassword := '123';

  // ������������� �������� ����������
  Application.OnIdle := DoStartUpActions;
  // ��������� �������� ����
  VST.NodeDataSize := SizeOf(TTreeData);

  UpdateCaption;

  DM.Options.RegisterNotify(DoOptionsChanged);
  // ������������� �����
  with DM do
  begin
    Options['StartMinimized'].AsBoolean               := False;
    Options['GlobalHotKey_ShowApp'].AsString          := 'Alt+F1';
    Options['AlphaBlend'].AsBoolean                   := False;
    Options['AlphaBlendValue'].AsInteger              := 150;
    Options['MinimizeOnClose'].AsBoolean              := False;
    Options['SaveStateAppList'].AsBoolean             := True;
    Options['ClassicAppList'].AsBoolean               := False;
    Options['AppsPath'].AsString                      := 'Apps';
    Options['StayOnTop'].AsBoolean                    := False;
    Options['AutoCollapseGroups'].AsBoolean           := False;
    Options['SkipCorruptedLinksOnFilter'].AsBoolean   := False;
    Options['Stat_NumberOfStarts'].AsBoolean          := True;
    Options['AutoUpdate_Enabled'].AsBoolean           := True;
    Options['AutoUpdate_date'].AsDateTime             := Now;

    Options['AppList_ColorLinkText'].AsInteger        := clBlack;
    Options['AppList_ColorLinkTextErr'].AsInteger     := clRed;
    Options['AppList_ColorGroupText'].AsInteger       := clCream;
    Options['AppList_ColorBorder'].AsInteger          := clBlack;
    Options['AppList_ShowBorder'].AsBoolean           := True;
    Options['AppList_ColorGroup'].AsInteger           := clGreen;
    Options['AppList_ColorCurrentGroup'].AsInteger    := clCream;
    Options['AppList_ColorItem'].AsInteger            := $00FDFDFD;
    Options['AppList_ColorCurrentItem'].AsInteger     := $00A8CAAA;
    Options['AppList_ColorCurrentItemText'].AsInteger := clBlack;

    Options['AutoMinimize'].AsBoolean                 := False;
    Options['AutoClose'].AsBoolean                    := False;
  end;
  //**

  // �������� ����������� ������ ������ ��������
  try
    if FileExists(flXML_Linker) then
      TFileStream.Create(flXML_Linker, fmOpenReadWrite).Free
    else
      TFileStream.Create(flXML_Linker, fmCreate).Free;
  except
    SetReadOnlyFS(True, False);
  end;
  // �������� ������
  DOM := CreateXMLDocument;
    // ������� ��������
  if not LoadXML(flXML_Linker) then
      // �������� �� ��������� �����
    if LoadXML(flXML_Linker_Bak) then
    begin
      fXML_Corrupted := True;
      MessageDlg('��������� ��������� "Linker" ��������� �� ��������� �����:'#13#10 +
                 '"' + flXML_Linker_Bak + '"', mtInformation, [mbOK], 0);
    end else
        // �������� �� ������ ������ XML ��� �� ��������� �����
      if LoadXML(flXML_Links) or LoadXML(flXML_Links_Bak) then
      begin
        if SaveXML(True) then
        begin
          DeleteFile(flXML_Links);
          DeleteFile(flXML_Links_Bak);
        end;
      end else
          // �������� �� ������ ������ INI
        if FileExists(flINI_Links) then
          LoadListFromIniFile; // ��� ������������� � 1-� �������
  // �������� ����� �������� ������ � ��������
//  DM.RestoreRootPath;
//  if (not DirectoryExists(DM.Options['AppsPath'].AsString)) and
//     (not DirectoryExists(UC_ExpandFileName(DM.Options['AppsPath'].AsString))) then
//    DM.Options['AppsPath'].AsString := 'Apps';

  // Tray
  Application.OnMinimize := DoMinimizeProc;
  DM.TrayIcon.Visible := True;
  //--
  UcBtn_Info.Parent := VST;
  TCustomControlCrack(VST).OnMouseLeave := DoMouseLeave;
  UpdateNodeControls(nil);
  UpdateActionControls;
end;

procedure TfMainLinker.FormDestroy(Sender: TObject);
begin
  // ���������� ������
  SaveXML;
  GHK_ShowApp.UnRegisterHotkey;

  // ������� ������
  GHK_ShowApp.Free;
  DM.Options.UnregisterNotify(DoOptionsChanged);
  StopExtractIcons;
end;

function TfMainLinker.GetIniFormSection: string;
begin
  Result := Format('Screen %dx%d', [Screen.WorkAreaWidth, Screen.WorkAreaHeight]);
end;

function TfMainLinker.GetMonResolution: string;
begin
  Result := Format('%dx%d', [Screen.Width, Screen.Height]);
end;

procedure TfMainLinker.LoadListFromIniFile;
var ini: TMemIniFile;
    Ss: TStringList;
    i: integer;
    Nd: PVirtualNode;
    xIconPath : TIconPath;
begin
  ini := TMemIniFile.Create(flINI_Links);
  Ss  := TStringList.Create;
  with ini do
  try
    ini.ReadSections(Ss);
    for I := 0 to Ss.Count - 1 do
    begin
      Nd := VST.AddChild(nil);
      xIconPath := ParceIconPath(ReadString(Ss[i], 'Icon', ''));
      with TTreeData(VST.GetNodeData(Nd)^) do
      begin
        rName       := ReadString(Ss[i], 'Name', '?');
        rPath       := ReadString(Ss[i], 'Path', '?');
        rIcon       := IfThen(xIconPath.Name <> '', xIconPath.Name, rPath);
        rIconIndex  := xIconPath.Index;
        rParameters := ReadString(Ss[i], 'Parameters', '');
        rShowCmd    := ReadInteger(Ss[i], 'ShowCmd', 1);
      end;
    end;
  finally
    ini.Free;
    Ss.Free;
  end;
end;

procedure TfMainLinker.LoadOptionsFromIniFile;
var ini: TMemIniFile;
    OpNames: TStringList;
    i: Integer;
    FormSection: string;
begin
  ini := TMemIniFile.Create(flINI_Options);
  with ini do
  try
    // ������������� ����� (���� ��� ����������� � ini-�����)
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
    DM.Options['AppsPath'].AsString                   := 'Apps';

    // �������� ��������
    DM.Options['AutoMinimize'].AsBoolean := ReadBool('General', 'AutoMinimize', false);
    DM.Options['AutoClose'].AsBoolean := (not DM.Options['AutoMinimize'].AsBoolean) and
                                          ReadBool('General', 'AutoClose', false);
    // ������������ ���� (��������� ��� ������������� �� ������ ������� ��������)
    if ini.ValueExists('General', 'AlphaBlend') then
      DM.Options['AlphaBlend'].AsBoolean :=
        ReadBool('General', 'AlphaBlend', false);

    if ini.ValueExists('General', 'AlphaBlendValue') then
      DM.Options['AlphaBlendValue'].AsInteger :=
        ReadInteger('General', 'AlphaBlendValue', 255);
    // �������� ��������� (��������� ��� ������������� �� ������ ������� ��������)
    if ini.ValueExists('General', 'GlobalHotKey') then
      DM.Options['GlobalHotKey_ShowApp'].AsString :=
        ReadString('General', 'GlobalHotKey', '');
    // ������/������� ����
    FormSection := GetIniFormSection;
    Left  := ReadInteger(FormSection, 'Left',   300);
    Top   := ReadInteger(FormSection, 'Top',    300);
    Width := ReadInteger(FormSection, 'Width',  350);
    Height:= ReadInteger(FormSection, 'Height', 380);

    if Left > Screen.WorkAreaWidth then Left := Screen.WorkAreaWidth - Width;
    if Left + Width < 20           then Left := 0;
    if Top > Screen.WorkAreaHeight then Top := Screen.WorkAreaHeight - Height;
    if Top + Height < 20           then Top := 0;
    // !!!!! �������� ����� ��������� !!!!! (��������� �������� ���: DoOptionsChanged)
    OpNames := TStringList.Create;
    try
      ini.ReadSection('options', OpNames);
      for i := 0 to OpNames.Count - 1 do
        DM.Options[OpNames[i]].AsString := ReadString('options', OpNames[i], '');
    finally
      OpNames.Free;
    end;
  finally
    ini.Free;
  end;
end;

function TfMainLinker.LoadXML(FileName: string): Boolean;

  function NdStrV(Node: IXMLNode; AttrName: string): string;
  begin
    Result := VarToStr(Node.Attributes[AttrName]);
  end;

  procedure LoadAppList_v11(const xmlNodeList: IXMLNodeList; AParent: PVirtualNode);
  var i: Integer;
      Node: PVirtualNode;
      Td: PTreeData;
      xIconPath: TIconPath;
  begin
    for i := 0 to xmlNodeList.Count - 1 do
    begin
      Node := VST.AddChild(AParent);
      Td    := VST.GetNodeData(Node);
      with Td^ do
      begin
        rName       := NdStrV(xmlNodeList[i], 'name');
        rPath       := NdStrV(xmlNodeList[i], 'path');
        //--
        xIconPath   := ParceIconPath(NdStrV(xmlNodeList[i], 'icon'));
        rIcon       := xIconPath.Name;
        rIconIndex  := xIconPath.Index;
        //**
        rParameters := NdStrV(xmlNodeList[i], 'parameters');
        rShowCmd    := StrToIntDef(NdStrV(xmlNodeList[i], 'showcmd'), SW_SHOWNORMAL);
        rType       := ITC_Type(NdStrV(xmlNodeList[i], 'type'));
        rNote       := NdStrV(xmlNodeList[i], 'note');
        rRunAsAdmin := StrToBoolDef(NdStrV(xmlNodeList[i], 'runasadmin'), False);
        rNumberOfStarts := StrToIntDef(NdStrV(xmlNodeList[i], 'numstarts'), 0);
      end;

      if StrToBoolDef(NdStrV(xmlNodeList[i], 'focused'), False) then
      begin
        VST.FocusedNode := Node;
        VST.ScrollIntoView(Node, True);
      end;
      VST.Selected[Node] := StrToBoolDef(NdStrV(xmlNodeList[i], 'selected'), False);

      if Td^.rType = itGroup then
      begin
        LoadAppList_v11(xmlNodeList[i].ChildNodes, Node);
        VST.Expanded[Node] := StrToBoolDef(NdStrV(xmlNodeList[i], 'expanded'), False);
      end;
    end;
  end;

  procedure LoadAppList_v10(const xmlNodeList: IXMLNodeList; AParent: PVirtualNode);
  const ItemTypes: array[Boolean] of TItemType = (itLink, itGroup);
  var i: Integer;
      vNode: PVirtualNode;
      vNodeData: PTreeData;
      xIconPath: TIconPath;
  begin
    for i := 0 to xmlNodeList.Count - 1 do
    begin
      vNode := VST.AddChild(AParent);
      vNodeData := VST.GetNodeData(vNode);
      with vNodeData^ do
      begin
        rName       := NdStrV(xmlNodeList[i], 'Name');
        rPath       := NdStrV(xmlNodeList[i], 'Path');
        //--
        xIconPath   := ParceIconPath(NdStrV(xmlNodeList[i], 'Icon'));
        rIcon       := xIconPath.Name;
        rIconIndex  := xIconPath.Index;
        //**
        rParameters := NdStrV(xmlNodeList[i], 'Parameters');
        rShowCmd    := StrToIntDef(NdStrV(xmlNodeList[i], 'ShowCmd'), SW_SHOWNORMAL);
        rType       := ItemTypes[StrToBoolDef(NdStrV(xmlNodeList[i], 'IsGroup'), False)];
        rNote       := NdStrV(xmlNodeList[i], 'Note');
        rRunAsAdmin := StrToBoolDef(NdStrV(xmlNodeList[i], 'RunAsAdmin'), False);
      end;
      LoadAppList_v10(xmlNodeList[i].ChildNodes, vNode);
    end;
  end;

  procedure LoadOptions(const xmlNodeList: IXMLNodeList);
  var i, scr_width, scr_height, win_left, win_top, win_width, win_height: Integer;
      MonResolution: string;
      k: Extended;
  begin
    // !!!!! �������� ����� ��������� !!!!! (��������� �������� ���: DoOptionsChanged)
    MonResolution := GetMonResolution;
    for i := 0 to xmlNodeList.Count - 1 do
    begin
        // �������� �����
      if xmlNodeList[i].NodeName = ndOption then
        DM.Options[NdStrV(xmlNodeList[i], 'name')].AsString := NdStrV(xmlNodeList[i], 'value')
        // �������� ������� � �������� ����
      else if (xmlNodeList[i].NodeName = ndScreen) then
      begin
        // ������ ��������
        scr_width  := StrToIntDef(NdStrV(xmlNodeList[i], 'scr_width'), Screen.WorkAreaWidth);
        scr_height := StrToIntDef(NdStrV(xmlNodeList[i], 'scr_height'), Screen.WorkAreaHeight);
        win_left   := StrToIntDef(NdStrV(xmlNodeList[i], 'Left'),   300);
        win_top    := StrToIntDef(NdStrV(xmlNodeList[i], 'Top'),    300);
        win_width  := StrToIntDef(NdStrV(xmlNodeList[i], 'Width'),  350);
        win_height := StrToIntDef(NdStrV(xmlNodeList[i], 'Height'), 380);
        // �������/���������� ����� ����������
        Width  := win_width;
        Height := win_height;

        k := Screen.WorkAreaWidth / scr_width;
        if win_left >= ((scr_width - win_width) / 2) - 1 then // -1 - ������ ��������� �� ������ ����
          Left := Round( Screen.WorkAreaWidth - win_width - (scr_width - win_left - win_width) * k )
          else
          Left := Round(win_left * k);

        k := Screen.WorkAreaHeight / scr_height;
        if win_top >= ((scr_height - win_height) / 2) - 1 then // -1 - ������ ��������� �� ������ ����
          Top := Round( Screen.WorkAreaHeight - win_height - (scr_height - win_top - win_height) * k )
          else
          Top  := Round(win_top * k);

        // ������������� ��������
        if Left < 0                             then Left := 0;
        if Left + Width > Screen.WorkAreaWidth  then
          if Screen.WorkAreaWidth - Width < 0 then
            Width := Screen.WorkAreaWidth
            else
            Left := Screen.WorkAreaWidth - Width;

        if Top < 0                              then Top := 0;
        if Top + Height > Screen.WorkAreaHeight then
          if Screen.WorkAreaHeight - Height < 0 then
            Height := Screen.WorkAreaHeight
            else
            Top := Screen.WorkAreaHeight - Height;
      end;
    end;
    // ��������� "����-�����"
    DM.Options['AutoClose'].AsBoolean := (not DM.Options['AutoMinimize'].AsBoolean) and
                                         DM.Options['AutoClose'].AsBoolean;
    //**
  end;

var
  nRoot, nOptions, nAppList:IXMLNode;
begin
  VST.BeginUpdate;
  try
    try
      nRoot    := nil;
      nOptions := nil;
      nAppList := nil;
      // �������� XML
      DOM.LoadFromFile(FileName);
      if DOM.ChildNodes.Count > 0 then
        nRoot := DOM.DocumentElement;
      // �������� ������
      Result := Assigned(nRoot);
      if not Result then Exit;

      nOptions := nRoot.ChildNodes.FindNode(ndOptions);
      nAppList := nRoot.ChildNodes.FindNode(ndAppList);
        // �������� ������ ��� ������ 2.3.x.x
      if (nRoot.NodeName = ndRoot) and (nRoot.Attributes['version'] = verXML_11) then
      begin
        if Assigned(nAppList) then LoadAppList_v11(nAppList.ChildNodes, nil);
        if Assigned(nOptions) then LoadOptions(nOptions.ChildNodes);
      end else
        // �������� ������ ��� ������ 2.2.x.x
      if (nRoot.NodeName = ndRoot) and (nRoot.Attributes['version'] = verXML_10) then
      begin
        if Assigned(nAppList) then LoadAppList_v10(nAppList.ChildNodes, nil);
        if Assigned(nOptions) then LoadOptions(nOptions.ChildNodes);
      end else
        // �������� ������ ��� ������ 2.1.x.x
      begin
        LoadOptionsFromIniFile;
        LoadAppList_v10(nRoot.ChildNodes, nil);
        if SaveXML(True) then
          DeleteFile(flINI_Options);
      end;
      //**
      Result := True;
    except
      Result := False;
      DOM := nil;
      DOM := CreateXMLDocument;
    end;
  finally
    VST.EndUpdate;
  end;
end;

procedure TfMainLinker.PopupMenuPopup(Sender: TObject);
begin
  UpdateActionControls;
end;

procedure TfMainLinker.RunProgs(ForceRunAsAdmin: Boolean = False);
// ForceRunAsAdmin - ������������� ��������� ��������� � ������� ������

    procedure RunAsAdministrator(const AExeFile, AParamStr, ADirectory: string;
      AShowCmd: Integer);
    var
      shExecInfo: TShellExecuteInfo;
    begin
      //  ��������� ���� � ����������� ������������.
      shExecInfo.cbSize       := sizeof(ShellExecuteInfo);
      shExecInfo.fMask        := 0;
      shExecInfo.Wnd          := 0;
      shExecInfo.lpVerb       := 'runas';
      shExecInfo.lpFile       := PChar(ExtractFileName(AExeFile));
      shExecInfo.lpParameters := PChar(AParamStr);
      shExecInfo.lpDirectory  :=  PChar(ADirectory);
      shExecInfo.nShow        := AShowCmd;
      shExecInfo.hInstApp     := 0;
      ShellExecuteEx(@shExecInfo);
    end;

var Nd: PVirtualNode;
    Td: PTreeData;
    Path: string;
begin
  ExtractIconsPause;
  DM.RestoreRootPath;
  Nd := VST.GetFirstSelected;
  while Assigned(Nd) do
  begin
    Td := VST.GetNodeData(Nd);
    if (VST.IsVisible[Nd]) and (Td^.rType = itLink) then
    begin
      Path := UC_ExpandFileName(Td^.rPath);
      if not (FileExists(Path) or DirectoryExists(Path)) then
        Path := Td^.rPath;

      if ForceRunAsAdmin or Td^.rRunAsAdmin then
        RunAsAdministrator(PChar(Path), PChar(Td^.rParameters),
                           PChar(ExtractFilePath(Path)), Td^.rShowCmd)
      else
        ShellExecute(0, 'open', PChar(Path), PChar(Td^.rParameters),
                     PChar(ExtractFilePath(Path)), Td^.rShowCmd);

      Inc(Td^.rNumberOfStarts);
    end;

    Nd := VST.GetNextSelected(Nd);
  end;

  if Assigned(VST.FocusedNode) then
  begin
    if TTreeData(VST.GetNodeData(VST.FocusedNode)^).rType = itLink then
      if DM.Options['AutoClose'].AsBoolean then
        Close
      else if DM.Options['AutoMinimize'].AsBoolean then
        MinimizeToTray;
  end;
  ExtractIcons(VST);
end;

function TfMainLinker.SaveXML(Forcibly: Boolean = False): Boolean;

  procedure SetAttr(Node: IXMLNode; AttrName, Value: string);
  begin
    if (AttrName <> '') and (Value <> '') then
      Node.Attributes[AttrName] := Value;
  end;

  procedure SaveAppList(ANode: PVirtualNode; const AParent: IXMLNode);
  var
    xmlNode: IXMLNode;
    Node: PVirtualNode;
    Td: PTreeData;
  begin
    Node := ANode.FirstChild;
    if Assigned(Node) then
      repeat
        Td := VST.GetNodeData(Node);
        xmlNode  := AParent.AddChild(ndAppItem);
        with xmlNode, Td^ do
        begin
          Attributes['type'] := ITC_Type(rType);
          SetAttr(xmlNode, 'name', rName);
          SetAttr(xmlNode, 'note', rNote);

          if rType = itLink then
          begin
            if rShowCmd <> SW_SHOWNORMAL then
              Attributes['showcmd'] := rShowCmd;
            if rRunAsAdmin then
              Attributes['runasadmin'] := rRunAsAdmin;

            SetAttr(xmlNode, 'path',       rPath);
            SetAttr(xmlNode, 'parameters', rParameters);
            SetAttr(xmlNode, 'icon', IfThen(rIcon <> '',
                                            rIcon + IconSeparator + IntToStr(rIconIndex),
                                            ''));
            if (rNumberOfStarts > 0) and
               DM.Options['Stat_NumberOfStarts'].AsBoolean then
              Attributes['numstarts'] := rNumberOfStarts;
          end;

          if DM.Options['SaveStateAppList'].AsBoolean then
          begin
            if VST.Expanded[Node]     then Attributes['expanded'] := VST.Expanded[Node];
            if VST.FocusedNode = Node then Attributes['focused']  := True;
            if VST.Selected[Node]     then Attributes['selected'] := True;
          end;
        end;
        SaveAppList(Node, xmlNode);
        Node := Node.NextSibling;
      until 
        Node = nil;
  end;

  procedure SaveOptions(xmlNode: IXMLNode);
  var i: Integer;
      fl: TDBFields;
      Node: IXMLNode;
  begin
    // ������/������� ����
    Node := xmlNode.AddChild(ndScreen);

    Node.Attributes['scr_width']  := Screen.WorkAreaWidth;
    Node.Attributes['scr_height'] := Screen.WorkAreaHeight;

    Node.Attributes['Left']   := Left;
    Node.Attributes['Top']    := Top;
    Node.Attributes['Width']  := Width;
    Node.Attributes['Height'] := Height;

    // ���������� ����������
    fl := DM.Options.FieldList;
    for i := 0 to fl.Count - 1 do
    begin
      Node := xmlNode.AddChild(ndOption);
      Node.Attributes['name'] := fl.Fields[i].FieldName;
      Node.Attributes['value'] := fl.Fields[i].AsString;
    end;
  end;

var
  nRoot, nOptions, nAppList:IXMLNode;
begin
  try
    if Forcibly or (not fReadOnlyFS) then
    begin
      // ������ ��������� �����
      if (not fXML_Corrupted) and
         FileExists(flXML_Linker) and (UC_GetFileSize(flXML_Linker) > 0) then
      begin
        DeleteFile(flXML_Linker_Bak);
        RenameFile(flXML_Linker, flXML_Linker_Bak);
      end;

      // ������������� ���������
      if DOM.ChildNodes.Count > 0 then
        nRoot := DOM.DocumentElement
        else
        nRoot := nil;
      if (not Assigned(nRoot)) or (nRoot.NodeName <> ndRoot) then
      begin
        DOM.ChildNodes.Clear;
        nRoot := DOM.AddChild(ndRoot);
      end;
      nRoot.Attributes['version'] := verXML_11;

      nOptions := nRoot.ChildNodes.FindNode(ndOptions);
      if not Assigned(nOptions) then
        nOptions := nRoot.AddChild(ndOptions);

      nAppList := nRoot.ChildNodes.FindNode(ndAppList);
      if not Assigned(nAppList) then
        nAppList := nRoot.AddChild(ndAppList);

      // ��������� ������
      nOptions.ChildNodes.Clear;
      SaveOptions(nOptions);

//      if Forcibly or fNeedSave then
//      begin
        nAppList.ChildNodes.Clear;
        SaveAppList(VST.RootNode, nAppList);
//      end;
      DOM.Encoding := 'UTF-8';
      DOM.SaveToFile(flXML_Linker);
    end;
    //--
    Result := True;
  except
    Result := False;
  end;
end;

procedure TfMainLinker.SelfUpdate(SilentMode: Boolean);
var Ver: string;
begin
  // �������� ����������
  if NewUpdateExists(Ver) then
  begin
    if SilentMode or
       (MessageDlg('�������� ����� ������ ��������� Linker v' + Ver + '.'#13#10 +
                  '���������� ��� ������ ������?',
                  mtConfirmation, [mbYes, mbCancel], 0) = mrYes) then
      ufUpdater.CheckUpdate;
  end else
    if not SilentMode then
      MessageDlg('�� ����������� ��������� ������ ��������� Linker.',
                  mtInformation, [mbOK], 0);
  //**
end;

procedure TfMainLinker.SetFocusToNode(Node: PVirtualNode; ScrollTo: Boolean);
begin
  VST.FocusedNode := Node;
  VST.Selected[Node] := True;
  if Assigned(VST.FocusedNode) and ScrollTo then
    VST.ScrollIntoView(VST.FocusedNode, True);
end;

procedure TfMainLinker.SetReadOnlyFS(const Value, SilentMode: Boolean);
begin
  fReadOnlyFS         := Value;
  Sp_Add.Enabled      := not fReadOnlyFS;
  actEdit.Enabled     := not fReadOnlyFS;
  actDelete.Enabled   := not fReadOnlyFS;
  actSaveTree.Enabled := not fReadOnlyFS;
  actOptions.Enabled  := not fReadOnlyFS;
  if (not SilentMode) and fReadOnlyFS then
    MessageDlg('����� ������������ �������� ������ ��� ������!', mtWarning, [mbOK], 0);
end;

procedure TfMainLinker.ShowOptions(iShowHelp: Boolean);
begin
  with TOptions.Create(Self) do
  begin
    Init(DM.Options);
    if iShowHelp then ShowHelp;
    ShowModal;
  end;
end;

procedure TfMainLinker.UpdateNodeControls(Node: PVirtualNode);
var R: TRect;
    dTop, dLeft, NewTop, NewLeft: Integer;
    P: TPoint;
    Td: PTreeData;
begin
  if not Assigned(Node) then
    UcBtn_Info.Visible := False
  else begin
    //--
    Windows.GetCursorPos(P);
    P  := VST.ScreenToClient(P);
    R  := VST.GetDisplayRect(Node, -1, False);
    Td := VST.GetNodeData(Node);

    UcBtn_Info.Visible := PtInRect(Rect(R.Right - integer(VST.DefaultNodeHeight),
                                        R.Top, R.Right, R.Bottom), P) and
                          ((Td^.rType = itLink) or
                          ((Td^.rType = itGroup) and (Td^.rNote <> '')));
    //--
    if UcBtn_Info.Visible then
    begin
      dTop := (R.Bottom - R.Top - UcBtn_Info.Height) div 2;
      dLeft:= (integer(VST.DefaultNodeHeight) - UcBtn_Info.Height) div 2;

      NewTop  := R.Top + dTop;
      NewLeft := R.Right - UcBtn_Info.Width - dLeft - integer(VST.GetNodeLevel(Node));

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
  P := VST.ScreenToClient(P);
  Node:= VST.GetNodeAt(P.X, P.Y);

  if Assigned(Node) then
  begin
    R := VST.GetDisplayRect(Node, -1, False);
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
          VST.TreeOptions.PaintOptions := VST.TreeOptions.PaintOptions + [toShowTreeLines]
          else
          VST.TreeOptions.PaintOptions := VST.TreeOptions.PaintOptions - [toShowTreeLines];
        VST.Invalidate;
      end;

      if (ChField = FldLst.FindField('AppList_ColorGroup')) or
         (ChField = FldLst.FindField('AppList_ColorCurrentGroup')) or
         (ChField = FldLst.FindField('AppList_ColorItem')) or
         (ChField = FldLst.FindField('AppList_ColorCurrentItem')) or
         (ChField = FldLst.FindField('AppList_ColorCurrentItemText')) or
         (ChField = FldLst.FindField('AppList_ColorBorder')) or
         (ChField = FldLst.FindField('AppList_ColorLinkText')) or
         (ChField = FldLst.FindField('AppList_ColorLinkTextErr')) or
         (ChField = FldLst.FindField('AppList_ColorGroupText')) or
         (ChField = FldLst.FindField('AppList_ShowBorder')) then
        VST.Invalidate;

      if ChField = FldLst.FindField('StayOnTop') then
      begin
        if ChField.AsBoolean then
          FormStyle := fsStayOnTop
          else
          FormStyle := fsNormal;
      end;

      if ChField = FldLst.FindField('SkipCorruptedLinksOnFilter') then
      begin
        ActShowCorruptedLinks.Checked := ChField.AsBoolean;
        ShowNodesWithCorruptedLinks;
        UpdateActionControls;
        if FilterValue <> '' then
          FilterTree(FilterValue);
      end;

    end;
  end;
end;

procedure TfMainLinker.UcBtn_InfoEnter(Sender: TObject);
begin
  VST.SetFocus;
end;

procedure TfMainLinker.UcBtn_InfoMouseLeave(Sender: TObject);
begin
  DoMouseLeave(Sender);
end;

procedure TfMainLinker.UpdateActionControls;
var Td: TTreeData;
    VisibleVal: Boolean;
begin
  if Assigned(VST.FocusedNode) then
    Td := TTreeData(VST.GetNodeData(VST.FocusedNode)^);

  VisibleVal := Assigned(VST.FocusedNode) and (Td.rType = itLink);
  actRunAsAdmin.Enabled     := VisibleVal;
  actFileLocation.Enabled   := VisibleVal;
  actShowProperties.Enabled := VisibleVal;
  actOpen.Enabled           := VisibleVal;
  actEdit.Enabled           := Assigned(VST.FocusedNode) and
                               (Td.rType in [itLink, itGroup]);
  actClone.Enabled          := VisibleVal;

  if ActShowCorruptedLinks.Checked then
    ActShowCorruptedLinks.ImageIndex := 25
    else
    ActShowCorruptedLinks.ImageIndex := 26;
end;

procedure TfMainLinker.UpdateCaption(const AddText: string = '');
begin
  if AddText = '' then
    Caption := 'Linker v' + UC_GetExeFileVersionInfo.FileVersion
    else
    Caption := 'Linker ' + AddText;
end;

procedure TfMainLinker.VSTAfterCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellRect: TRect);
var
  vst_: TVirtualStringTree;
  Td : PTreeData;
  vLvl, L, T: Integer;
begin
  Td := Sender.GetNodeData(Node);
  if Assigned(Td) and Td^.rRunAsAdmin then
  begin
    vst_ := TVirtualStringTree(Sender);
    vLvl := vst_.GetNodeLevel(Node) + 1;
    L := CellRect.Left + vLvl * Integer(vst_.Indent) + vst_.Images.Width - DM.ImgList_Buttons.Width;
    T := CellRect.Top + vst_.Images.Height - DM.ImgList_Buttons.Height;
    DM.ImgList_Buttons.Draw(TargetCanvas, L, T, 13);
  end;
end;

procedure TfMainLinker.VSTBeforeCellPaint(Sender: TBaseVirtualTree;
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

  procedure PaintCell(Lvl: Integer; ItemType: TItemType);
  begin
    case ItemType of
      itLink, itDivider: begin
          if Lvl = SelLvl then
            Cnv.Brush.Color := CntSelColor
            else
            Cnv.Brush.Color := GetColor_(CntColor, 1 - Lvl * CntColorDec);
        end;

      itGroup: begin
          if Node = vst_.NodeParent[vst_.FocusedNode] then
            Cnv.Brush.Color := GrSelColor
            else
            Cnv.Brush.Color := GetColor_(GrColor, 1 - Lvl * GrColorDec);
        end;
    end;

    Cnv.FillRect(Rect(CR.Left + vIndent * Lvl, CR.Top, CR.Right, CR.Bottom));
  end;

  procedure PaintFocus(Lvl: Integer; IsGroup: Boolean);
  var R: TRect;
  begin
    R := Rect(CR.Left + Integer(Lvl > 0)*2 + Integer(Lvl = 0) - 1 +
                vIndent * (Lvl - Integer((Lvl > 0) and not IsGroup) + Integer(IsGroup)),
              CR.Top ,
              CR.Right - (Lvl + 1) + 1,
              CR.Bottom  - Integer(not Assigned(vst_.GetNextSibling(Node))) * 1);

    if vst_.Selected[Node] then
    begin
      Cnv.Brush.Color := DM.Options['AppList_ColorCurrentItem'].AsInteger;
      Cnv.FillRect(R);
    end;

    if (vst_.FocusedNode = Node) and
       DM.Options['AppList_ShowBorder'].AsBoolean then
    begin
      Cnv.Pen.Color := DM.Options['AppList_ColorBorder'].AsInteger;
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
      // ������
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
  Td: PTreeData;
  vLvl, nLvl: Integer;
begin
  Td := Sender.GetNodeData(Node);
  if Assigned(Td) then
    with TargetCanvas do
    begin
      vst_ := TVirtualStringTree(Sender);
      //��������� �������� �����
      CntColor    := DM.Options['AppList_ColorItem'].AsInteger;
      CntSelColor := DM.Options['AppList_ColorCurrentGroup'].AsInteger;
      GrColor     := DM.Options['AppList_ColorGroup'].AsInteger;
      GrSelColor  := GetColor_(CntSelColor, 0.55);
      //**
      Cnv := TargetCanvas;
      CR := CellRect;
      vIndent := vst_.Indent;
      Pen.Width := 1;

      try
      // ���������� ������� ����������� ���� ��� ��������� �������������
        if VT_IsNodeSibling(vst_, vst_.FocusedNode, Node)or
           VT_IsNodeParent(vst_, Node, vst_.NodeParent[vst_.FocusedNode]) then
          SelLvl := vst_.GetNodeLevel(vst_.FocusedNode)
          else
          SelLvl := -1;
      except
        // ������ ��� ��������� ������ ���� �������� ������
        SelLvl := -1;
      end;

      nLvl := vst_.GetNodeLevel(Node);

      if not DM.Options['ClassicAppList'].AsBoolean then
      begin
        vLvl := (nLvl - integer(Td^.rType <> itGroup));
        // ������ ������
        PaintCell(nLvl, Td^.rType);

        //  ������ ������������ ����� ������
        PaintVertLines(vLvl, Td^.rType = itGroup);

        //  ... � �������������� ����� ������
        PaintHorsLines(vLvl, Td^.rType = itGroup);

      end;

      // ������ �����
      PaintFocus(nLvl, Td^.rType = itGroup);

      // ������ �����������
      if Td^.rType = itDivider then
      begin
        Cnv.Pen.Color := clGray;
        Cnv.MoveTo(CR.Left + vIndent * nLvl + 15, (CR.Bottom - CR.Top) div 2 -1);
        Cnv.LineTo(CR.Right - 5, (CR.Bottom - CR.Top) div 2 -1);

        Cnv.Pen.Color := clWhite;
        Cnv.MoveTo(CR.Left + vIndent * nLvl + 15, (CR.Bottom - CR.Top) div 2);
        Cnv.LineTo(CR.Right - 5, (CR.Bottom - CR.Top) div 2);
      end;
    end;
end;

procedure TfMainLinker.VSTClick(Sender: TObject);
var Node: PVirtualNode;
    P: TPoint;
begin
  Windows.GetCursorPos(P);
  P := VST.ScreenToClient(P);
  Node:= VST.GetNodeAt(P.X, P.Y);

  if not Assigned(Node) then
    VST.FocusedNode := nil;
end;

procedure TfMainLinker.VSTDblClick(Sender: TObject);
begin
  if Assigned(VST.HotNode) and
     (TTreeData(VST.GetNodeData(VST.HotNode)^).rType = itLink) then
    RunProgs;
end;

procedure TfMainLinker.VSTDragAllowed(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
begin
  Allowed := not fReadOnlyFS;
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
    // �� ���� ��� ��� ���������� ���� �� � ������ CF_HDROP ������
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
            // � ��� � ���� � ����� �������. � Microsoft ��������� � �� ����
            // ������� ������ � DROPFILES ����������.
            // �����������, ������ ��������� ������ �������� � ������
            // ���������
            // + offset, ������� � ���� OLEData^.pFiles.
            Files := PAnsiChar(OLEData) + OLEData^.pFiles;
            // ������ ������������ ������� null ��������
            while Files^ <> #0 do
            begin
              if OLEData^.fWide then
              begin
                Str := PWideChar(Files);
                // +1 ����� ��� ����, ����� ����������� null ������ ������
                // �� ��� ������ � ������
                Inc(Files, (Length(PWideChar(Files)) + 1)*SizeOf(WideChar));
              end
              else begin
                Str := string(Files);
                // ����������
                Inc(Files, (Length(PChar(Files)) + 1)*SizeOf(Char));
              end;
              // ��������� ������
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

procedure TfMainLinker.VSTDragDrop(Sender: TBaseVirtualTree;
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
  // ���������� ���� ��������� ���� � ����������� �� ����, ���� ����
  // ������� �����.
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
    // ������� �� VT. ����� �������� ������������ ��� ��������
    // ����������� � �����������.
    Effect := DROPEFFECT_MOVE;
    // ������� ������ �����, ������� ����� ����������� � Drag&Drop
    Nodes := VST.GetSortedSelection(True);
    // � �������� � ������
    for i := 0 to High(Nodes) do
      VST.MoveTo(Nodes[i], TargetNode, AttachMode, False);
    fNeedSave := True;
  end
  else if Assigned(DataObject) then
  begin
    StrList := TStringList.Create;
    try
      AddFiles(DataObject, StrList);
      for i := 0 to StrList.Count - 1 do
        if not AddItem(itLink, StrList[i], TargetNode, AttachMode) then
          Break;
    finally
      StrList.Free;
    end;
  end;
end;

procedure TfMainLinker.VSTDragOver(Sender: TBaseVirtualTree;
  Source: TObject; Shift: TShiftState; State: TDragState; Pt: TPoint;
  Mode: TDropMode; var Effect: Integer; var Accept: Boolean);
var
  i: Integer;
  Nodes: TNodeArray;
begin
  Accept := (not fReadOnlyFS) and
            ( (Mode <> dmOnNode)or
              (Assigned(Sender.DropTargetNode)and
               (TTreeData(Sender.GetNodeData(Sender.DropTargetNode)^).rType = itGroup)) );

  SetLength(Nodes, 0);
  if (Assigned(Sender.DropTargetNode)) and (Sender.DropTargetNode <> Sender.RootNode) then
    Nodes := (Sender as TVirtualStringTree).GetSortedSelection(True);
  if Length(Nodes) > 0 then
    for i := 0 to Length(Nodes) - 1 do
    begin
      Accept :=
        // ���� �� ������ ���� ��������� �����, � ������� ������������ �������
        ((not (Source is TVirtualStringTree)) or
        (not VT_IsNodeParent(Sender, Sender.DropTargetNode, Nodes[i])))

        // �����, ���� �� ������ ��������� �����-��������������� �������.
        // �.�. �� ������ ��������� ������� ���� � ������ ����.
        {and ((Sender.DropTargetNode <> Nodes[i]))};
      // ��������� �������, ���� ���� �� ���� �� ������� ������� False
      if (TTreeData(Sender.GetNodeData(Sender.DropTargetNode)^).rType <> itGroup)
          and
         (Mode = dmOnNode) then Accept := False;

      if not Accept then
        Exit;
    end;

  VTAutoscrollVertical(Sender, Pt);
end;

procedure TfMainLinker.VSTExpanded(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var Nd, NdEx, NdRoot: PVirtualNode;
begin
  UpdateNodeControls(nil);
  //--- AutoCollapse ---
  if DM.Options['AutoCollapseGroups'].AsBoolean and (FilterValue = '') then
  begin
    NdRoot := Node;
    repeat
      NdEx   := NdRoot;
      NdRoot := VST.NodeParent[NdEx];
      Nd     := VST.GetFirstChild(NdRoot);
      while Assigned(Nd) do
      begin
        if Nd <> NdEx then
          VST.Expanded[Nd] := False;
        Nd := VST.GetNextSibling(Nd);
      end;
    until not Assigned(NdRoot);
  end;
end;

procedure TfMainLinker.VSTFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
begin
  Sender.Invalidate;
  UcBtn_Info.Invalidate;
  UpdateActionControls;
end;

procedure TfMainLinker.VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  Finalize(TTreeData(VST.GetNodeData(Node)^));
end;

procedure TfMainLinker.VSTGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer);
var
  TreeData : PTreeData;
begin
  TreeData := Sender.GetNodeData(Node);
  if TreeData.rType = itLink then
    ImageIndex := TreeData.rImageIndex
    else
    ImageIndex := -1;
end;

procedure TfMainLinker.VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column:
    TColumnIndex; TextType: TVSTTextType; var CellText: String);
var Td: PTreeData;
begin
  Td := Sender.GetNodeData(Node);
  if Column = 0 then
    if Td^.rType = itDivider then
      CellText := '                                '
      else
      CellText := Td^.rName;
end;

procedure TfMainLinker.VSTInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var i: Integer;
begin
  with TTreeData(VST.GetNodeData(Node)^) do
  begin
    if rType = itLink then
      i := Integer((rPath <> '') and (ExtractFileExt(rPath) = ''))
      else
      i := -1;

    if i in [0, 1] then
      rImageIndex := VST.Images.AddImage(DM.PngImageList3, i)
      else
      rImageIndex := 0;

    rNeedIcon := not ((rIcon = '') and ((i = 1) or (rType <> itLink)));

    rFileExists := True;
  end;
  ExtractIcons(VST);
end;

procedure TfMainLinker.VSTKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13:
      begin
        RunProgs;
        if FilterValue <> '' then
          FilterTree;
      end;
    #27:
      if IsFiltered then // �� ������� Esc ���������� ������, �� ������� ����������� ����
        FilterTree
      else
        MinimizeToTray;
    #32..#126, #192..#255: //������, �����
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

procedure TfMainLinker.VSTMeasureItem(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; var NodeHeight: Integer);
begin
  case TTreeData(Sender.GetNodeData(Node)^).rType of
    itLink    : NodeHeight := TVirtualStringTree(Sender).DefaultNodeHeight;
    itGroup   : NodeHeight := 20;
    itDivider : NodeHeight := 10;
  end;
end;

procedure TfMainLinker.VSTMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var Node: PVirtualNode;
    P: TPoint;
begin
  Windows.GetCursorPos(P);
  P := VST.ScreenToClient(P);
  Node:= VST.GetNodeAt(P.X, P.Y);
  UpdateNodeControls(Node);
end;

procedure TfMainLinker.VSTPaintText(Sender: TBaseVirtualTree; const
    TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; TextType:
    TVSTTextType);
var
  Td: PTreeData;
begin
  Td := VST.GetNodeData(Node);
  if Assigned(Td) then
  begin
    case Td^.rType of
      itLink  : begin
          if not Td^.rFileExists then
            TargetCanvas.Font.Color := DM.Options['AppList_ColorLinkTextErr'].AsInteger
            else
            TargetCanvas.Font.Color := DM.Options['AppList_ColorLinkText'].AsInteger;
        end;

      itGroup : begin
          TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold];
          TargetCanvas.Font.Color := DM.Options['AppList_ColorGroupText'].AsInteger;
        end;
    end;

    if VST.FocusedNode = Node then
      TargetCanvas.Font.Color := DM.Options['AppList_ColorCurrentItemText'].AsInteger;
  end;
end;

procedure TfMainLinker.VSTScroll(Sender: TBaseVirtualTree; DeltaX,
  DeltaY: Integer);
begin
  UcBtn_Info.CustomHint;
end;

// �������� Windows-��������� ��� ������� ������� ������
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

procedure TfMainLinker.WMQueryEndSession(var Message: TWMQueryEndSession);
begin
  // ���� ����� ���������� ��� ���������� ������ Windows
  Message.Result := 1; // �������� Windows, ��� ����� ���������� ���������� ��
  fCanClose := True;
  Close;
end;

procedure TfMainLinker.DoRestoreFromTray(var Message: TMessage);
begin
  RestoreFromTray;
end;

procedure TfMainLinker.MinimizeToTray;
begin
  Visible := False;
  ShowWindow(Handle, SW_HIDE); // �������� ���������
  ShowWindow(Application.Handle, SW_HIDE); // �������� ������ � TaskBar'�
end;

procedure TfMainLinker.RestoreFromTray;
begin
  Visible := True;
  ShowWindow(Application.Handle, SW_SHOW); // ��������������� ������ ���������
  ShowWindow(Handle, SW_SHOWNORMAL); // ��������������� ���� ���������
  Application.BringToFront;
  BringToFront;
  //--
  VST.SetFocus;
  if (VST.FocusedNode = nil) and (VST.TotalCount > 0) then
    VST.FocusedNode := VST.GetFirst;

  if Assigned(VST.FocusedNode) then
    VST.ScrollIntoView(VST.FocusedNode, True);
end;

initialization
  IsLibrary := True;

finalization
  IsLibrary := False;

end.
