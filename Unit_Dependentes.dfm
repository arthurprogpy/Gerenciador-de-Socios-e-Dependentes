object fDependentes: TfDependentes
  Left = 419
  Top = 162
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
  object pnlRodape: TPanel
    Left = 0
    Top = 346
    Width = 806
    Height = 97
    Align = alBottom
    Color = cl3DLight
    TabOrder = 0
    object Label1: TLabel
      Left = 64
      Top = 4
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 702
      Top = 4
      Width = 27
      Height = 13
      Caption = 'Idade'
    end
    object Label3: TLabel
      Left = 448
      Top = 4
      Width = 27
      Height = 13
      Caption = 'Socio'
    end
    object edt_nome: TEdit
      Left = 64
      Top = 20
      Width = 369
      Height = 21
      Cursor = crIBeam
      MaxLength = 50
      TabOrder = 0
    end
    object edt_socio: TMaskEdit
      Left = 448
      Top = 20
      Width = 209
      Height = 21
      Cursor = crIBeam
      Color = clInfoBk
      Enabled = False
      TabOrder = 1
    end
    object btn_socio: TBitBtn
      Left = 664
      Top = 16
      Width = 33
      Height = 25
      TabOrder = 2
      OnClick = btn_socioClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object edt_idade: TEdit
      Left = 704
      Top = 16
      Width = 41
      Height = 21
      MaxLength = 3
      TabOrder = 3
      OnKeyPress = edt_idadeKeyPress
    end
    object pnl_botoes: TPanel
      Left = 64
      Top = 47
      Width = 681
      Height = 41
      TabOrder = 4
      object btn_novo: TBitBtn
        Left = 11
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btn_novoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
      end
      object btn_editar: TBitBtn
        Left = 244
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Editar'
        TabOrder = 1
        OnClick = btn_editarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
          555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
          05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
          FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
          FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
          FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
          05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
          555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
          9055575757575757775505050505055505557575757575557555}
        NumGlyphs = 2
      end
      object btn_cancelar: TBitBtn
        Left = 361
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Cancelar'
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33F333337F3333373B33333BB33333B337FF33377F33337F3BB3333BB333
          3BB3377FF3377F33377333BB777BB777BB333377FFF77FFF7733330000000000
          B3333377777777777333330FFFFFFFF03333337F3FF3FFF7F333330F00F000F0
          33333F7F77377737FFFFBB0FFF8FFFF0BBB3777F3F33FFF7777F3B0F08700000
          000B377F73F7777777773308880FFFFFF033337F377333333733330807FFFFF8
          033333737FFFFFFF7F33333000000000B3333337777777777FF333BB333BB333
          BB33337733377F3377FF3BB3333BB3333BB3377333377F33377F3B33333BB333
          33B33733333773333373B333333B3333333B7333333733333337}
        NumGlyphs = 2
      end
      object btn_excluir: TBitBtn
        Left = 478
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Excluir'
        TabOrder = 3
        OnClick = btn_excluirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F77777703333333733F3F3F73F33330FF0808077
          0333337F37F7F7F37F33330FF0807077033333733737F73F73F330FF77808707
          703337F37F37F37F37F330FF08807807703037F37F37F37F37F700FF08808707
          700377F37337F37F377330FF778078077033373F73F7F3733733330FF0808077
          0333337F37F7F7F37F33330FF08070770333337FF7F7F7FF7F33330000000000
          03333377777777777F33330F888777770333337FFFFFFFFF7F33330000000000
          033333777777777773333333307770333333333337FFF7F33333333330000033
          3333333337777733333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object btn_fechar: TBitBtn
        Left = 595
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Fechar'
        TabOrder = 4
        Kind = bkCancel
      end
      object btn_salvar: TBitBtn
        Left = 127
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Salvar'
        TabOrder = 5
        OnClick = btn_salvarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 65
    Align = alTop
    Color = cl3DLight
    TabOrder = 1
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
    Width = 806
    Height = 281
    Align = alClient
    TabOrder = 2
    object grid_dependencias: TDBGrid
      Left = 1
      Top = 1
      Width = 804
      Height = 279
      Align = alClient
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
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 616
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
