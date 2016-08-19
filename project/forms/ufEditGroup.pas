unit ufEditGroup;

interface

uses
  Windows, SysUtils, Variants, Forms,
  Dialogs, UcButtons, VirtualTrees, uFunctions,
  ActnList, Classes, Controls, StdCtrls, ExtCtrls, ucStdCtrls;

type
  TfEditGroup = class(TForm)
    LbEd_FileName: TLabeledEdit;
    UniversalButton1: TUcButton;
    UniversalButton2: TUcButton;
    ActionList1: TActionList;
    actCommit: TAction;
    Label2: TUcLabel;
    mmNote: TMemo;
    procedure actCommitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mmNoteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FileName: string;
    Node: PVirtualNode;
    VST: TVirtualStringTree;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; crVST: TVirtualStringTree; crNode:
        PVirtualNode; const aOperationKind: TOperationKind); reintroduce;
    { Public declarations }
  end;

var
  fEditGroup: TfEditGroup;

implementation

uses ufMain2;

{$R *.dfm}

constructor TfEditGroup.Create(AOwner: TComponent; crVST: TVirtualStringTree;
    crNode: PVirtualNode; const aOperationKind: TOperationKind);
begin
  inherited Create(AOwner);

  VST  := crVST;
  Node :=crNode;
  if aOperationKind = okAdd then
  begin
    Self.Caption := 'Добавление группы';
    LbEd_FileName.Text  := '';
    mmNote.Lines.Clear;
  end
  else
  begin
    Self.Caption := 'Редактирование группы';
    with TTreeData(VST.GetNodeData(Node)^) do
    begin
      LbEd_FileName.Text  := rName;
      mmNote.Lines.Text := rNote;
    end;
  end;
end;

procedure TfEditGroup.actCommitExecute(Sender: TObject);
begin
  if (LbEd_FileName.Text = '') then
  begin
    MessageDlg('Не все поля заполнены!', mtError, [mbOK], 0);
    ModalResult := mrNone;
    Exit;
  end;

  with TTreeData(VST.GetNodeData(Node)^) do
  begin
    rPath       := '';
    rName       := Trim(LbEd_FileName.Text);
    rIcon       := '';
    rIconIndex  := 0;
    rParameters := '';
    rShowCmd    := 0;
    rType       := itGroup;
    rNote       := mmNote.Lines.Text;
    rRunAsAdmin := False;
  end;

  VST.ReinitNode(Node, false);
end;

procedure TfEditGroup.FormCreate(Sender: TObject);
begin
  FileName := '';
end;

procedure TfEditGroup.mmNoteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  State : TKeyboardState;
begin
  if Key = VK_RETURN then
  begin
    GetKeyboardState(State);
    if ((State[vk_Control] and 128) = 0) then
    begin
      actCommit.Execute;
      ModalResult := mrOk;
    end;
  end;
  if Key = VK_ESCAPE then
    ModalResult := mrCancel;
end;

procedure TfEditGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
