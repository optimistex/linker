unit uDM;

interface

uses
  Forms, Windows, Messages, SysUtils, Classes, Controls, ExtCtrls,
  Menus, VirtualTrees, Graphics, ucWindows, ImgList, PngImageList, ucIDObjects;

type
  TDM = class(TDataModule)
    TrayIcon: TTrayIcon;
    PM_Tray: TPopupMenu;
    N1: TMenuItem;
    PngImgLst_Tree: TPngImageList;
    ImgList_Buttons: TPngImageList;
    PngImageList3: TPngImageList;
    procedure TrayIconClick(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    WorkPath: string;
    Options: TIDObject;
    procedure RestoreRootPath;
  end;

  procedure VTAutoscrollVertical(Sender: TBaseVirtualTree; Pt: TPoint;
                                 ActiveZone: Integer = 50;
                                 ScrollBy: Integer = 20);

var
  DM: TDM;

implementation

uses ufMain2;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Options  := TIDObject.Create;
  WorkPath := ExtractFilePath(Application.ExeName);
  RestoreRootPath;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Options.Free;
end;

procedure TDM.TrayIconClick(Sender: TObject);
begin
  if fMainLinker.Visible and UC_VisibleWinRectFull(fMainLinker.Handle) then
    fMainLinker.MinimizeToTray
    else
    fMainLinker.RestoreFromTray;
end;

procedure TDM.RestoreRootPath;
begin
  ChDir(WorkPath);
end;

procedure VTAutoscrollVertical(Sender: TBaseVirtualTree; Pt: TPoint;
                               ActiveZone: Integer = 50;
                               ScrollBy: Integer = 20);
begin
  if Pt.Y < ActiveZone then
    TVirtualStringTree(Sender).OffsetY := Sender.OffsetY + ScrollBy;

  if Pt.Y > Sender.Height - ActiveZone then
    TVirtualStringTree(Sender).OffsetY := Sender.OffsetY - ScrollBy;
end;

end.
