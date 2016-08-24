object fMainLinker: TfMainLinker
  Left = 594
  Top = 257
  AlphaBlendValue = 240
  Caption = '2'
  ClientHeight = 351
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ScreenSnap = True
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object VST: TVirtualStringTree
    Left = 0
    Top = 22
    Width = 261
    Height = 329
    Align = alClient
    ClipboardFormats.Strings = (
      'Plain text'
      'Virtual Tree Data')
    Color = 16645629
    DefaultNodeHeight = 36
    Header.AutoSizeIndex = -1
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.Options = [hoAutoResize, hoColumnResize, hoDrag]
    HintMode = hmHint
    Images = DM.PngImgLst_Tree
    IncrementalSearchStart = ssAlwaysStartOver
    Indent = 12
    Margin = 0
    PopupMenu = PopupMenu
    TabOrder = 0
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoTristateTracking]
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toVariableNodeHeight]
    TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages, toAlwaysHideSelection]
    TreeOptions.SelectionOptions = [toFullRowSelect, toMultiSelect, toRightClickSelect]
    OnAfterCellPaint = VSTAfterCellPaint
    OnBeforeCellPaint = VSTBeforeCellPaint
    OnClick = VSTClick
    OnCollapsed = VSTExpanded
    OnDblClick = VSTDblClick
    OnDragAllowed = VSTDragAllowed
    OnDragOver = VSTDragOver
    OnDragDrop = VSTDragDrop
    OnExpanded = VSTExpanded
    OnFocusChanged = VSTFocusChanged
    OnFreeNode = VSTFreeNode
    OnGetText = VSTGetText
    OnPaintText = VSTPaintText
    OnGetImageIndex = VSTGetImageIndex
    OnInitNode = VSTInitNode
    OnKeyPress = VSTKeyPress
    OnMeasureItem = VSTMeasureItem
    OnMouseMove = VSTMouseMove
    OnScroll = VSTScroll
    Columns = <
      item
        Margin = 0
        Position = 0
        Width = 257
      end>
  end
  object UcBtn_Info: TUcWinButton
    Left = 72
    Top = 88
    Width = 16
    Height = 16
    Action = actInfo
    ButtonStyle = bsImaged
    Caption = ' '
    CaptionEx.Strings = (
      ' ')
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ShowFocus = False
    Images.ImgUp.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
      001008060000001FF3FF61000003214944415478DA755369481461187EBE999D
      D5598F555B7359BB34D182CC2374B35685222C482AC40AA2286D232A097F6417
      74F7AB53B168BBE8A032A50BB4A092B5D6CADAB4B22C64EDA6BBD5DDD2DD7677
      66BEBE1444ACE6CFC77CF3BECF35EF4B28A518FC044DB3EB4CE942466A1C8D57
      28E4070ECED1F4C86797AD993F06D792810024EB4E4869B1766D696152F170AD
      601858D8FECDF76ADFD9B60396D39E72FAD024FF0520E4DC8B3EB423BEA63827
      26F7CFFB470FE091D8370284A90862C4BE86DD75EF2EACD9FE6E116D3279FA01
      48DA6DD5960DB11737178ECE7FE654F0D14BA0614D263DE057807B5F80804C31
      2A0C48D012AC3EF2D4526E4E5EDE0F30A2A86D5EC3DEA42AD72F8AF64E196210
      0F51C5216F24DFCB5AFB5A82CCC2E8F1299810C3B353A6D34A5EE43A2FA4DA08
      521AC8AA155175A573C7CEA8EFF08057F1E03802993205C304FCF4533CFE2A41
      4D2824A6424514648F12B1EEF0B3A3E7CB52CD04469B6EFB3A434B768A7EB8D5
      D10DC27308500EA2C061636E04C014AEBFD9053513A302CB842AC84B0C45B5F5
      4DCB9E8AEF5904131BE3B695E99B13464646DE68FF8910269F703CC28379EC98
      3EB4D742C995CFE059B32C2BF0F824CC4A8E80B5F943C7FECA4E2341A6CD605E
      12FAC094161B5BFBD48570915111823051C0BED9B1CC0A60AE7A0B16091406C0
      FC634E5A144E5EFFF4E46A4DD7648209B7D48649866B158BB553CED93BC1ECB3
      7E82080D0FCB82D1905878F38F75209853E09508C2050533C60FC1B283CE33EE
      D6AF0BFB7EE354FBCA9DAB232B054185134F54D06B7E214A2DA166F918B8BD12
      665ADE43C34B6C3682B18A897EF9E1077659DC05F476D6C53E800C5BB43679C8
      E5CAA5DA496DEF7B70AA3D1C418C316F980B5EBF0CEB171D38968139C58BE830
      012516F725DF4BD7426ACFEEE99F44626CCC884ED31DDF5A10348EE738B4BC76
      A3D529426040E37501A4C76BD1D5EDC3A66A5F63CFF3AE226A3739FEDE056363
      32F4A165B3B294FC8989A2365454B35B0A57B71FF52FA46F0D770335707AF630
      E657FF5CA6DE8B0C1B1B58928E103E131AF5082890E1F1BF81576E623E5AE9FD
      BE1DF82FC02030E1CFC91803FFABF90DD0FC5DF55A157F260000000049454E44
      AE426082}
    Images.ImgDown.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
      001008060000001FF3FF61000003324944415478DA75536B489361147EDEEFFB
      B6E6DA329B62A5951AD6A6A9D9B2B2A28B41646157BA99D90DC398A5FDC820FA
      D1AF20CA9ADDC8E842372A24B5C8EC2209166213571ADA74B56E1A66359BBA39
      B77DDFDB6B0389ACF7CF0B87F33CE739CF3987504AF1F793279D0FD6C68C499A
      307E641495A868FB60B7B63477D4892FB3BBFFCE257F1290D853C397AD4BDA6F
      D814B7233E62F858A5E08F3BBD80A9B5DB76FACAAB3355775F16D2965C710881
      90703624EFC0D262C3EA88F95D4EE04B2F03FA580201D48C285C0D28860147AE
      5AEE5C3CF1389336EF710D1290E813C2C69C45250777C4A7D5B7896877730810
      0852C2FC24351D804FA48854514C0EE5905F505BF4F0D0ACEC4182D1CB6FAF3F
      776CC5AD9F6E0A4B97C42A09089071C89E22C0DE0F5CB7F82049125CFD22F4A1
      3CDC6E0FDDBDB774BEA32AF319C1C402B23823B97C577A62EA53AB13BC8C07E1
      38882098132E478F87A2E1AB177242218A120448981BA5C4E13335175E1853B2
      087485C119BB179A9313C3C7555959E33C0F2FE5A090F338BF5C83B66E11F98F
      ED18C6510666ED52118B27A9515A6935DFBFFC3C9920E66464BA61417D548426
      E8494B0F940A8129E03142C1E3DA86307C72789153D6011E7E057DFD5EAC881B
      896AD3A7B715576A6612688D63E7AD9D6E9AAD1F1756FEBA0BAA00D96FEBD5EC
      2FDE16898F5D1E64DDFC0881032471C0071F56258E42C9A3D686C68AC6390493
      8ECB4312232AF664EA538A4D9D0CCC329907816C091EE4C4E0FD0F37D22FB642
      CEC21E9F0415E34F8DD7E06851ED8DDED62F9BFD63D49F3364EE4C3E2DC864A8
      68F80115032BE5022AF74DC5BBCE3E6C2C6A06B3043D2E2FD6CD0C85ADDD817B
      D74C6B6883A1C44FA03586A8A243CBF2B6EA67377D76A2BAC50E9EA9880D57A1
      CF23E2DD57179B09B0242118216A194E5DAA2BF5B4D937534B9E73701389AE30
      294837E6D29695BA291C33D1FCDE81CF4C3ECFA44F0856625A54207EF6BA71B5
      A4E9799FEDFB766AC9B50EBD055D611C34AA7CBD3E2C2D3E5A13A852CA599432
      A007E637DFBE3599DB8BE17015B0CAB67F1ED3EF80D6C8B69E4C83429801856C
      FCC0F4E0F67E40BFAF96F5D148DFE4BAFE7B8D434E556B940DFCACA2F77F39BF
      007F4F62F55B27DD3A0000000049454E44AE426082}
    Images.ImgHot.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000100000
      001008060000001FF3FF61000002FD4944415478DA7D5369485451183DF7BD79
      33CEE88C9A63B864A96845A86564A62D6A266A65D2461298508A59863F8AEC97
      6144F8238BC832212488443335220B92C16CC3126D2F4DB328B5D4D4CC9971B6
      F76E779E20A1D5FDF1B8CB39E79D6F239452CC5CDA0C8B3E6BCD97A8F0402E58
      A210DB3FD2EE2B2D416D8E06C5AF9958F2A70049B1BA5E2AF856989B1AB88F1D
      FD66607BCFD4755F385C36EF1C6D568BB304946956EF96B3D6DA98105D1CFEB3
      1A9FFFA8DB5CE8B687DE73314F0B9075264575C944FDAE589F34E7E5888542A3
      20502BA648463B6067B178AA887CBE78E753C5818D41FBA705128AFA77359FF0
      AF1619A86B548446C9C902733553847EA3048704986C1296E815B08B9446148C
      C6BD2FF37A48B066829C3F36DC98BF2928B5F5AB050A9E03C711302DACF0159C
      60BC187240E00007DBF38422D25785E355DD978B7787E610244DEA6B4F8E7724
      84E9039A7B8C201C070765F61963CB620DC01C56BD3641C903BCD30E9590BCD0
      0D550FFA3A724EE96308922D41D78BC7DA1705E83C9BBA26E0AAE299030E3A17
      1E19CBDCE5102A9E8E3132951D986D0EA48779A0E9F9604F5E897734C106B3DF
      E943FDCFE296FAF8DF7EF353268210E85806B35779C902A5CD83E09D6189124C
      56115B23E7E08AE1FBCBD24A9FD5040946657C8AF1EE854CB7F5D56D238C4BC0
      B0F0D0F02858EF278750D4D80F15476171B02613285223BC90516EBFF6EE8990
      3955C61DD2C11B8543654A81C7B5979465DF064FA588E2F405B283BC9A01B8F0
      1206CD0272A395E8199840F659DFEDF496503F259068F65E1C63BB79751F62DF
      F69950DDE902152324F89B316913F17848078EE5202B42845EABC4CE7275C3D0
      1B9A490D1AD3742792A4C9A8A8B5C6CA926D08E359293B3E8DE3DD88C0CAE7AC
      3DC5F260778C19ADC8AF717DF4B94DB1971AD4DDB3672169329C9BAF3E7A24FE
      435A74A8C65DAB16E07CFD69B4E17EA775B8DC1052CBE228657FEEFDEB30C917
      89662DFB2E8756B1126EC27C4810592F7F86C9D1CAE278459BD4E67F4EE3AC51
      4D645973F68E4163FF17E637D0264AF9379063D80000000049454E44AE426082}
    Images.PosCenter = True
    Images.Transparent = True
    ParentDoubleBuffered = False
    OnMouseLeave = UcBtn_InfoMouseLeave
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    OnEnter = UcBtn_InfoEnter
  end
  object SpTBXToolbar1: TSpTBXToolbar
    Left = 0
    Top = 0
    Width = 261
    Height = 22
    Align = alTop
    CloseButton = False
    FullSize = True
    Images = DM.ImgList_Buttons
    ProcessShortCuts = True
    ShrinkMode = tbsmWrap
    TabOrder = 1
    Caption = 'SpTBXToolbar1'
    Customizable = False
    MenuBar = True
    object SpTBXItem9: TSpTBXItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100'/'#1089#1082#1088#1099#1090#1100' '#1089#1089#1099#1083#1082#1080' '#1085#1072' '#1085#1077' '#1085#1072#1081#1076#1077#1085#1085#1099#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Action = ActShowCorruptedLinks
    end
    object SpTBXSubmenuItem2: TSpTBXSubmenuItem
      Caption = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Hint = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      ImageIndex = 7
      object SpTBXItem5: TSpTBXItem
        Action = actSaveTree
      end
      object SpTBXItem10: TSpTBXItem
        Action = actHelp
      end
      object SpTBXItem4: TSpTBXItem
        Action = actExpandAll
      end
      object SpTBXItem3: TSpTBXItem
        Action = actCollapseAll
      end
      object SpTBXItem16: TSpTBXItem
        Action = actShowStat
      end
      object SpTBXSeparatorItem2: TSpTBXSeparatorItem
      end
      object SpTBXItem12: TSpTBXItem
        Action = actCheckUpdate
      end
      object SpTBXItem13: TSpTBXItem
        Action = Act_LeaveDeveloper
      end
      object SpTBXItem11: TSpTBXItem
        Action = actAbout
      end
      object SpTBXItem8: TSpTBXItem
        Action = actExit
      end
    end
    object SpTBXItem14: TSpTBXItem
      Action = actOptions
    end
    object SpTBXRightAlignSpacerItem1: TSpTBXRightAlignSpacerItem
      CustomWidth = 20
    end
    object Sp_Add: TSpTBXSubmenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      object SpTBXItem6: TSpTBXItem
        Action = actAddLink
      end
      object SpTBXItem7: TSpTBXItem
        Action = actAddGroup
      end
      object SpTBXItem15: TSpTBXItem
        Action = actAddDivider
      end
    end
    object SpTBXItem2: TSpTBXItem
      Action = actEdit
    end
    object SpTBXItem1: TSpTBXItem
      Action = actDelete
    end
  end
  object PopupMenu: TPopupMenu
    Images = DM.ImgList_Buttons
    OnPopup = PopupMenuPopup
    Left = 154
    Top = 128
    object N1: TMenuItem
      Action = actOpen
      Default = True
    end
    object N_FindObject: TMenuItem
      Action = actFileLocation
    end
    object mnuRunAsAdmin: TMenuItem
      Action = actRunAsAdmin
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Action = actAddLink
    end
    object N6: TMenuItem
      Action = actAddGroup
    end
    object N10: TMenuItem
      Action = actAddDivider
    end
    object N11: TMenuItem
      Action = actClone
    end
    object N5: TMenuItem
      Action = actEdit
    end
    object N4: TMenuItem
      Action = actDelete
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuExpandAll: TMenuItem
      Action = actExpandAll
    end
    object mnuCollapseAll: TMenuItem
      Action = actCollapseAll
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = actShowProperties
    end
  end
  object ActionList: TActionList
    Images = DM.ImgList_Buttons
    Left = 154
    Top = 64
    object actAddGroup: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 18
      ShortCut = 16429
      OnExecute = actAddGroupExecute
    end
    object actAddLink: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      ImageIndex = 19
      ShortCut = 45
      OnExecute = actAddLinkExecute
    end
    object actAddDivider: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
      ImageIndex = 20
      ShortCut = 24621
      OnExecute = actAddDividerExecute
    end
    object actEdit: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 1
      ShortCut = 113
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      ShortCut = 8238
      OnExecute = actDeleteExecute
    end
    object actHelp: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 9
      ShortCut = 112
      OnExecute = actHelpExecute
    end
    object actSaveTree: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1102
      ImageIndex = 8
      ShortCut = 16467
      OnExecute = actSaveTreeExecute
    end
    object actExpandAll: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      ImageIndex = 10
      ShortCut = 16424
      OnExecute = actExpandAllExecute
    end
    object actCollapseAll: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      ImageIndex = 11
      ShortCut = 16422
      OnExecute = actCollapseAllExecute
    end
    object actInfo: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1048#1085#1092#1086'. '#1086#1073' '#1091#1079#1083#1077
      Hint = #1048#1085#1092#1086'. '#1086#1073' '#1091#1079#1083#1077
      ShortCut = 16457
      OnExecute = actInfoExecute
    end
    object actCheckUpdate: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
      ImageIndex = 17
      OnExecute = actCheckUpdateExecute
    end
    object actRunAsAdmin: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1047#1072#1087#1091#1089#1082' '#1086#1090' '#1080#1084#1077#1085#1080' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
      ImageIndex = 13
      ShortCut = 16397
      OnExecute = actRunAsAdminExecute
    end
    object actOpen: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnExecute = actOpenExecute
    end
    object Act_LeaveDeveloper: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1053#1072#1087#1080#1089#1072#1090#1100' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1091
      ImageIndex = 16
      OnExecute = Act_LeaveDeveloperExecute
    end
    object actOptions: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 15
      ShortCut = 120
      OnExecute = actOptionsExecute
    end
    object actAbout: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Hint = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      ImageIndex = 14
      ShortCut = 112
      OnExecute = actAboutExecute
    end
    object actFileLocation: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091' '#1089' '#1092#1072#1081#1083#1086#1084
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1087#1082#1091' '#1089' '#1092#1072#1081#1083#1086#1084
      ShortCut = 16460
      OnExecute = actFileLocationExecute
    end
    object actShowProperties: TAction
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1074#1086#1081#1089#1090#1074#1072
      ShortCut = 32781
      OnExecute = actShowPropertiesExecute
    end
    object actShowStat: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091
      ImageIndex = 21
      OnExecute = actShowStatExecute
    end
    object actExit: TAction
      Category = #1044#1086#1087'. '#1092#1091#1085#1082#1094#1080#1080
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 22
      ShortCut = 32856
      OnExecute = actExitExecute
    end
    object ActShowCorruptedLinks: TAction
      AutoCheck = True
      Caption = 'Act'
      ImageIndex = 26
      ShortCut = 16473
      OnExecute = ActShowCorruptedLinksExecute
    end
    object actClone: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1050#1083#1086#1085#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 27
      ShortCut = 16452
      OnExecute = actCloneExecute
    end
  end
end
