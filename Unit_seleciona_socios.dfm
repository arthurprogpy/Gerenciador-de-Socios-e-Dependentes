object fSelecionaSocio: TfSelecionaSocio
  Left = 402
  Top = 243
  Width = 590
  Height = 327
  BorderIcons = [biSystemMenu]
  Caption = 'Selecionar S'#243'cio'
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
    Left = 16
    Top = 240
    Width = 86
    Height = 13
    Caption = 'Selecione o Socio'
  end
  object edt_nome_socio: TEdit
    Left = 16
    Top = 256
    Width = 337
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object btn_gerar_relatorio: TBitBtn
    Left = 360
    Top = 248
    Width = 105
    Height = 25
    Cursor = crHandPoint
    Caption = 'Gerar Relatorio'
    TabOrder = 1
    OnClick = btn_gerar_relatorioClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
      8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
      8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
      8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object grid_relatorio: TDBGrid
    Left = 8
    Top = 24
    Width = 553
    Height = 209
    DataSource = DsRelatorio
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = grid_relatorioCellClick
  end
  object btn_fechar: TBitBtn
    Left = 472
    Top = 248
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btn_fecharClick
    Kind = bkCancel
  end
  object DsRelatorio: TDataSource
    DataSet = adoquey_relatorio
    Left = 400
    Top = 65528
  end
  object adoquey_relatorio: TADOQuery
    Connection = fDataModule.conexaoDB
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 432
    Top = 65528
  end
  object adoquery_aux: TADOQuery
    Connection = fDataModule.conexaoDB
    CursorType = ctStatic
    Parameters = <
      item
        Size = -1
        Value = Null
      end>
    Left = 504
    Top = 65528
    object adoquery_auxIDDEPENDENTE: TAutoIncField
      FieldName = 'ID DEPENDENTE'
      ReadOnly = True
    end
    object adoquery_auxNOMEDEPENDENTE: TStringField
      FieldName = 'NOME DEPENDENTE'
      Size = 50
    end
    object adoquery_auxIDADE: TIntegerField
      FieldName = 'IDADE'
    end
    object adoquery_auxIDSOCIO: TAutoIncField
      FieldName = 'ID SOCIO'
      ReadOnly = True
    end
    object adoquery_auxNOMEDOSOCIO: TStringField
      FieldName = 'NOME DO SOCIO'
      Size = 50
    end
  end
  object DsAuxiliar: TDataSource
    DataSet = adoquery_aux
    Left = 536
    Top = 65528
  end
end
