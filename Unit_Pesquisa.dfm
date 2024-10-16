object FPesquisa: TFPesquisa
  Left = 538
  Top = 163
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa'
  ClientHeight = 334
  ClientWidth = 576
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
    Top = 16
    Width = 112
    Height = 13
    Caption = 'Digite o Nome do Socio'
  end
  object Grid_Pesquisa: TDBGrid
    Left = 24
    Top = 72
    Width = 521
    Height = 209
    DataSource = DSPesquisa
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object edt_pesquisa: TEdit
    Left = 24
    Top = 32
    Width = 361
    Height = 21
    Cursor = crIBeam
    TabOrder = 1
  end
  object btn_pesquisar: TBitBtn
    Left = 392
    Top = 32
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btn_pesquisarClick
  end
  object btn_selecionar: TBitBtn
    Left = 144
    Top = 296
    Width = 91
    Height = 25
    Cursor = crHandPoint
    Caption = 'Selecionar'
    TabOrder = 3
    OnClick = btn_selecionarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
      0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
      00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
      00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
      F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
      F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
      FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
      0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
      00337777FFFF77FF7733EEEE0000000003337777777777777333}
    NumGlyphs = 2
  end
  object btn_fechar: TBitBtn
    Left = 304
    Top = 296
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btn_fecharClick
    Kind = bkCancel
  end
  object btn_limpar: TBitBtn
    Left = 480
    Top = 32
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Limpar'
    TabOrder = 5
    OnClick = btn_limparClick
  end
  object DSPesquisa: TDataSource
    DataSet = adoquery_pesquisa
    Left = 392
  end
  object adoquery_pesquisa: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 424
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 536
    Top = 296
  end
end
