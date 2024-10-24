object FSocios: TFSocios
  Left = 428
  Top = 252
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Socios'
  ClientHeight = 408
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTOp: TPanel
    Left = 0
    Top = 0
    Width = 832
    Height = 57
    Align = alTop
    Color = cl3DLight
    TabOrder = 1
    object Label3: TLabel
      Left = 104
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Pesquisar Socio'
    end
    object btn_pesquisa: TBitBtn
      Left = 592
      Top = 16
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btn_pesquisaClick
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
    object edt_pesquisa: TMaskEdit
      Left = 104
      Top = 24
      Width = 473
      Height = 21
      Cursor = crIBeam
      TabOrder = 1
    end
    object btn_limmpar: TBitBtn
      Left = 672
      Top = 16
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = btn_limmparClick
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
    object RdStatus: TRadioGroup
      Left = 16
      Top = 8
      Width = 81
      Height = 41
      Caption = 'Status'
      ItemIndex = 0
      Items.Strings = (
        'Ativo'
        'Inativo')
      TabOrder = 0
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 312
    Width = 832
    Height = 96
    Align = alBottom
    Color = cl3DLight
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 3
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 352
      Top = 3
      Width = 32
      Height = 13
      Caption = 'Renda'
    end
    object Label4: TLabel
      Left = 624
      Top = 3
      Width = 84
      Height = 26
      Caption = 'Senha de Acesso'#13#10
    end
    object Label5: TLabel
      Left = 488
      Top = 3
      Width = 89
      Height = 26
      Caption = 'Usuario de Acesso'#13#10
    end
    object edt_nome: TEdit
      Left = 24
      Top = 19
      Width = 313
      Height = 21
      Cursor = crIBeam
      MaxLength = 50
      TabOrder = 0
    end
    object edt_renda: TEdit
      Left = 352
      Top = 19
      Width = 121
      Height = 21
      Cursor = crIBeam
      MaxLength = 7
      TabOrder = 1
      OnChange = edt_rendaChange
      OnKeyPress = edt_rendaKeyPress
    end
    object pnl_botoes: TPanel
      Left = 48
      Top = 47
      Width = 681
      Height = 41
      TabOrder = 5
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
        TabOrder = 2
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
        TabOrder = 3
        OnClick = btn_cancelarClick
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
        TabOrder = 4
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
        TabOrder = 5
        OnClick = btn_fecharClick
        Kind = bkCancel
      end
      object btn_salvar: TBitBtn
        Left = 127
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Salvar'
        TabOrder = 1
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
    object RdInativo: TCheckBox
      Left = 736
      Top = 7
      Width = 97
      Height = 17
      Caption = 'Socio Inativo'
      TabOrder = 4
    end
    object edt_senha: TEdit
      Left = 624
      Top = 19
      Width = 105
      Height = 21
      Cursor = crIBeam
      MaxLength = 50
      PasswordChar = '*'
      TabOrder = 3
    end
    object edt_UserSocio: TEdit
      Left = 488
      Top = 19
      Width = 129
      Height = 21
      Cursor = crIBeam
      MaxLength = 50
      TabOrder = 2
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 57
    Width = 832
    Height = 255
    Align = alClient
    TabOrder = 0
    object gridSocios: TDBGrid
      Left = 1
      Top = 1
      Width = 830
      Height = 253
      Align = alClient
      DataSource = DsSocios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = Grid_sociosCellClick
    end
  end
  object adoquery_socios: TADOQuery
    AutoCalcFields = False
    Connection = fDataModule.conexaoDB
    CursorType = ctStatic
    Parameters = <>
    Left = 760
    Top = 16
    object adoquery_sociosID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adoquery_sociosNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object adoquery_sociosRENDA: TBCDField
      FieldName = 'RENDA'
      DisplayFormat = 'R$ ,0.00'
      Precision = 19
    end
    object adoquery_sociosATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 7
    end
    object adoquery_sociossenha: TStringField
      FieldName = 'senha'
      Size = 30
    end
    object adoquery_sociosusuario: TStringField
      FieldName = 'usuario'
      Size = 50
    end
  end
  object DsSocios: TDataSource
    DataSet = adoquery_socios
    Left = 792
    Top = 16
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 744
    Top = 368
  end
end
