object WigFrmMain: TWigFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'WIG USB Encryption Password Recovery'
  ClientHeight = 98
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 89
    Top = 69
    Width = 52
    Height = 13
    Caption = 'Username:'
  end
  object Label2: TLabel
    Left = 29
    Top = 11
    Width = 29
    Height = 13
    Caption = 'Drive:'
  end
  object Label3: TLabel
    Left = 8
    Top = 39
    Width = 50
    Height = 13
    Caption = 'Password:'
  end
  object Button1: TButton
    Left = 8
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Recover'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 64
    Top = 36
    Width = 321
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'Select Drive and Click Recover....'
  end
  object Button2: TButton
    Left = 310
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Refresh'
    TabOrder = 2
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 8
    Width = 240
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 147
    Top = 66
    Width = 238
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
end
