object fDependentes: TfDependentes
  Left = 351
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dependentes'
  ClientHeight = 443
  ClientWidth = 806
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
  object Label4: TLabel
    Left = 112
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Pesquisar'
  end
  object Label5: TLabel
    Left = 8
    Top = 8
    Width = 54
    Height = 13
    Caption = 'Buscar por:'
  end
  object grid_dependencias: TDBGrid
    Left = 8
    Top = 56
    Width = 785
    Height = 289
    DataSource = ds_dependendias
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = grid_dependenciasCellClick
  end
  object edt_pesquisar: TMaskEdit
    Left = 112
    Top = 24
    Width = 497
    Height = 21
    TabOrder = 1
  end
  object btn_pesqusiar: TBitBtn
    Left = 632
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btn_pesqusiarClick
  end
  object btn_Limpar: TBitBtn
    Left = 712
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 3
    OnClick = btn_LimparClick
  end
  object cbSociosOuDependente: TComboBox
    Left = 8
    Top = 24
    Width = 97
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 4
    Text = 'Dependente'
    Items.Strings = (
      'Socio'
      'Dependente')
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 346
    Width = 806
    Height = 97
    Align = alBottom
    TabOrder = 5
    object Label1: TLabel
      Left = 64
      Top = 12
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 702
      Top = 12
      Width = 27
      Height = 13
      Caption = 'Idade'
    end
    object Label3: TLabel
      Left = 448
      Top = 12
      Width = 27
      Height = 13
      Caption = 'Socio'
    end
    object pnl_botoes: TPanel
      Left = 176
      Top = 48
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
      Left = 64
      Top = 28
      Width = 369
      Height = 21
      MaxLength = 50
      TabOrder = 1
    end
    object edt_idade: TEdit
      Left = 704
      Top = 28
      Width = 49
      Height = 21
      TabOrder = 2
    end
    object edt_socio: TMaskEdit
      Left = 448
      Top = 28
      Width = 209
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object btn_socio: TBitBtn
      Left = 664
      Top = 24
      Width = 33
      Height = 25
      TabOrder = 4
      OnClick = btn_socioClick
    end
  end
  object ds_dependendias: TDataSource
    DataSet = adoquery_dependentes
    Left = 704
    Top = 65520
  end
  object adoquery_dependentes: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 672
    Top = 65520
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 632
    Top = 65528
  end
end
