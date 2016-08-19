unit uVTFunctions;

interface

uses VirtualTrees;


  // ���������� True, ���� AParent - �������� ���� ANode.
function VT_IsNodeParent(VT: TBaseVirtualTree; AParent, ANode: PVirtualNode): Boolean;

  // ���������� True, ���� ANode1 � ANode2 - ����� ������ ��������.
function VT_IsNodeSibling(VT: TBaseVirtualTree; ANode1, ANode2: PVirtualNode): Boolean;


implementation

function VT_IsNodeParent(VT: TBaseVirtualTree; AParent, ANode: PVirtualNode): Boolean;
var
  NextParent: PVirtualNode;
begin
  Result := Assigned(AParent);
  if not Result then Exit;

  NextParent := AParent;
  repeat
    NextParent := NextParent.Parent;
  until
    (NextParent = VT.RootNode) or (NextParent = nil) or
      (NextParent = ANode);
  Result := ANode = NextParent;
end;

function VT_IsNodeSibling(VT: TBaseVirtualTree; ANode1, ANode2: PVirtualNode): Boolean;
begin
  Result := VT.NodeParent[ANode1] = VT.NodeParent[ANode2];
end;

end.
