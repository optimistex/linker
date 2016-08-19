unit ufStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VirtualTrees;

type
  TStatistics = class(TForm)
    Memo: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Init;
  end;

var
  Statistics: TStatistics;

implementation

uses ufMain2;

{$R *.dfm}

function StringListCompareStrings(List: TStringList; Index1, Index2: Integer): Integer;
begin
  Result := Integer(List.Objects[Index2]) - Integer(List.Objects[Index1]);
end;

procedure TStatistics.Init;
var CntLinks, CntGroups, CntDividers: Integer;
    Node: PVirtualNode;
    Td: PTreeData;
    VST: TVirtualStringTree;
    AppList: TStringList;
    i: Integer;
begin
  Memo.Clear;
  VST := fMainLinker.VST;

  // Подготовка
  CntLinks    := 0;
  CntGroups   := 0;
  CntDividers := 0;

  AppList := TStringList.Create;
  try
    // Сбор сведений
    Node := VST.GetFirst();
    while Assigned(Node) do
    begin
      Td := VST.GetNodeData(Node);
      case Td^.rType of
        itLink    : begin
          Inc(CntLinks);
          AppList.AddObject(Td^.rName, TObject(Td^.rNumberOfStarts));
        end;
        itGroup   : Inc(CntGroups);
        itDivider : Inc(CntDividers);
      end;

      Node := VST.GetNext(Node);
    end;

    // Статистика программ
    Memo.Lines.Add('[ Статистика программ ]');
    Memo.Lines.Add(Format('Количество ссылок: %d', [CntLinks]));
    Memo.Lines.Add(Format('Количество групп: %d', [CntGroups]));
    Memo.Lines.Add(Format('Количество разделителей: %d', [CntDividers]));

    // Статистика использования программ

    AppList.CustomSort(StringListCompareStrings);

    Memo.Lines.Add('');
    Memo.Lines.Add('[ Статистика запусков программ ]');

    for i := 0 to AppList.Count - 1 do
      Memo.Lines.Add(Format('%d - %s', [Integer(AppList.Objects[i]), AppList.Strings[i]]));
  finally
    AppList.Free;
  end;
end;

end.
