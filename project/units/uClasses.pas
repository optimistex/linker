unit uClasses;

interface

uses Classes, VirtualTrees, ucTypes, ucClasses,

     ucIDObjects, ucdVSTfunctions;

type
  TNodeObject = class(TDBFields)
    OwnNode: PVirtualNode;
  end;

  TNodeLink = class(TNodeObject)

  end;

  TNodeGroup = class(TNodeObject)

  end;

  TNodeDivider = class(TNodeObject)

  end;

implementation

{ TApplicationNode }

end.
