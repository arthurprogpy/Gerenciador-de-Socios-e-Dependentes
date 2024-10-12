object fLogin: TfLogin
  Left = 466
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 202
  ClientWidth = 402
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 184
    Top = 32
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 184
    Top = 88
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object edt_usuario: TEdit
    Left = 96
    Top = 48
    Width = 209
    Height = 21
    TabOrder = 0
    Text = 'adm'
  end
  object edt_senha: TEdit
    Left = 96
    Top = 104
    Width = 209
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
    Text = '123'
  end
  object btn_entrar: TBitBtn
    Left = 240
    Top = 160
    Width = 81
    Height = 25
    Cursor = crHandPoint
    Caption = 'Entrar'
    TabOrder = 2
    OnClick = btn_entrarClick
    Kind = bkOK
  end
  object btn_sair: TBitBtn
    Left = 72
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btn_sairClick
    Kind = bkCancel
  end
  object adoquery_login: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 352
    Top = 16
  end
end
