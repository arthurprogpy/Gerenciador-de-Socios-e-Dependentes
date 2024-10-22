object FDependetesSocios: TFDependetesSocios
  Left = 430
  Top = 277
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dependentes'
  ClientHeight = 404
  ClientWidth = 813
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
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 813
    Height = 65
    Align = alTop
    Color = cl3DLight
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 12
      Width = 54
      Height = 13
      Caption = 'Buscar por:'
    end
    object Label4: TLabel
      Left = 112
      Top = 12
      Width = 46
      Height = 13
      Caption = 'Pesquisar'
    end
    object cbSociosOuDependente: TComboBox
      Left = 8
      Top = 28
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 0
      Text = 'Dependente'
      Items.Strings = (
        'Socio'
        'Dependente')
    end
    object edt_pesquisar: TMaskEdit
      Left = 112
      Top = 28
      Width = 489
      Height = 21
      Cursor = crIBeam
      TabOrder = 1
    end
    object btn_Limpar: TBitBtn
      Left = 720
      Top = 24
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = btn_LimparClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
    end
    object btn_pesqusiar: TBitBtn
      Left = 632
      Top = 24
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Pesquisar'
      TabOrder = 3
      OnClick = btn_pesqusiarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
  end
  object pnlContent: TPanel
    Left = 0
    Top = 65
    Width = 813
    Height = 294
    Align = alClient
    TabOrder = 1
    object grid_dependencias: TDBGrid
      Left = 1
      Top = 1
      Width = 811
      Height = 292
      Align = alClient
      DataSource = ds_dependendias
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 359
    Width = 813
    Height = 45
    Align = alBottom
    TabOrder = 2
    object btnFechar: TBitBtn
      Left = 369
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
      Kind = bkCancel
    end
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 616
    Top = 65528
  end
  object adoquery_dependentes: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 656
    Top = 65528
  end
  object ds_dependendias: TDataSource
    DataSet = adoquery_dependentes
    Left = 688
    Top = 65528
  end
end
