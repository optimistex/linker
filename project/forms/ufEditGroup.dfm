object fEditGroup: TfEditGroup
  Left = 481
  Top = 277
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fEditGroup'
  ClientHeight = 139
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniversalButton1: TUcButton
    Left = 120
    Top = 98
    Width = 105
    Height = 33
    Action = actCommit
    Caption = 'OK'
    CaptionEx.Strings = (
      'OK')
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    Images.PosCenter = True
  end
  object UniversalButton2: TUcButton
    Left = 240
    Top = 98
    Width = 105
    Height = 33
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    CaptionEx.Strings = (
      #1054#1090#1084#1077#1085#1072)
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    Images.PosCenter = True
  end
  object Label2: TUcLabel
    Left = 17
    Top = 35
    Width = 50
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    Version = '13.02.2014'
    WebLink = 'http://optitrex.ru'
  end
  object LbEd_FileName: TLabeledEdit
    Left = 70
    Top = 8
    Width = 321
    Height = 21
    EditLabel.Width = 50
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    LabelPosition = lpLeft
    TabOrder = 0
  end
  object mmNote: TMemo
    Left = 70
    Top = 35
    Width = 321
    Height = 57
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    OnKeyDown = mmNoteKeyDown
  end
  object ActionList1: TActionList
    Left = 400
    Top = 8
    object actCommit: TAction
      Caption = 'OK'
      OnExecute = actCommitExecute
    end
  end
end
