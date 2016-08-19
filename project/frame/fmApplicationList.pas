unit fmApplicationList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, VirtualTrees, uClasses, XMLIntf;

type
  TApplicationList = class(TFrame)
    VDT: TVirtualDrawTree;
    procedure VDTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
  private
    function GetObjects(Node: PVirtualNode): TNodeObject;
    procedure SetObjects(Node: PVirtualNode; const Value: TNodeObject);
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AObject: TComponent); override;

//    function AddChild(Obj: TNodeObject; Parent: PVirtualNode = nil): PVirtualNode;

//    procedure Test;

    property Objects[Node: PVirtualNode]: TNodeObject read GetObjects write SetObjects; default;
  end;

  TTreeDataEx = record
    Obj: TNodeObject;
  end;
  PTreeDataEx = ^TTreeDataEx;


implementation

uses uDM;

{$R *.dfm}

{ TApplicationList }
constructor TApplicationList.Create(AObject: TComponent);
begin
  inherited;
  VDT.NodeDataSize := SizeOf(TTreeDataEx);

  //---
//  Test;
end;

function TApplicationList.GetObjects(Node: PVirtualNode): TNodeObject;
begin
  if Assigned(Node) then
    Result := TTreeDataEx(VDT.GetNodeData(Node)^).Obj
    else
    Result := nil;
end;

procedure TApplicationList.SetObjects(Node: PVirtualNode;
  const Value: TNodeObject);
begin
  TTreeDataEx(VDT.GetNodeData(Node)^).Obj := Value;
end;

//procedure TApplicationList.Test;
//var Obj: TNodeLink;
//begin
//  Obj := TNodeLink.Create;
//  Obj['name'].AsString := 'test';
//  AddChild(Obj);
//
//  Obj := TNodeLink.Create;
//  Obj['name'].AsString := 'test';
//  AddChild(Obj);
//
//  Obj := TNodeLink.Create;
//  Obj['name'].AsString := 'test';
//  AddChild(Obj);
//
//  AddChild(Obj);
//
//end;

procedure TApplicationList.VDTFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  Objects[Node].Free;
end;

//function TApplicationList.AddChild(Obj: TNodeObject; Parent: PVirtualNode = nil): PVirtualNode;
//begin
//  try
//    Assert(Assigned(Obj) and not Assigned(Obj.OwnNode));
//
//    Result := VDT.AddChild(Parent);
//    Objects[Result] := Obj;
//    Obj.OwnNode := Result;
//  except
//    Result := nil;
//  end;
//end;

end.
