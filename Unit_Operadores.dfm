object FOperadores: TFOperadores
  Left = 585
  Top = 255
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Operadores'
  ClientHeight = 256
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Usuario: TLabel
    Left = 16
    Top = 16
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object Nome: TLabel
    Left = 16
    Top = 72
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Senha: TLabel
    Left = 16
    Top = 128
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object pnl_botoes: TPanel
    Left = 8
    Top = 192
    Width = 425
    Height = 41
    TabOrder = 0
    object btn_novo: TBitBtn
      Left = -8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btn_novoClick
    end
    object btn_editar: TBitBtn
      Left = 136
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btn_editarClick
    end
    object btn_cancelar: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btn_cancelarClick
    end
    object btn_excluir: TBitBtn
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
    end
    object btn_fechar: TBitBtn
      Left = 352
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = btn_fecharClick
    end
    object btn_salvar: TBitBtn
      Left = 64
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 5
      OnClick = btn_salvarClick
    end
  end
  object edt_usuario: TEdit
    Left = 16
    Top = 32
    Width = 209
    Height = 21
    TabOrder = 1
  end
  object edt_nome: TEdit
    Left = 16
    Top = 88
    Width = 209
    Height = 21
    TabOrder = 2
  end
  object edt_senha: TEdit
    Left = 16
    Top = 144
    Width = 209
    Height = 21
    TabOrder = 3
  end
  object btn_localizar: TBitBtn
    Left = 256
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 4
    OnClick = btn_localizarClick
  end
  object adoquery_operadores: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 376
    Top = 16
  end
end