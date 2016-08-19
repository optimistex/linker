unit uIconExtractor;

interface

uses
  Windows, ShellAPI, CommCtrl, Forms, Classes, Graphics,
  VirtualTrees, ufMain2, SysUtils, ucFunctions;

type
  TIconExtractor = class(TThread)
  private
    { Private declarations }
  protected
    Stop: Boolean;
    NeedRestart: Boolean;

    VST: TVirtualStringTree;
    Node: PVirtualNode;
    Data: TTreeData;
    hIco: HICON;
    Ico: TIcon;
    fFileExists: Boolean;

    procedure Execute; override;
    procedure GetNextData;
    procedure UpdateIcon;
  public
    constructor Create(crVST: TVirtualStringTree); reintroduce;
    destructor  Destroy; override;
  end;

  procedure ExtractIcons(crVST: TVirtualStringTree);
  procedure StopExtractIcons;
  procedure ExtractIconsPause;

implementation

uses uDM;

var IconExtractor: TIconExtractor = nil;

procedure ExtractIcons(crVST: TVirtualStringTree);
begin
  if not Assigned(IconExtractor) then
    IconExtractor := TIconExtractor.Create(crVST)
    else begin
      IconExtractor.NeedRestart := True;
      IconExtractor.Suspended := False;
    end;
end;

procedure StopExtractIcons;
begin
  if Assigned(IconExtractor) then
    IconExtractor.Stop := true;
  while Assigned(IconExtractor) do Application.ProcessMessages;
end;

procedure ExtractIconsPause;
begin
  if Assigned(IconExtractor) then
    IconExtractor.Suspended := True;
end;

constructor TIconExtractor.Create(crVST: TVirtualStringTree);
begin
  inherited Create(false);
  Stop := False;
  NeedRestart := True;
  //---
  FreeOnTerminate := True;
  Ico := TIcon.Create;

  VST := crVST;
  Node := nil;
end;

destructor TIconExtractor.Destroy;
begin
  IconExtractor := nil;
  Ico.Free;
  inherited;
end;

procedure TIconExtractor.GetNextData;
begin
  if not Assigned(Node) then
    Node := VST.GetFirst
    else
    Node:= VST.GetNext(Node);

  if Assigned(Node) then
    Data:= TTreeData(VST.GetNodeData(Node)^);
end;

procedure TIconExtractor.UpdateIcon;
begin
  if hIco = 0 then Exit;

  Ico.Handle := hIco;
  VST.Images.ReplaceIcon(Data.rImageIndex, Ico);
  TTreeData(VST.GetNodeData(Node)^).rNeedIcon   := false;
  TTreeData(VST.GetNodeData(Node)^).rFileExists := fFileExists;
//  UpdateNode(VST, Node);
  VST.InvalidateNode(Node);
end;

procedure TIconExtractor.Execute;
var
  xIcon: string;
  xPath, ss: string;
  lpIcon: Word;
begin
  while NeedRestart do
  begin
    NeedRestart := false;
    //---
    if Stop then Exit;
    Synchronize(GetNextData);
    while Assigned(Node) do
    begin
      if Stop then Exit;
      //---
      xPath := UC_ExpandFileName(Data.rPath);
      xIcon := UC_ExpandFileName(Data.rIcon);

      // Проверка существования файла
      fFileExists := (Pos('\', Data.rPath) = 0) or FileExists(xPath) or DirectoryExists(xPath);
      //**

      if Data.rNeedIcon and
        (Data.rImageIndex >= 0)
      then
      begin
        lpIcon := 0;
        hIco := 0;
        if xIcon <> '' then
          try
            hIco := ExtractIcon(Application.Handle, PChar(xIcon), Data.rIconIndex);
            if hIco = 0 then
            begin
              ss := Copy(xIcon, 1, 255) + #0#0;
              SetLength(ss, 1024);
              hIco := ExtractAssociatedIcon(Application.Handle, PChar(ss), lpIcon);
            end;
          except
          end
        else
          try
            hIco := ExtractIcon(Application.Handle, PChar(xPath), 0);
            if hIco = 0 then
            begin
              ss := Copy(xPath, 1, 255) + #0#0;
              SetLength(ss, 1024);
              hIco := ExtractAssociatedIcon(Application.Handle, PChar(ss), lpIcon);
            end;
          except
          end;
        SetLength(ss, 0);
        if Stop then Exit;
        Synchronize(UpdateIcon);
      end;
      //---
      if Stop then Exit;

      {$MESSAGE 'Убрать задержку'}
//      Sleep(500);

      Synchronize(GetNextData);
    end;
    //---
  end;
end;

initialization

finalization
//  IconExtractor.Free;

end.
