object fMenu: TfMenu
  Left = 530
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Menu'
  ClientHeight = 252
  ClientWidth = 253
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
  object btn_operadores: TBitBtn
    Left = 72
    Top = 136
    Width = 105
    Height = 25
    Caption = 'Operadores'
    TabOrder = 0
    OnClick = btn_operadoresClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      5000555555555555577755555555555550B0555555555555F7F7555555555550
      00B05555555555577757555555555550B3B05555555555F7F557555555555000
      3B0555555555577755755555555500B3B0555555555577555755555555550B3B
      055555FFFF5F7F5575555700050003B05555577775777557555570BBB00B3B05
      555577555775557555550BBBBBB3B05555557F555555575555550BBBBBBB0555
      55557F55FF557F5555550BB003BB075555557F577F5575F5555577B003BBB055
      555575F7755557F5555550BB33BBB0555555575F555557F555555507BBBB0755
      55555575FFFF7755555555570000755555555557777775555555}
    NumGlyphs = 2
  end
  object btn_socios: TBitBtn
    Left = 72
    Top = 16
    Width = 105
    Height = 25
    Caption = 'Socios'
    TabOrder = 1
    OnClick = btn_sociosClick
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
  object btn_dependentes: TBitBtn
    Left = 72
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Dependentes'
    TabOrder = 2
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
      0EEE333377777777777733330FF00FBFB0EE33337F37733F377733330F0BFB0B
      FB0E33337F73FF73337733330FF000BFBFB033337F377733333733330FFF0BFB
      FBF033337FFF733F333733300000BF0FBFB03FF77777F3733F37000FBFB0F0FB
      0BF077733FF7F7FF7337E0FB00000000BF0077F377777777F377E0BFBFBFBFB0
      F0F077F3333FFFF7F737E0FBFB0000000FF077F3337777777337E0BFBFBFBFB0
      FFF077F3333FFFF73FF7E0FBFB00000F000077FF337777737777E00FBFBFB0FF
      0FF07773FFFFF7337F37003000000FFF0F037737777773337F7333330FFFFFFF
      003333337FFFFFFF773333330000000003333333777777777333}
    NumGlyphs = 2
  end
  object btn_relatorios: TBitBtn
    Left = 72
    Top = 96
    Width = 105
    Height = 25
    Caption = 'Relatorios'
    TabOrder = 3
  end
  object btn_fechar: TBitBtn
    Left = 88
    Top = 176
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btn_fecharClick
    Kind = bkCancel
  end
end