object FrameColorEdit: TFrameColorEdit
  Left = 0
  Top = 0
  Width = 222
  Height = 32
  TabOrder = 0
  DesignSize = (
    222
    32)
  object Shp_Color: TShape
    Left = 0
    Top = 0
    Width = 32
    Height = 32
    Anchors = [akLeft, akTop, akBottom]
  end
  object UcWBtn_Color: TUcWinButton
    Left = 38
    Top = 0
    Width = 184
    Height = 32
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090
    CaptionEx.Strings = (
      #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090)
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Images.IndexImgUp = 34
    Images.PosCenter = False
    Images.PosLeft = 0
    Images.PosTop = 0
    ParentFont = False
    TabOrder = 0
    OnClick = UcWBtn_ColorClick
  end
end
