object fInformacoesSocio: TfInformacoesSocio
  Left = 360
  Top = 263
  Width = 873
  Height = 136
  Caption = 'fInformacoesSocio'
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
  object pnlBottom: TPanel
    Left = 0
    Top = 0
    Width = 857
    Height = 97
    Align = alClient
    Color = cl3DLight
    TabOrder = 0
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
      Left = 616
      Top = 3
      Width = 84
      Height = 26
      Caption = 'Senha de Acesso'#13#10
    end
    object Label5: TLabel
      Left = 480
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
      TabStop = False
      Color = clInfoBk
      Enabled = False
      MaxLength = 8
      TabOrder = 1
    end
    object pnl_botoes: TPanel
      Left = 208
      Top = 47
      Width = 409
      Height = 41
      TabOrder = 5
      object btn_editar: TBitBtn
        Left = 28
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Editar'
        TabOrder = 0
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
        Left = 217
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
      object btn_fechar: TBitBtn
        Left = 307
        Top = 8
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Fechar'
        TabOrder = 3
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
      Top = 15
      Width = 97
      Height = 17
      TabStop = False
      Caption = 'Socio Inativo'
      Color = clInfoBk
      Enabled = False
      ParentColor = False
      TabOrder = 4
    end
    object edt_senha: TEdit
      Left = 616
      Top = 19
      Width = 105
      Height = 21
      Cursor = crIBeam
      MaxLength = 50
      PasswordChar = '*'
      TabOrder = 3
    end
    object edt_UserSocio: TEdit
      Left = 480
      Top = 19
      Width = 129
      Height = 21
      Cursor = crIBeam
      MaxLength = 50
      TabOrder = 2
    end
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 696
    Top = 320
  end
  object adoquery_socios: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 760
    Top = 48
  end
end
