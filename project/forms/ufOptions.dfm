object Options: TOptions
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Linker - '#1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 417
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UcPanel1: TUcPanel
    Left = 0
    Top = 387
    Width = 425
    Height = 30
    Align = alBottom
    BevelEdges = [beTop]
    BevelKind = bkTile
    BevelOuter = bvNone
    Caption = 'UcPanel1'
    TabOrder = 0
    BackGroundStyle = isOriginal
    ShowCaption = False
    DesignSize = (
      425
      28)
    object UcWBtn_OK: TUcWinButton
      Left = 216
      Top = 1
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      CaptionEx.Strings = (
        'OK')
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      Default = True
      Images.PosCenter = True
      TabOrder = 0
      OnClick = UcWBtn_OKClick
      ExplicitLeft = 265
    end
    object UcWBtn_Cancel: TUcWinButton
      Left = 322
      Top = 1
      Width = 100
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      CaptionEx.Strings = (
        #1054#1090#1084#1077#1085#1080#1090#1100)
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      Images.PosCenter = True
      TabOrder = 1
      ExplicitLeft = 371
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 425
    Height = 387
    ActivePage = TabSheet_Additional
    Align = alClient
    TabOrder = 1
    object TabSheet_General: TTabSheet
      Caption = #1054#1073#1097#1080#1077
      DesignSize = (
        417
        359)
      object GroupBox2: TGroupBox
        Left = 3
        Top = 1
        Width = 408
        Height = 80
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1079#1072#1087#1091#1089#1082#1072
        TabOrder = 0
        DesignSize = (
          408
          80)
        object ChBox_Autorun: TCheckBox
          Left = 10
          Top = 16
          Width = 390
          Height = 17
          Hint = 
            #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1073#1091#1076#1077#1090' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1079#1072#1087#1091#1089#1082#1072#1090#1100#1089#1103' '#1087#1088#1080' '#1074#1082#1083#1102#1095#1077#1085#1080#1080' '#1082#1086#1084#1087#1100#1102#1090#1077 +
            #1088#1072
          Anchors = [akLeft, akTop, akRight]
          Caption = #1040#1074#1090#1086' '#1079#1072#1087#1091#1089#1082' '#1087#1088#1080' '#1089#1090#1072#1088#1090#1077' Windows'
          TabOrder = 0
        end
        object ChBox_StartMinimized: TCheckBox
          Left = 10
          Top = 56
          Width = 390
          Height = 17
          Hint = 
            #1055#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1101#1090#1086#1081' '#1086#1087#1094#1080#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1073#1091#1076#1077#1090' '#1079#1072#1087#1091#1089#1082#1072#1090#1100#1089#1103' '#1074' '#1089#1074#1077#1088#1085#1091#1090#1086#1084' '#1074#1080 +
            #1076#1077
          Anchors = [akLeft, akTop, akRight]
          Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1089#1074#1077#1088#1085#1091#1090#1099#1084
          TabOrder = 1
        end
        object ChBox_AutorunUSB: TCheckBox
          Left = 10
          Top = 36
          Width = 390
          Height = 17
          Hint = 
            #1055#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1086#1087#1094#1080#1080' '#1089#1086#1079#1076#1072#1077#1090#1089#1103' '#1092#1072#1081#1083' "Autorun.inf"'#13#10#13#10#1069#1090#1072' '#1086#1087#1094#1080#1103' '#1072#1082#1090#1091#1072 +
            #1083#1100#1085#1072' '#1074' '#1089#1083#1091#1095#1072#1077', '#1077#1089#1083#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#13#10#1088#1072#1079#1084#1077#1097#1077#1085#1072' '#1085#1072' '#1092#1083#1077#1096#1082#1077' '#1080#1083#1080' '#1076#1088#1091#1075#1086#1084' '#1074 +
            #1085#1077#1096#1085#1077#1084' '#13#10#1085#1086#1089#1080#1090#1077#1083#1077' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
          Anchors = [akLeft, akTop, akRight]
          Caption = 
            #1040#1074#1090#1086' '#1079#1072#1087#1091#1089#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1087#1088#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1080' '#1089#1098#1077#1084#1085#1086#1075#1086' '#1076#1080#1089#1082#1072' '#1082' '#1082#1086#1084#1087#1100#1102#1090#1077#1088 +
            #1091
          TabOrder = 2
        end
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 230
        Width = 408
        Height = 50
        Anchors = [akLeft, akTop, akRight]
        Caption = #1043#1086#1088#1103#1095#1072#1103' '#1082#1083#1072#1074#1080#1096#1072' '#1074#1099#1079#1086#1074#1072' '#1086#1082#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        TabOrder = 1
        DesignSize = (
          408
          50)
        object HotKey: THotKey
          Left = 10
          Top = 20
          Width = 80
          Height = 19
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          HotKey = 32833
          TabOrder = 0
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 95
        Width = 408
        Height = 122
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1077#1078#1080#1084#1072' '#1088#1072#1073#1086#1090#1099
        TabOrder = 2
        DesignSize = (
          408
          122)
        object ChBox_AutoMinimeze: TCheckBox
          Left = 10
          Top = 56
          Width = 390
          Height = 17
          Hint = 
            #1055#1086#1089#1077' '#1079#1072#1087#1091#1089#1082#1072' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1087#1088#1086#1075#1088#1072#1084#1084', '#13#10'Linker '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089#1074#1077#1088#1085#1077#1090#1089 +
            #1103' '#1074' '#1090#1088#1077#1081
          Anchors = [akLeft, akTop, akRight]
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1057#1042#1054#1056#1040#1063#1048#1042#1040#1058#1068' Linker '#1087#1086#1089#1083#1077' '#1079#1072#1087#1091#1089#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084
          TabOrder = 2
          OnClick = ChBox_AutoMinimezeClick
        end
        object ChBox_MinimizeOnClose: TCheckBox
          Left = 10
          Top = 16
          Width = 390
          Height = 19
          Hint = 
            #1055#1088#1086#1075#1088#1072#1084#1084#1091' '#1084#1086#1078#1085#1086' '#1073#1091#1076#1077#1090' '#1079#1072#1082#1088#1099#1090#1100' '#1074#1099#1073#1088#1072#1074' '#1086#1087#1094#1080#1102' "'#1079#1072#1082#1088#1099#1090#1100'" '#1080#1079' '#1084#1077#1085#1102' '#1074' '#1090 +
            #1088#1077#1077' '#13#10'('#1086#1090#1082#1088#1099#1074#1072#1077#1090#1089#1103' '#1097#1077#1083#1095#1082#1086#1084' '#1087#1088#1072#1074#1086#1081' '#1082#1083#1072#1074#1080#1096#1080' '#1084#1099#1096#1080')'
          Anchors = [akLeft, akTop, akRight]
          Caption = #1055#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' '#1085#1072' '#1082#1085#1086#1087#1082#1091' "'#1079#1072#1082#1088#1099#1090#1100'" '#1089#1082#1088#1099#1074#1072#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1074' '#1090#1088#1077#1081
          TabOrder = 0
          WordWrap = True
          OnClick = ChBox_MinimizeOnCloseClick
        end
        object ChBox_SaveStateAppList: TCheckBox
          Left = 10
          Top = 76
          Width = 390
          Height = 19
          Hint = 
            #1055#1088#1080' '#1074#1082#1083#1102#1095#1077#1085#1080#1080' '#1101#1090#1086#1081' '#1086#1087#1094#1080#1080' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089#1086#1093#1088#1072#1085#1103#1077#1090#1089#1103':'#13#10'1. '#1042#1099#1076#1077#1083#1077#1085#1085 +
            #1099#1077' '#1101#1083#1077#1084#1077#1085#1090#1099' '#1089#1087#1080#1089#1082#1072#13#10'2. '#1058#1077#1082#1091#1097#1080#1081' '#1101#1083#1077#1084#1077#1085#1090' '#1089#1087#1080#1089#1082#1072#13#10'3. '#1056#1072#1089#1082#1088#1099#1090#1099#1077' '#1075#1088#1091#1087 +
            #1087#1099
          Anchors = [akLeft, akTop, akRight]
          Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1089#1086#1089#1090#1086#1103#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084' '#1087#1088#1080' '#1079#1072#1082#1088#1099#1090#1080#1080
          TabOrder = 1
          WordWrap = True
        end
        object ChBox_AutoClose: TCheckBox
          Left = 10
          Top = 36
          Width = 390
          Height = 17
          Hint = 
            #1055#1086#1089#1077' '#1079#1072#1087#1091#1089#1082#1072' '#1074#1099#1073#1088#1072#1085#1085#1099#1093' '#1087#1088#1086#1075#1088#1072#1084#1084', '#13#10'Linker '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1079#1072#1074#1077#1088#1096#1080#1090 +
            ' '#1089#1074#1086#1102' '#1088#1072#1073#1086#1090#1091
          Anchors = [akLeft, akTop, akRight]
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1047#1040#1050#1056#1067#1042#1040#1058#1068' Linker '#1087#1086#1089#1083#1077' '#1079#1072#1087#1091#1089#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084
          TabOrder = 3
          OnClick = ChBox_AutoCloseClick
        end
        object ChBox_StayOnTop: TCheckBox
          Left = 10
          Top = 96
          Width = 390
          Height = 19
          Anchors = [akLeft, akTop, akRight]
          Caption = #1055#1086#1074#1077#1088#1093' '#1086#1089#1090#1072#1083#1100#1085#1099#1093' '#1086#1082#1086#1085
          TabOrder = 4
          WordWrap = True
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 293
        Width = 403
        Height = 45
        Hint = 
          #1069#1090#1086#1090' '#1082#1072#1090#1072#1083#1086#1075' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1090#1089#1103' '#1087#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1080' '#1074#1099#1073#1086#1088#1077' '#1086#1087#1094#1080 +
          #1080#13#10'"'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1072#1087#1082#1091' '#1089' '#1087#1088#1086#1075#1088#1072#1084#1084#1086#1081' '#1074' '#1086#1073#1097#1080#1081' '#1082#1072#1090#1072#1083#1086#1075'"'
        Caption = #1050#1072#1090#1072#1083#1086#1075' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1087#1088#1086#1075#1088#1072#1084#1084' ('#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102')'
        TabOrder = 3
        DesignSize = (
          403
          45)
        object BtndEd_AppsPath: TButtonedEdit
          Left = 10
          Top = 16
          Width = 385
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Images = DM.ImgList_Buttons
          RightButton.HotImageIndex = 23
          RightButton.ImageIndex = 3
          RightButton.PressedImageIndex = 24
          RightButton.Visible = True
          TabOrder = 0
          OnRightButtonClick = BtndEd_AppsPathRightButtonClick
        end
      end
    end
    object TabSheet_Additional: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1086#1087#1094#1080#1080
      ImageIndex = 3
      DesignSize = (
        417
        359)
      object ChBox_SkipCorruptedLinks: TCheckBox
        Left = 8
        Top = 32
        Width = 399
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        Caption = #1057#1082#1088#1099#1074#1072#1090#1100' '#1089#1089#1099#1083#1082#1080' '#1085#1072' '#1085#1077' '#1085#1072#1081#1076#1077#1085#1085#1099#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        TabOrder = 0
        WordWrap = True
        OnClick = ChBox_SkipCorruptedLinksClick
      end
      object ChBox_AutoCollapseGroups: TCheckBox
        Left = 8
        Top = 12
        Width = 399
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1089#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1075#1088#1091#1087#1087#1099' '#1087#1088#1086#1075#1088#1072#1084#1084' '#1087#1088#1080' '#1088#1072#1089#1082#1088#1099#1090#1080#1080' '#1085#1086#1074#1099#1093
        TabOrder = 1
        WordWrap = True
      end
      object ChBox_NumberOfStarts: TCheckBox
        Left = 8
        Top = 52
        Width = 399
        Height = 19
        Hint = 
          #1055#1088#1080' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1080' '#1101#1090#1086#1081' '#1086#1087#1094#1080#1080' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1079#1072#1087#1091#1089#1082#1086#1074' '#1087#1088#1086#1075#1088#1072#1084#1084' '#1085#1077' '#1073#1091#1076#1077#1090' ' +
          #1089#1086#1093#1088#1072#1085#1103#1090#1100#1089#1103'.'#13#10#1055#1088#1080' '#1087#1088#1086#1089#1084#1086#1090#1088#1077' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080' '#1073#1091#1076#1077#1090' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1072' '#1080#1085#1092#1086#1088#1084 +
          #1072#1094#1080#1103' '#1085#1072#1082#1086#1087#1083#1077#1085#1085#1072#1103' '#1089' '#1084#1086#1084#1077#1085#1090#1072' '#1079#1072#1087#1091#1089#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'.'
        Anchors = [akLeft, akTop, akRight]
        Caption = #1042#1077#1089#1090#1080' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091' '#1079#1072#1087#1091#1089#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084' ('#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1087#1086#1087#1091#1083#1103#1088#1085#1086#1089#1090#1080')'
        TabOrder = 2
        WordWrap = True
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 92
        Width = 394
        Height = 74
        Caption = #1040#1074#1090#1086#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        TabOrder = 3
        DesignSize = (
          394
          74)
        object UcLbl_TitleUpdateDate: TUcLabel
          Left = 9
          Top = 41
          Width = 129
          Height = 26
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1057#1083#1077#1076#1091#1102#1097#1077#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1086' '#1085#1072':'
          WordWrap = True
          Version = '13.02.2014'
          WebLink = 'http://optitrex.ru'
        end
        object UcLbl_UpdateDate: TUcLabel
          Left = 147
          Top = 48
          Width = 89
          Height = 13
          Caption = 'UcLbl_UpdateDate'
          Version = '13.02.2014'
          WebLink = 'http://optitrex.ru'
        end
        object ChBox_AutoUpdate: TCheckBox
          Left = 9
          Top = 16
          Width = 374
          Height = 19
          Hint = 
            #1055#1088#1080' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1080' '#1101#1090#1086#1081' '#1086#1087#1094#1080#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1077#1088#1077#1089#1090#1072#1085#1077#1090' '#1087#1088#1086#1074#1077#1088#1103#1090#1100' '#1085#1072#1083#1080#1095#1080#1077 +
            ' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081' '#1074' '#1089#1077#1090#1080' '#1080#1085#1090#1077#1088#1085#1077#1090'.'#13#10#1044#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1081' '#1074#1086#1089#1087#1086#1083#1100#1079#1091#1081 +
            #1090#1077#1089#1100' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1077#1081' '#1092#1091#1085#1082#1094#1080#1077#1081' '#1080#1079' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1084#1077#1085#1102'.'
          Anchors = [akLeft, akTop, akRight]
          Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1072#1074#1090#1086' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1089' '#1089#1072#1081#1090#1072' optitrex.ru'
          TabOrder = 0
          WordWrap = True
          OnClick = ChBox_AutoUpdateClick
        end
        object UcWBtn_ResetUpdateDate: TUcWinButton
          Left = 328
          Top = 41
          Width = 55
          Height = 26
          Caption = #1089#1073#1088#1086#1089
          CaptionEx.Strings = (
            #1089#1073#1088#1086#1089)
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Images.PosCenter = True
          TabOrder = 1
          OnClick = UcWBtn_ResetUpdateDateClick
        end
      end
      object ChBox_MouseHinting: TCheckBox
        Left = 8
        Top = 72
        Width = 399
        Height = 19
        Hint = 
          #1055#1088#1080' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1080' '#1101#1090#1086#1081' '#1086#1087#1094#1080#1080' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1072' '#1079#1072#1087#1091#1089#1082#1086#1074' '#1087#1088#1086#1075#1088#1072#1084#1084' '#1085#1077' '#1073#1091#1076#1077#1090' ' +
          #1089#1086#1093#1088#1072#1085#1103#1090#1100#1089#1103'.'#13#10#1055#1088#1080' '#1087#1088#1086#1089#1084#1086#1090#1088#1077' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1080' '#1073#1091#1076#1077#1090' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1072' '#1080#1085#1092#1086#1088#1084 +
          #1072#1094#1080#1103' '#1085#1072#1082#1086#1087#1083#1077#1085#1085#1072#1103' '#1089' '#1084#1086#1084#1077#1085#1090#1072' '#1079#1072#1087#1091#1089#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'.'
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1086#1076#1089#1082#1072#1079#1082#1080' '#1089#1088#1072#1079#1091' '#1087#1088#1080' '#1085#1072#1074#1077#1076#1077#1085#1080#1080' '#1084#1099#1096#1082#1080
        TabOrder = 4
        WordWrap = True
      end
    end
    object TabSheet_Styles: TTabSheet
      Caption = #1057#1090#1080#1083#1080' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
      ImageIndex = 1
      DesignSize = (
        417
        359)
      object Bevel1: TBevel
        Left = 3
        Top = 100
        Width = 395
        Height = 4
        Shape = bsTopLine
      end
      object Bevel2: TBevel
        Left = 3
        Top = 38
        Width = 395
        Height = 4
        Shape = bsTopLine
      end
      object ChBox_ClassicAppList: TCheckBox
        Left = 3
        Top = 13
        Width = 400
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1082#1083#1072#1089#1089#1080#1095#1077#1089#1082#1080#1081' '#1089#1090#1080#1083#1100' '#1089#1087#1080#1089#1082#1072
        TabOrder = 0
        OnClick = ChBox_ClassicAppListClick
      end
      inline Frm_ColorCurGroup: TFrameColorEdit
        Left = 3
        Top = 178
        Width = 182
        Height = 32
        TabOrder = 1
        ExplicitLeft = 3
        ExplicitTop = 178
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090' '#1092#1086#1085#1072#13#10#1090#1077#1082#1091#1097#1077#1081' '#1075#1088#1091#1087#1087#1099
          CaptionEx.Strings = (
            #1062#1074#1077#1090' '#1092#1086#1085#1072
            #1090#1077#1082#1091#1097#1077#1081' '#1075#1088#1091#1087#1087#1099)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 144
        end
      end
      inline Frm_ColorGroup: TFrameColorEdit
        Left = 3
        Top = 138
        Width = 182
        Height = 32
        TabOrder = 2
        ExplicitLeft = 3
        ExplicitTop = 138
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090' '#1075#1088#1091#1087#1087#1099
          CaptionEx.Strings = (
            #1062#1074#1077#1090' '#1075#1088#1091#1087#1087#1099)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 323
        end
      end
      inline Frm_ColorItem: TFrameColorEdit
        Left = 3
        Top = 298
        Width = 182
        Height = 32
        Anchors = [akTop, akRight]
        TabOrder = 3
        ExplicitLeft = 3
        ExplicitTop = 298
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090' '#1101#1083#1077#1084#1077#1085#1090#1072
          CaptionEx.Strings = (
            #1062#1074#1077#1090' '#1101#1083#1077#1084#1077#1085#1090#1072)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 323
        end
      end
      inline Frm_ColorCurItem: TFrameColorEdit
        Left = 221
        Top = 138
        Width = 182
        Height = 32
        Anchors = [akTop, akRight]
        TabOrder = 4
        ExplicitLeft = 221
        ExplicitTop = 138
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090#13#10#1090#1077#1082#1091#1097#1077#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072
          CaptionEx.Strings = (
            #1062#1074#1077#1090
            #1090#1077#1082#1091#1097#1077#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 139
        end
      end
      inline Frm_ColorGroupText: TFrameColorEdit
        Left = 3
        Top = 218
        Width = 182
        Height = 32
        TabOrder = 7
        ExplicitLeft = 3
        ExplicitTop = 218
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1075#1088#1091#1087#1087#1099
          CaptionEx.Strings = (
            #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1075#1088#1091#1087#1087#1099)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 144
        end
      end
      inline Frm_ColorBorder: TFrameColorEdit
        Left = 221
        Top = 178
        Width = 182
        Height = 32
        TabOrder = 8
        ExplicitLeft = 221
        ExplicitTop = 178
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090' '#1088#1072#1084#1082#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072
          CaptionEx.Strings = (
            #1062#1074#1077#1090' '#1088#1072#1084#1082#1080' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 144
        end
      end
      inline Frm_ColorLinkTextErr: TFrameColorEdit
        Left = 221
        Top = 218
        Width = 182
        Height = 32
        Anchors = [akTop, akRight]
        TabOrder = 6
        ExplicitLeft = 221
        ExplicitTop = 218
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1085#1077#13#10#1085#1072#1081#1076#1077#1085#1085#1086#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          CaptionEx.Strings = (
            #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1085#1077
            #1085#1072#1081#1076#1077#1085#1085#1086#1081' '#1087#1088#1086#1075#1088#1072#1084#1084#1099)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 144
        end
      end
      inline Frm_ColorLinkText: TFrameColorEdit
        Left = 3
        Top = 258
        Width = 182
        Height = 32
        Anchors = [akTop, akRight]
        TabOrder = 5
        ExplicitLeft = 3
        ExplicitTop = 258
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
          CaptionEx.Strings = (
            #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 144
        end
      end
      object ChBox_ShowBorder: TCheckBox
        Left = 3
        Top = 110
        Width = 400
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1088#1072#1084#1082#1091' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1074#1099#1076#1077#1083#1077#1085#1085#1086#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072
        TabOrder = 9
        OnClick = ChBox_ShowBorderClick
      end
      object ChBox_AlphaBlend: TCheckBox
        Left = 3
        Top = 49
        Width = 400
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1088#1086#1079#1088#1072#1095#1085#1086#1089#1090#1100' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1086#1082#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
        TabOrder = 10
        OnClick = ChBox_AlphaBlendClick
      end
      object TrackBar_AlphaBlendValue: TTrackBar
        Left = 3
        Top = 67
        Width = 400
        Height = 23
        Align = alCustom
        Anchors = [akLeft, akTop, akRight]
        Max = 255
        Min = 50
        Position = 55
        TabOrder = 11
        TickMarks = tmBoth
        TickStyle = tsNone
      end
      inline Frm_ColorCurItemText: TFrameColorEdit
        Left = 221
        Top = 258
        Width = 182
        Height = 32
        Anchors = [akTop, akRight]
        TabOrder = 12
        ExplicitLeft = 221
        ExplicitTop = 258
        ExplicitWidth = 182
        inherited UcWBtn_Color: TUcWinButton
          Width = 144
          Caption = #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072#13#10#1090#1077#1082#1091#1097#1077#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072
          CaptionEx.Strings = (
            #1062#1074#1077#1090' '#1090#1077#1082#1089#1090#1072
            #1090#1077#1082#1091#1097#1077#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072)
          CaptionPositions.WordWrap = True
          ExplicitWidth = 323
        end
      end
    end
    object TabSheet_Help: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 2
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 417
        Height = 359
        Align = alClient
        BorderStyle = bsNone
        Lines.Strings = (
          '(1)'
          
            #1055#1088#1080' '#1085#1072#1073#1086#1088#1077' '#1090#1077#1082#1089#1090#1072' '#1074' '#1075#1083#1072#1074#1085#1086#1084' '#1086#1082#1085#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099', '#1076#1077#1088#1077#1074#1086' '#1089#1087#1080#1089#1082#1072' '#1087#1088#1086#1075#1088#1072 +
            #1084#1084' '
          
            #1086#1090#1092#1080#1083#1100#1090#1088#1086#1074#1099#1074#1072#1077#1090#1089#1103' '#1086#1089#1090#1072#1074#1083#1103#1103' '#1090#1086#1083#1100#1082#1086' '#1090#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099', '#1082#1086#1090#1086#1088#1099#1077' '#1089#1086#1076#1077#1078#1072#1090' ' +
            #1074' '
          #1089#1074#1086#1077#1084' '#1085#1072#1079#1074#1072#1085#1080#1080' '#1085#1072#1073#1088#1072#1085#1085#1099#1081' '#1090#1077#1082#1089#1090'.'
          ''
          '(2)'
          #1082#1085#1086#1087#1082#1072' Esc - '#1086#1090#1084#1077#1085#1103#1077#1090' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1102'/'#1089#1074#1086#1088#1072#1095#1080#1074#1072#1077#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1074' '#1090#1088#1077#1081
          ''
          '(3)'
          
            'Ctrl+I - '#1048#1085#1092#1086'. '#1091#1079#1083#1072'. '#1040#1085#1072#1083#1086#1075#1080#1095#1085#1086' '#1097#1077#1083#1095#1082#1091' '#1084#1099#1096#1100#1102' '#1087#1086' '#1082#1085#1086#1087#1082#1077' '#1089#1086' '#1079#1085#1072#1095#1082#1086 +
            #1084' (i).'
          
            '             '#1050#1085#1086#1087#1082#1072' (i) '#1087#1086#1103#1074#1083#1103#1077#1090#1089#1103' '#1087#1088#1080' '#1085#1072#1074#1077#1076#1077#1085#1080#1080' '#1084#1099#1096#1080' '#1074' '#1087#1088#1072#1074#1091#1102' '#1075 +
            #1088#1072#1085#1080#1094#1091' '#1079#1072#1087#1080#1089#1080' '
          '             '#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'.')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
end
