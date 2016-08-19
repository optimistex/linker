object fEditLink: TfEditLink
  Left = 475
  Top = 162
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'fEditLink'
  ClientHeight = 384
  ClientWidth = 452
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 235
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TUcLabel
      Left = 40
      Top = 120
      Width = 26
      Height = 13
      Caption = #1054#1082#1085#1086
      Version = '13.02.2014'
      WebLink = 'http://optitrex.ru'
    end
    object Label2: TUcLabel
      Left = 17
      Top = 144
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
      Version = '13.02.2014'
      WebLink = 'http://optitrex.ru'
    end
    object cbShowCmd: TComboBox
      Left = 70
      Top = 116
      Width = 321
      Height = 22
      Hint = #1042#1080#1076' '#1086#1082#1085#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1087#1088#1080' '#1086#1090#1082#1088#1099#1090#1080#1080
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 7
      Text = #1054#1073#1099#1095#1085#1099#1081' '#1088#1072#1079#1084#1077#1088' '#1086#1082#1085#1072
      Items.Strings = (
        #1054#1073#1099#1095#1085#1099#1081' '#1088#1072#1079#1084#1077#1088' '#1086#1082#1085#1072
        #1057#1074#1077#1088#1085#1091#1090#1086#1077' '#1074' '#1079#1085#1072#1095#1086#1082
        #1056#1072#1079#1074#1077#1088#1085#1091#1090#1086#1077' '#1085#1072' '#1074#1077#1089#1100' '#1101#1082#1088#1072#1085)
    end
    object edIcon: TLabeledEdit
      Left = 70
      Top = 35
      Width = 321
      Height = 22
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1082#1086#1085#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 3
      OnMouseEnter = edIconMouseEnter
    end
    object edParameters: TLabeledEdit
      Left = 70
      Top = 89
      Width = 321
      Height = 22
      Hint = #1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1086#1084#1072#1085#1076#1085#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1079#1072#1087#1091#1089#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 6
    end
    object LbEd_FileName: TLabeledEdit
      Left = 70
      Top = 62
      Width = 321
      Height = 22
      Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1077#1084#1086#1077' '#1080#1084#1103' '#1101#1083#1077#1084#1077#1085#1090#1072
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 5
    end
    object LbEd_FilePath: TLabeledEdit
      Left = 69
      Top = 7
      Width = 321
      Height = 22
      Hint = 
        #1055#1091#1090#1100' '#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1077#13#10'd:\folder1\folder2\example.exe'#13#10'..\..\folder2\' +
        'example.exe'#13#10'notepad'#13#10'notepad.exe'#13#10#13#10#1055#1091#1090#1100' '#1082' '#1087#1072#1087#1082#1077':'#13#10'd:\folder1\f' +
        'older2'#13#10'..\..\folder2'#13#10'%temp%'#13#10
      EditLabel.Width = 38
      EditLabel.Height = 13
      EditLabel.Caption = #1057#1089#1099#1083#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 0
    end
    object mmNote: TMemo
      Left = 70
      Top = 144
      Width = 321
      Height = 57
      Hint = 
        #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080' '#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'.'#13#10#1044#1083#1103' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1103', '#1095#1090#1086' '#1076#1077#1083#1072#1077#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1072'.' +
        #13#10'Ctrl+Enter - '#1087#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1085#1086#1074#1091#1102' '#1089#1090#1088#1086#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 8
      OnKeyDown = mmNoteKeyDown
    end
    object UniBtn_Open: TUcWinButton
      Left = 396
      Top = 8
      Width = 22
      Height = 22
      Action = actOpen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      BtnImages = DM.ImgList_Buttons
      Images.IndexImgUp = 3
      Images.PosCenter = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object UniBtn_OpenIcon: TUcWinButton
      Left = 396
      Top = 35
      Width = 22
      Height = 22
      Action = actOpenIcon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      BtnImages = DM.ImgList_Buttons
      Images.IndexImgUp = 3
      Images.PosCenter = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object UniBtn_RelPath: TUcWinButton
      Left = 420
      Top = 8
      Width = 22
      Height = 22
      Hint = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1091#1090#1100
      AllowAllUp = True
      ButtonStyle = bsImaged
      Down = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Flat = True
      GroupIndex = 1
      BtnImages = DM.ImgList_Buttons
      Images.IndexImgUp = 4
      Images.PosCenter = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = UniBtn_RelPathClick
    end
    object chbRunAsAdmin: TCheckBox
      Left = 70
      Top = 207
      Width = 321
      Height = 17
      Hint = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1101#1090#1091' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1086#1090' '#1080#1084#1077#1085#1080' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
      Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1086#1090' '#1080#1084#1077#1085#1080' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 235
    Width = 452
    Height = 108
    Align = alTop
    BevelEdges = [beTop, beBottom]
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    object btnSelectFromFolder: TUcWinButton
      Left = 397
      Top = 47
      Width = 22
      Height = 22
      Action = actSelectFromFolder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      BtnImages = DM.ImgList_Buttons
      Images.IndexImgUp = 3
      Images.PosCenter = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object btnSelectToFolder: TUcWinButton
      Left = 397
      Top = 77
      Width = 22
      Height = 22
      Action = actSelectToFolder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      BtnImages = DM.ImgList_Buttons
      Images.IndexImgUp = 3
      Images.PosCenter = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object chbCopy: TCheckBox
      Left = 32
      Top = 2
      Width = 289
      Height = 17
      Hint = 
        #1041#1091#1076#1077#1090' '#1089#1082#1086#1087#1080#1088#1086#1074#1072#1085#1072' '#1091#1082#1072#1079#1072#1085#1085#1072#1103' '#1087#1072#1087#1082#1072' '#1089#1086' '#1074#1089#1077#1084' '#1077#1077' '#1089#1086#1076#1077#1088#1078#1080#1084#1099#1084#13#10#1055#1091#1090#1080' '#1082' ' +
        #1087#1088#1086#1075#1088#1072#1084#1084#1077' '#1080' '#1080#1082#1086#1085#1082#1077' '#1073#1091#1076#1091#1090' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1087#1077#1088#1077#1085#1072#1079#1085#1072#1095#1077#1085#1099
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1072#1087#1082#1091' '#1089' '#1087#1088#1086#1075#1088#1072#1084#1084#1086#1081' '#1074' '#1086#1073#1097#1080#1081' '#1082#1072#1090#1072#1083#1086#1075
      TabOrder = 0
      OnClick = chbCopyClick
    end
    object edFromFolder: TLabeledEdit
      Left = 70
      Top = 47
      Width = 321
      Height = 22
      Hint = #1055#1072#1087#1082#1072' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1082#1086#1090#1086#1088#1091#1102' '#1085#1091#1078#1085#1086' '#1089#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Color = clBtnFace
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1079' '#1087#1072#1087#1082#1080
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 1
    end
    object edToFolder: TLabeledEdit
      Left = 70
      Top = 77
      Width = 321
      Height = 22
      Hint = #1053#1086#1074#1086#1077' '#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1087#1072#1087#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Color = clBtnFace
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = #1042' '#1087#1072#1087#1082#1091
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 3
    end
    object chbAutoDeleteSrc: TCheckBox
      Left = 70
      Top = 24
      Width = 152
      Height = 17
      Hint = #1055#1086#1079#1074#1086#1083#1103#1077#1090' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1091#1076#1072#1083#1080#1090#1100' '#1080#1089#1093#1086#1076#1085#1091#1102' '#1087#1072#1087#1082#1091' '#1087#1086#1089#1083#1077' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1093#1086#1076#1085#1091#1102' '#1087#1072#1087#1082#1091
      TabOrder = 5
      OnClick = chbAutoDeleteSrcClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 343
    Width = 452
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object UcWBtn_Cancel: TUcWinButton
      Left = 270
      Top = 4
      Width = 105
      Height = 33
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      CaptionEx.Strings = (
        #1054#1090#1084#1077#1085#1072)
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      Images.PosCenter = True
      TabOrder = 1
    end
    object UcWBtn_Ok: TUcWinButton
      Left = 79
      Top = 4
      Width = 105
      Height = 33
      Action = actCommit
      Caption = 'OK'
      CaptionEx.Strings = (
        'OK')
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      Default = True
      Images.PosCenter = True
      TabOrder = 0
    end
  end
  object OpenDialog: TOpenDialog
    Filter = #1055#1088#1080#1083#1086#1078#1077#1085#1080#1103'|*.exe|'#1042#1089#1077' '#1060#1072#1081#1083#1099'|*.*'
    Options = [ofHideReadOnly, ofNoChangeDir, ofEnableSizing]
    Left = 408
    Top = 88
  end
  object ActionList1: TActionList
    Left = 408
    Top = 144
    object actCommit: TAction
      Caption = 'OK'
      OnExecute = actCommitExecute
    end
    object actOpen: TAction
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 3
      OnExecute = actOpenExecute
    end
    object actOpenIcon: TAction
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1080#1082#1086#1085#1082#1091
      ImageIndex = 3
      OnExecute = actOpenIconExecute
    end
    object actRelPath: TAction
      Enabled = False
      Hint = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1091#1090#1100
      ImageIndex = 4
    end
    object actSelectFromFolder: TAction
      Enabled = False
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1072#1087#1082#1091' - '#1080#1089#1090#1086#1095#1085#1080#1082
      ImageIndex = 3
      OnExecute = actSelectFromFolderExecute
    end
    object actSelectToFolder: TAction
      Enabled = False
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1087#1072#1087#1082#1091' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
      ImageIndex = 3
      OnExecute = actSelectToFolderExecute
    end
  end
end
