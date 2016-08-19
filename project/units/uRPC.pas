unit uRPC;

interface
uses Windows, Classes, SysUtils,
     UcDialogs, ucWindows, ucXXTEA, ucOSUtils, ucdXmlRpc_Client;

// Local
function RPC_ChekAccess(SilentMode: Boolean = False): Boolean;
procedure RPC_ShowFault;
function GetSysDriveSerial: String;

// Remote
function RPC_GetFunctions(FuncList: TStrings): Boolean;
function RPC_GetAccess: Boolean;
function RPC_GetFile(FileName: string; Stream: TStream): Boolean;
function RPC_ClientInfo(out Version, Path: string): Boolean;

var xrc: TXmlRpcClient = nil;
    PublicKey: RawByteString = 'secure_pass'; // Внутренний ключ шифрования (для получения PrivateKey)
    PrivateKey: RawByteString = '';// Ключ шифрования для работы в сети

implementation

var Accessed: Boolean;

function RPC_ChekAccess(SilentMode: Boolean = False): Boolean;
begin
  if not Accessed then
    Accessed := RPC_GetAccess;

  Result := Accessed;
  if not Result and not SilentMode then
    RPC_ShowFault;
end;

procedure RPC_ShowFault;
begin
  MessageDlg(IntToStr(xrc.FaultCode) + ':'#13#10 + xrc.FaultString,
             mtError, [mbOK], 0);
end;

function GetSysDriveSerial: String;
var SerNum: string;
begin
  Result := IncludeTrailingBackslash(UC_GetEnvironmentVariable('SystemDrive'));
  UC_GetSerialNumberVolumeDisk(Result, SerNum);
  Result := SerNum;
end;

function RPC_GetFunctions(FuncList: TStrings): Boolean;
var i: Integer;
begin
  xrc.ClearStreams;

  xrc.XRCall.MetodName := 'service.functions';
  Result := xrc.CallRemoteProcedure;

  Result := Result and (not xrc.XRResp.IsFault);

  if Result then
    for I := 0 to xrc.XRResp.Params[0].AsStruct.Count - 1 do
      FuncList.Add(xrc.XRResp.Params[0].AsStruct.Member[i].Name + ': ' +
                   xrc.XRResp.Params[0].AsStruct.Member[i].Value.AsString);
end;

function RPC_GetAccess: Boolean;

  function _OSInfo: string;
  var OSVI: TOSVersionInfoEx;
  begin
    if UC_GetVersionEx(OSVI) then
      Result := UC_OSVersionInfoToString(OSVI)
      else
      Result := 'GetVersionEx fail: ' + SysErrorMessage(GetLastError);
  end;

begin
  xrc.ClearStreams;

  // Получаем приватный ключ
  xrc.XRCall.MetodName := 'service.get_access';
  xrc.XRCall.Params[0].AsString := 'get_key';
  Result := xrc.CallRemoteProcedure;

  // Авторизовываем программу
  if Result then
  begin
    PrivateKey := xxtea_decrypt(RawByteString(xrc.XRResp.Params[0].AsBase64), PublicKey);
    xrc.XRCall.Params[0].AsString := 'get_access';
    xrc.XRCall.Params[1].AsBase64 := string(xxtea_encrypt(PrivateKey, PrivateKey));
      // Серийник системного раздела
    xrc.XRCall.Params[2].AsString := GetSysDriveSerial;
      // Инфо об ОС
    xrc.XRCall.Params[3].AsString := _OSInfo;

    Result := xrc.CallRemoteProcedure;
  end;
  //**

  Result := Result and (not xrc.XRResp.IsFault) and xrc.XRResp.Params[0].AsBoolean;
end;

function RPC_GetFile(FileName: string; Stream: TStream): Boolean;
begin
  xrc.ClearStreams;

  xrc.XRCall.MetodName := 'service.get_file';
  xrc.XRCall.Params[0].AsString := FileName;
  Result := xrc.CallRemoteProcedure;

  Result := Result and (not xrc.XRResp.IsFault);

  if Result then
    xrc.RespStream.SaveToStream(Stream);
end;

function RPC_ClientInfo(out Version, Path: string): Boolean;
begin
  xrc.ClearStreams;

  xrc.XRCall.MetodName := 'service.client_info';
  Result := xrc.CallRemoteProcedure;

  Version := xrc.XRResp.Params[0].AsString;
  Path    := xrc.XRResp.Params[1].AsString;
end;

initialization
  xrc := TXmlRpcClient.Create;

finalization
  xrc.Free;

end.
