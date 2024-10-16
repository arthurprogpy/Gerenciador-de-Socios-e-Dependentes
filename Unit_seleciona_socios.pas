unit Unit_seleciona_socios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TfSelecionaSocio = class(TForm)
    edt_nome_socio: TEdit;
    btn_gerar_relatorio: TBitBtn;
    Label1: TLabel;
    DsRelatorio: TDataSource;
    adoquey_relatorio: TADOQuery;
    grid_relatorio: TDBGrid;
    btn_fechar: TBitBtn;
    adoquery_aux: TADOQuery;
    DsAuxiliar: TDataSource;
    adoquery_auxIDDEPENDENTE: TAutoIncField;
    adoquery_auxNOMEDEPENDENTE: TStringField;
    adoquery_auxIDADE: TIntegerField;
    adoquery_auxIDSOCIO: TAutoIncField;
    adoquery_auxNOMEDOSOCIO: TStringField;
    procedure btn_pesquisar_socioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grid_relatorioCellClick(Column: TColumn);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_gerar_relatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_socio: String;
  end;

var
  fSelecionaSocio: TfSelecionaSocio;

implementation

uses Unit_Pesquisa, Unit_dataModule, Unit_Relatoires;

{$R *.dfm}

procedure TfSelecionaSocio.btn_pesquisar_socioClick(Sender: TObject);
begin
  if FPesquisa = nil then
    Application.CreateForm(TFPesquisa, FPesquisa);
  FPesquisa.ShowModal;
end;

procedure TfSelecionaSocio.FormShow(Sender: TObject);
begin
  adoquey_relatorio.SQL.text := 'SELECT ID, NOME, ATIVO AS STATUS FROM SOCIOS WHERE ATIVO = '+
                                  QuotedStr('ATIVO');
  adoquey_relatorio.Close;
  adoquey_relatorio.Open;

  id_socio := '';
  edt_nome_socio.Clear;
end;

procedure TfSelecionaSocio.grid_relatorioCellClick(Column: TColumn);
begin
  edt_nome_socio.Text := adoquey_relatorio.fieldbyname('NOME').AsString;
  id_socio := adoquey_relatorio.fieldbyname('ID').AsString;
end;

procedure TfSelecionaSocio.btn_fecharClick(Sender: TObject);
begin
  close;
  id_socio := '';
  edt_nome_socio.Clear;
end;

procedure TfSelecionaSocio.btn_gerar_relatorioClick(Sender: TObject);
begin
  if (id_socio = '') or (edt_nome_socio.text = '') then
    ShowMessage('Selecione um Socio !')
  else
    begin
      adoquery_aux.SQL.Text := 'SELECT dependentes.ID AS ' + QuotedStr('ID DEPENDENTE')+','+
                                  ' Dependentes.nome AS '+QuotedStr('NOME DEPENDENTE')+',' +
                                  ' Dependentes.idade AS IDADE,'+
                                  '  socios.id AS '+QuotedStr('ID SOCIO')+','+
                                  ' socios.nome AS '+QuotedStr('NOME DO SOCIO')+
                                  '  FROM dependentes '+
                                  '  INNER JOIN socios '+
                                  '  ON dependentes.id_socio = socios.id '+
                                  '  WHERE SOCIOS.ID = ' + id_socio;

      adoquery_aux.Close;
      adoquery_aux.Open;
          if adoquery_aux.IsEmpty then
            ShowMessage('Este Socio não Possui Dependentes !')
          else
            begin
              FRelatorioSocios.RLReport1.Preview;
            end;
    end;
end;

end.
