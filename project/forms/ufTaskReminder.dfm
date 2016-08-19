object TaskReminder: TTaskReminder
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'TaskReminder'
  ClientHeight = 168
  ClientWidth = 344
  Color = clWindow
  Constraints.MinHeight = 200
  Constraints.MinWidth = 350
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    344
    168)
  PixelsPerInch = 96
  TextHeight = 13
  object UcLbl_Text: TUcLabel
    Left = 8
    Top = 8
    Width = 328
    Height = 30
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 'UcLbl_Text'
    WordWrap = True
    Version = '13.02.2014'
    WebLink = 'http://optitrex.ru'
  end
  object UcPanel1: TUcPanel
    Left = 0
    Top = 127
    Width = 344
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'UcPanel1'
    TabOrder = 0
    BackGroundStyle = isOriginal
    ShowCaption = False
    DesignSize = (
      344
      41)
    object UcWBtn_Ok: TUcWinButton
      Left = 234
      Top = 8
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      CaptionEx.Strings = (
        #1054#1050)
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      Images.PosCenter = True
      TabOrder = 0
      ExplicitLeft = 304
    end
  end
  object RdBtn_DoNow: TRadioButton
    Left = 8
    Top = 48
    Width = 201
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1089#1077#1081#1095#1072#1089
    Checked = True
    TabOrder = 1
    TabStop = True
    OnClick = RdBtn_DoNowClick
  end
  object RdBtn_Delay: TRadioButton
    Left = 8
    Top = 71
    Width = 201
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1083#1086#1078#1080#1090#1100' '#1085#1072':'
    TabOrder = 2
    OnClick = RdBtn_DoNowClick
  end
  object CmBox_DelayInterval: TComboBox
    Left = 24
    Top = 94
    Width = 145
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    ItemIndex = 0
    TabOrder = 3
    Text = '1 '#1076#1077#1085#1100
    Items.Strings = (
      '1 '#1076#1077#1085#1100
      '3 '#1076#1085#1103
      '7 '#1076#1085#1077#1081
      '30 '#1076#1085#1077#1081)
  end
end
