object fDependentes: TfDependentes
  Left = 310
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dependentes'
  ClientHeight = 420
  ClientWidth = 798
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
  object Label1: TLabel
    Left = 8
    Top = 328
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 672
    Top = 328
    Width = 27
    Height = 13
    Caption = 'Idade'
  end
  object Label3: TLabel
    Left = 392
    Top = 328
    Width = 27
    Height = 13
    Caption = 'Socio'
  end
  object Label4: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Pesquisar'
  end
  object pnl_botoes: TPanel
    Left = 168
    Top = 372
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
  object edt_nome: TEdit
    Left = 8
    Top = 344
    Width = 369
    Height = 21
    MaxLength = 50
    TabOrder = 1
  end
  object edt_idade: TEdit
    Left = 672
    Top = 344
    Width = 49
    Height = 21
    TabOrder = 2
  end
  object grid_dependencias: TDBGrid
    Left = 8
    Top = 56
    Width = 777
    Height = 265
    DataSource = ds_dependendias
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = grid_dependenciasCellClick
  end
  object edt_pesquisar: TMaskEdit
    Left = 8
    Top = 24
    Width = 537
    Height = 21
    TabOrder = 4
  end
  object btn_pesqusiar: TBitBtn
    Left = 552
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 5
    OnClick = btn_pesqusiarClick
  end
  object btn_Limpar: TBitBtn
    Left = 632
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 6
    OnClick = btn_LimparClick
  end
  object edt_socio: TMaskEdit
    Left = 392
    Top = 344
    Width = 209
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 7
  end
  object btn_socio: TBitBtn
    Left = 608
    Top = 344
    Width = 33
    Height = 25
    TabOrder = 8
    OnClick = btn_socioClick
  end
  object ds_dependendias: TDataSource
    DataSet = adoquery_dependentes
    Left = 760
    Top = 384
  end
  object adoquery_dependentes: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 728
    Top = 384
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 744
    Top = 8
  end
end
