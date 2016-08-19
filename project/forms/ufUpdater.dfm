object Updater: TUpdater
  Left = 453
  Top = 291
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' Linker'
  ClientHeight = 109
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Lbl_Info: TUcLabel
    Left = 8
    Top = 16
    Width = 45
    Height = 16
    Caption = 'Lbl_Info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Version = '12.05.2012'
    WebLink = 'http://optitrex.ru'
  end
  object PrBar: TProgressBar
    Left = 8
    Top = 38
    Width = 410
    Height = 17
    MarqueeInterval = 50
    TabOrder = 0
  end
  object Btn_Cancel: TButton
    Left = 168
    Top = 71
    Width = 89
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Default = True
    TabOrder = 1
    OnClick = Btn_CancelClick
  end
end
