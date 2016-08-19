unit frFrameColorEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UcButtons, ExtCtrls;

type
  TFrameColorEdit = class(TFrame)
    Shp_Color: TShape;
    UcWBtn_Color: TUcWinButton;
    procedure UcWBtn_ColorClick(Sender: TObject);
  private
    { Private declarations }
    FCustomColors: TStringList;
    FOnColorChanged: TNotifyEvent;
    function  GetColorActive: TColor;
    procedure SetColorActive(Value: TColor);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  published
    property ColorActive: TColor read GetColorActive write SetColorActive;
    property OnColorChanged: TNotifyEvent read  FOnColorChanged
                                          write FOnColorChanged;
  end;

implementation

{$R *.dfm}

constructor TFrameColorEdit.Create(AOwner: TComponent);
begin
  inherited;
  FCustomColors := TStringList.Create;
end;

destructor  TFrameColorEdit.Destroy;
begin
  FCustomColors.Free;
  inherited;
end;

function  TFrameColorEdit.GetColorActive: TColor;
begin
  Result := Shp_Color.Brush.Color;
end;

procedure TFrameColorEdit.SetColorActive(Value: TColor);
begin
  if Shp_Color.Brush.Color <> Value then
  begin
    Shp_Color.Brush.Color := Value;
    Shp_Color.Repaint;
  end;
end;

procedure TFrameColorEdit.UcWBtn_ColorClick(Sender: TObject);
var
  ClDlg: TColorDialog;
begin
  ClDlg := TColorDialog.Create(Self);
  try
    ClDlg.Color := ColorActive;
    ClDlg.CustomColors := FCustomColors;
    if ClDlg.Execute then
    begin
      ColorActive := ClDlg.Color;
      FCustomColors.Assign(ClDlg.CustomColors);
      if Assigned(FOnColorChanged) then FOnColorChanged(Self);
    end;
  finally
    ClDlg.Free;
  end;
end;

end.
