unit ufAbout;

interface

uses
  Windows, SysUtils, Variants, Classes, Controls, Forms,
  ShellAPI, UcButtons, ExtCtrls, pngimage, StdCtrls, Graphics, ucFileSystem,
  ucStdCtrls;

type
  TAbout = class(TForm)
    Image1: TImage;
    Lbl_Site: TUcLabel;
    Lbl_History: TUcLabel;
    Label1: TUcLabel;
    Label2: TUcLabel;
    Label3: TUcLabel;
    Label4: TUcLabel;
    Lbl_Version: TUcLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About: TAbout;

implementation

uses uFunctions;

{$R *.dfm}

procedure TAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAbout.FormCreate(Sender: TObject);
begin
  Lbl_Version.Caption := 'Linker v' + UC_GetExeFileVersionInfo.FileVersion;
end;

procedure TAbout.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: Close;
    VK_RETURN: begin
        GoToWebSite(Lbl_Site.WebLink);
        Close;
      end;
  end;
end;

procedure TAbout.Image1Click(Sender: TObject);
begin
  Close;
end;

end.
