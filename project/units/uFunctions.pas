unit uFunctions;

interface

uses Windows, SysUtils, Forms, Menus, Classes, ShellAPI;

type
  TPickIconDlgW = function (hwnd: THandle; pszIconPath: PWideChar;
    cchIconPath: Cardinal; var piIconIndex: Integer): LongBool; stdcall;

  TPickIconDlgA = function (hwnd: THandle; pszIconPath: PChar;
    cchIconPath: Cardinal; var piIconIndex: Integer): LongBool; stdcall;

  TOperationKind = (okAdd = 1, okEdit = 2);

  TIconPath = record
    Name  : string;
    Index : Integer;
  end;

procedure GoToWebSite(URL: string);
function ParceIconPath(const aPath: string): TIconPath;
function PickIconDlg(hwnd: THandle; var IconPath: string; var piIconIndex: Integer): Boolean;

const
  IconSeparator = '|';

implementation

procedure GoToWebSite(URL: string);
begin
  ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWMAXIMIZED);
end;

function PickIconDlg(hwnd: THandle; var IconPath: string;
  var piIconIndex: Integer): Boolean;
var
  PickIconDlgFunc: Pointer;
  hShell: THandle;
  pszIconPath: Pointer;
begin
  hShell := LoadLibrary('shell32.dll');
  if hShell = 0 then begin
    Result := False;
    RaiseLastOSError;
    Exit;
  end;

  PickIconDlgFunc := GetProcAddress(hShell, 'PickIconDlg');

  if (PickIconDlgFunc = nil)
    then PickIconDlgFunc := GetProcAddress(hShell, PChar(62));

  if PickIconDlgFunc <> nil then begin
    if GetVersion < $80000000 then begin // WinNT/2k/XP
      GetMem(pszIconPath, SizeOf(WideChar)*MAX_PATH);
      StringToWideChar(IconPath, pszIconPath, MAX_PATH);
      Result := TPickIconDlgW(PickIconDlgFunc)(hwnd, pszIconPath, MAX_PATH, piIconIndex);
      IconPath := PWideChar(pszIconPath);
      FreeMem(pszIconPath);
    end
    else begin  // Win9x/Me
      GetMem(pszIconPath, SizeOf(Char)*MAX_PATH);
      StrPLCopy(pszIconPath, IconPath, MAX_PATH);
      Result := TPickIconDlgA(PickIconDlgFunc)(hwnd, pszIconPath, MAX_PATH, piIconIndex);
      IconPath := PChar(pszIconPath);
      FreeMem(pszIconPath);
    end
  end
  else begin
    Result := False;
    RaiseLastOSError;
  end;
  FreeLibrary(hShell);
end;

function ParceIconPath(const aPath: string): TIconPath;
var
  i : Integer;
begin
  i := Pos(IconSeparator,aPath);
  if i = 0 then
  begin
    Result.Name  := aPath;
    Result.Index := 0;
  end
  else begin
    Result.Name  := Copy(aPath, 1, i-1);
    Result.Index := StrToIntDef(Copy(aPath, i+1, Length(aPath)-i), 0);
  end;
end;

end.
