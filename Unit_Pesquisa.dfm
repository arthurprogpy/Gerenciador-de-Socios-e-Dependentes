object FPesquisa: TFPesquisa
  Left = 444
  Top = 179
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
    Width = 145
    Height = 13
    Caption = 'Digite o que Deseja Pesquisar:'
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
    TabOrder = 1
  end
  object btn_pesquisar: TBitBtn
    Left = 400
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = btn_pesquisarClick
  end
  object btn_selecionar: TBitBtn
    Left = 136
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 3
    OnClick = btn_selecionarClick
  end
  object btn_fechar: TBitBtn
    Left = 304
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btn_fecharClick
  end
  object DSPesquisa: TDataSource
    DataSet = adoquery_pesquisa
    Left = 480
    Top = 24
  end
  object adoquery_pesquisa: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    Left = 520
    Top = 24
  end
end
