object FRelatorioSocios: TFRelatorioSocios
  Left = 356
  Top = 209
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorios'
  ClientHeight = 429
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = fSelecionaSocio.DsAuxiliar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object header: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 179
      BandType = btHeader
      object RLLabel2: TRLLabel
        Left = 8
        Top = 104
        Width = 101
        Height = 16
        Caption = 'Nome do Socio: '
      end
      object RLLabel5: TRLLabel
        Left = 536
        Top = 16
        Width = 61
        Height = 16
        Caption = 'ID Socio: '
      end
      object RLDBText3: TRLDBText
        Left = 608
        Top = 16
        Width = 61
        Height = 16
        DataField = 'ID SOCIO'
        DataSource = fSelecionaSocio.DsAuxiliar
      end
      object RLLabel3: TRLLabel
        Left = 120
        Top = 160
        Width = 129
        Height = 16
        Caption = 'Nome do Dependente'
      end
      object RLLabel4: TRLLabel
        Left = 512
        Top = 160
        Width = 43
        Height = 16
        Caption = 'Idade: '
      end
      object RLLabel6: TRLLabel
        Left = 8
        Top = 160
        Width = 16
        Height = 16
        Caption = 'ID'
      end
      object RLLabel7: TRLLabel
        Left = 8
        Top = 128
        Width = 708
        Height = 16
        Caption = 
          '----------------------------------------------------------------' +
          '----------------------------------------------------------------' +
          '------------------------------------------------'
      end
      object RLDBText1: TRLDBText
        Left = 120
        Top = 104
        Width = 111
        Height = 16
        DataField = 'NOME DO SOCIO'
        DataSource = fSelecionaSocio.DsAuxiliar
      end
      object rlbl1: TRLLabel
        Left = 179
        Top = 48
        Width = 362
        Height = 23
        Alignment = taCenter
        Caption = 'Relat'#243'rio Dependentes por S'#243'cio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object information: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 48
      object RLDBText2: TRLDBText
        Left = 512
        Top = 8
        Width = 43
        Height = 16
        DataField = 'IDADE'
        DataSource = fSelecionaSocio.DsAuxiliar
      end
      object RLDBText4: TRLDBText
        Left = 120
        Top = 8
        Width = 135
        Height = 16
        DataField = 'NOME DEPENDENTE'
        DataSource = fSelecionaSocio.DsAuxiliar
      end
      object RLDBText5: TRLDBText
        Left = 8
        Top = 8
        Width = 108
        Height = 16
        DataField = 'ID DEPENDENTE'
        DataSource = fSelecionaSocio.DsAuxiliar
      end
    end
  end
end
