object FService: TFService
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FService'
  ClientHeight = 433
  ClientWidth = 588
  Color = clBtnFace
  CustomTitleBar.SystemButtons = False
  DockSite = True
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 28
  object Label1: TLabel
    Left = 16
    Top = 82
    Width = 51
    Height = 28
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 16
    Top = 116
    Width = 54
    Height = 28
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 16
    Top = 150
    Width = 54
    Height = 28
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 16
    Top = 183
    Width = 55
    Height = 28
    Caption = 'Label4'
  end
  object BShot: TButton
    Left = 440
    Top = 135
    Width = 121
    Height = 49
    Caption = 'Screenshot'
    TabOrder = 0
    OnClick = BShotClick
  end
  object Button2: TButton
    Left = 120
    Top = 24
    Width = 123
    Height = 49
    Caption = 'Connect'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 376
    Top = 190
    Width = 185
    Height = 51
    Caption = 'GetVolumeID'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 257
    Width = 273
    Height = 168
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    WantReturns = False
  end
  object Memo2: TMemo
    Left = 295
    Top = 257
    Width = 282
    Height = 168
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Tray: TTrayIcon
    BalloonTitle = #1040#1075#1077#1085#1090' '#1047#1072#1087#1091#1097#1077#1085
    BalloonFlags = bfInfo
    PopupMenu = TPM
    Visible = True
    Left = 552
    Top = 24
  end
  object IdIPWatch1: TIdIPWatch
    Active = True
    HistoryFilename = 'iphist.dat'
    Left = 504
    Top = 24
  end
  object IdHTTP: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams, hoNonSSLProxyUseConnectVerb]
    Left = 456
    Top = 24
  end
  object MFQ: TFDQuery
    Connection = MFC
    SQL.Strings = (
      'SELECT `username` FROM `agents`;')
    Left = 64
    Top = 32
  end
  object MFC: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=cw61131_delphi'
      'Password=delphiPass1'
      'Server=92.53.96.150'
      'User_Name=cw61131_delphi')
    Left = 32
    Top = 32
  end
  object TPM: TPopupMenu
    Left = 408
    Top = 24
    object N1: TMenuItem
      Caption = #1057#1050#1059#1056#1057' '#8212' '#1040#1075#1077#1085#1090' '#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080
    end
    object N3: TMenuItem
      Caption = #8212#8212#8212#8212#8212#8212#8212#8212#8212#8212#8212#8212#8212
      Enabled = False
    end
    object N4: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1087#1088#1086#1076#1091#1082#1090#1080#1074#1085#1086#1089#1090#1080
      Checked = True
    end
    object N5: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
    end
    object TPMAgentReg: TMenuItem
      Caption = #1040#1074#1072#1088#1080#1081#1085#1072#1103' '#1091#1089#1090#1072#1085#1086#1074#1082#1072
      Enabled = False
      OnClick = TPMAgentRegClick
    end
    object N6: TMenuItem
      Caption = #1042#1099#1079#1086#1074' '#1040#1048#1041
      Enabled = False
    end
    object TPMExit: TMenuItem
      Caption = #1042#1099#1081#1090#1080
      ShortCut = 16449
      OnClick = TPMExitClick
    end
    object N2: TMenuItem
      Break = mbBarBreak
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086#1073' '#1072#1075#1077#1085#1090#1077':'
      Enabled = False
    end
    object TPMAID: TMenuItem
      Caption = '#AID'
      Enabled = False
    end
    object TPMIP: TMenuItem
      Caption = '#IP'
      Enabled = False
    end
    object TPMPCNAME: TMenuItem
      Caption = '#PCNAME'
      Enabled = False
    end
    object TPMOS: TMenuItem
      Caption = '#OS'
      Enabled = False
    end
    object TPMHWID: TMenuItem
      Caption = '#HWID'
      Enabled = False
    end
    object TPMUsername: TMenuItem
      Caption = '#Username'
      Enabled = False
    end
  end
end
