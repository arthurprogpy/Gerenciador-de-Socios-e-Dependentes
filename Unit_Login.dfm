object fLogin: TfLogin
  Left = 424
  Top = 177
  Width = 418
  Height = 241
  Caption = 'Login'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 32
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 168
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object edt_usuario: TEdit
    Left = 80
    Top = 48
    Width = 209
    Height = 21
    TabOrder = 0
  end
  object edt_senha: TEdit
    Left = 80
    Top = 104
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 160
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Caption = 'Entrar'
    TabOrder = 2
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 72
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    Kind = bkCancel
  end
end
