object FSocios: TFSocios
  Left = 389
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Socios'
  ClientHeight = 408
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 296
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 400
    Top = 296
    Width = 32
    Height = 13
    Caption = 'Renda'
  end
  object Label3: TLabel
    Left = 16
    Top = 8
    Width = 76
    Height = 13
    Caption = 'Pesquisar Socio'
  end
  object edt_nome: TEdit
    Left = 24
    Top = 312
    Width = 313
    Height = 21
    MaxLength = 50
    TabOrder = 0
  end
  object edt_renda: TEdit
    Left = 400
    Top = 312
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object pnl_botoes: TPanel
    Left = 104
    Top = 352
    Width = 425
    Height = 41
    TabOrder = 2
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
      OnClick = btn_excluirClick
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
  object Grid_socios: TDBGrid
    Left = 16
    Top = 56
    Width = 705
    Height = 233
    DataSource = DsSocios
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = Grid_sociosCellClick
  end
  object btn_pesquisa: TBitBtn
    Left = 536
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 4
    OnClick = btn_pesquisaClick
  end
  object edt_pesquisa: TMaskEdit
    Left = 16
    Top = 24
    Width = 425
    Height = 21
    TabOrder = 5
  end
  object btn_limmpar: TBitBtn
    Left = 608
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 6
    OnClick = btn_limmparClick
  end
  object RdInativo: TCheckBox
    Left = 544
    Top = 312
    Width = 97
    Height = 17
    Caption = 'Socio Inativo'
    TabOrder = 7
  end
  object RdStatus: TRadioGroup
    Left = 448
    Top = 8
    Width = 81
    Height = 41
    Caption = 'Status'
    ItemIndex = 0
    Items.Strings = (
      'Ativo'
      'Inativo')
    TabOrder = 8
  end
  object adoquery_socios: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 696
    Top = 16
  end
  object DsSocios: TDataSource
    DataSet = adoquery_socios
    Left = 672
    Top = 16
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 616
    Top = 360
  end
end
