unit Unit_SociosDependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFDependetesSocios = class(TForm)
    pnlTop: TPanel;
    Label5: TLabel;
    Label4: TLabel;
    cbSociosOuDependente: TComboBox;
    edt_pesquisar: TMaskEdit;
    btn_Limpar: TBitBtn;
    btn_pesqusiar: TBitBtn;
    pnlContent: TPanel;
    grid_dependencias: TDBGrid;
    adoquery_aux: TADOQuery;
    adoquery_dependentes: TADOQuery;
    ds_dependendias: TDataSource;
    pnlBottom: TPanel;
    btnFechar: TBitBtn;
    procedure btn_pesqusiarClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDependetesSocios: TFDependetesSocios;

implementation

uses
  Unit_Login;

{$R *.dfm}

procedure TFDependetesSocios.btn_pesqusiarClick(Sender: TObject);
begin
  if edt_pesquisar.Text = '' then
    ShowMessage('Insira um Nome para pesquisar!')
  else
    if cbSociosOuDependente.ItemIndex = 0 then
      begin
        adoquery_dependentes.SQL.Text := 'SELECT dependentes.ID AS ' + QuotedStr('ID DEPENDENTE')+','+
                                          ' Dependentes.nome AS '+QuotedStr('NOME DEPENDENTE')+',' +
                                          ' Dependentes.idade AS IDADE,'+
                                          '  socios.id AS '+QuotedStr('ID SOCIO')+','+
                                          ' socios.nome AS '+QuotedStr('NOME DO SOCIO')+
                                          '  FROM dependentes '+
                                          '  INNER JOIN socios '+
                                          '  ON dependentes.id_socio = socios.id '+
                                          '  WHERE SOCIOS.NOME LIKE '+QuotedStr(edt_pesquisar.Text+'%')
      end
    else if cbSociosOuDependente.ItemIndex = 1 then
      begin
       adoquery_dependentes.SQL.Text := 'SELECT dependentes.ID AS ' + QuotedStr('ID DEPENDENTE')+','+
                                          ' Dependentes.nome AS '+QuotedStr('NOME DEPENDENTE')+',' +
                                          ' Dependentes.idade AS IDADE,'+
                                          '  socios.id AS '+QuotedStr('ID SOCIO')+','+
                                          ' socios.nome AS '+QuotedStr('NOME DO SOCIO')+
                                          '  FROM dependentes '+
                                          '  INNER JOIN socios '+
                                          '  ON dependentes.id_socio = socios.id '+
                                          '  WHERE DEPENDENTES.NOME LIKE '+QuotedStr(edt_pesquisar.Text+'%');
      end;
    adoquery_dependentes.close;
    adoquery_dependentes.open;
end;

procedure TFDependetesSocios.btn_LimparClick(Sender: TObject);
begin
  edt_pesquisar.clear;
  adoquery_dependentes.Close;
  adoquery_dependentes.SQL.Text := 'SELECT dependentes.ID AS ' + QuotedStr('ID DEPENDENTE')+','+
                                  ' Dependentes.nome AS '+QuotedStr('NOME DEPENDENTE')+',' +
                                  ' Dependentes.idade AS IDADE,'+
                                  '  socios.id AS '+QuotedStr('ID SOCIO')+','+
                                  ' socios.nome AS '+QuotedStr('NOME DO SOCIO')+
                                  '  FROM dependentes '+
                                  '  INNER JOIN socios '+
                                  '  ON dependentes.id_socio = socios.id'+
                                  ' WHERE SOCIOS.ID = '+ID;
  adoquery_dependentes.open;

end;

procedure TFDependetesSocios.FormShow(Sender: TObject);
begin

 adoquery_dependentes.SQL.Text := 'SELECT dependentes.ID AS ' + QuotedStr('ID DEPENDENTE')+','+
                                  ' Dependentes.nome AS '+QuotedStr('NOME DEPENDENTE')+',' +
                                  ' Dependentes.idade AS IDADE,'+
                                  '  socios.id AS '+QuotedStr('ID SOCIO')+','+
                                  ' socios.nome AS '+QuotedStr('NOME DO SOCIO')+
                                  '  FROM dependentes '+
                                  '  INNER JOIN socios '+
                                  '  ON dependentes.id_socio = socios.id'+
                                  ' WHERE SOCIOS.ID = '+ID;

  adoquery_dependentes.Close;
  adoquery_dependentes.open;
end;

procedure TFDependetesSocios.btnFecharClick(Sender: TObject);
begin
  close;
end;

end.
