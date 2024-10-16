object fSelecionaSocio: TfSelecionaSocio
  Left = 393
  Top = 256
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
    Left = 368
    Top = 248
    Width = 89
    Height = 25
    Caption = 'Gerar Relatorio'
    TabOrder = 1
    OnClick = btn_gerar_relatorioClick
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
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btn_fecharClick
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
