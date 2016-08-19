unit ufTaskReminder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UcButtons, ExtCtrls, ucExtCtrls, StdCtrls, ucStdCtrls, ucFunctions;

type
  TTaskReminder = class(TForm)
    UcPanel1: TUcPanel;
    UcWBtn_Ok: TUcWinButton;
    RdBtn_DoNow: TRadioButton;
    RdBtn_Delay: TRadioButton;
    CmBox_DelayInterval: TComboBox;
    UcLbl_Text: TUcLabel;
    procedure RdBtn_DoNowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetTextMessage: string;
    procedure SetTextMessage(Value: string);
    function GetDelayTime: TDateTime;
    { Private declarations }
  public
    { Public declarations }
    property TextMessage: string read GetTextMessage write SetTextMessage;
    property DelayTime: TDateTime read GetDelayTime;
  end;

function ShowQueryUserForPendingActions(ActionSID, iCaption, iText: string): Boolean;
procedure ResetPendingAction(ActionSID: string);

var
  TaskReminder: TTaskReminder;

implementation

uses uDM;

{$R *.dfm}
const Section = 'PendingActions';

function ShowQueryUserForPendingActions(ActionSID, iCaption, iText: string): Boolean;
begin
  Result := DM.Options[ActionSID].AsDateTime <= Now;
  if Result then
    with TTaskReminder.Create(Application) do
    try
      Caption     := iCaption;
      TextMessage := iText;
      Result := ShowModal = mrOk;

      if Result then
        DM.Options[ActionSID].AsDateTime := Now + 1 // Следующий запуск будет через 1 день
        else
        DM.Options[ActionSID].AsDateTime := Now + DelayTime;
    finally
      Free;
    end;
end;

procedure ResetPendingAction(ActionSID: string);
begin
  DM.Options[ActionSID].Free;
end;

{ TTaskReminder }

procedure TTaskReminder.FormCreate(Sender: TObject);
begin
  RdBtn_DoNowClick(nil);
end;

function TTaskReminder.GetDelayTime: TDateTime;
begin
  if RdBtn_Delay.Checked then
    case CmBox_DelayInterval.ItemIndex of
      0: Result := 1;
      1: Result := 3;
      2: Result := 7;
      3: Result := 30;
      else
        Result := 0;
    end
    else Result := 0;
end;

function TTaskReminder.GetTextMessage: string;
begin
  Result := UcLbl_Text.Caption;
end;

procedure TTaskReminder.RdBtn_DoNowClick(Sender: TObject);
begin
  CmBox_DelayInterval.Enabled := RdBtn_Delay.Checked;
  if RdBtn_DoNow.Checked then
    UcWBtn_Ok.ModalResult := mrOk
    else
    UcWBtn_Ok.ModalResult := mrCancel;
end;

procedure TTaskReminder.SetTextMessage(Value: string);
var R: TRect;
begin
  if UcLbl_Text.Caption <> Value then
  begin
    R := Rect(0, 0, UcLbl_Text.Width, 0);
    UcLbl_Text.Canvas.TextRect(R, Value, [tfCalcRect, tfWordBreak]);
    Height := Height + UC_RectHeight(R) - UcLbl_Text.Height;
    UcLbl_Text.Caption := Value;
  end;
end;

end.
