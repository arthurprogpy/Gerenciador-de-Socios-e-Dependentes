unit Unit_Pesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TFPesquisa = class(TForm)
    DSPesquisa: TDataSource;
    adoquery_pesquisa: TADOQuery;
    Grid_Pesquisa: TDBGrid;
    edt_pesquisa: TEdit;
    btn_pesquisar: TBitBtn;
    btn_selecionar: TBitBtn;
    btn_fechar: TBitBtn;
    Label1: TLabel;
    adoquery_aux: TADOQuery;
    btn_limpar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FPesquisa: TFPesquisa;
  sql_pesquisa: string;
  pk_socio, nome_socio: String;

implementation

uses Unit_dataModule, Unit_Dependentes;

{$R *.dfm}

procedure TFPesquisa.FormShow(Sender: TObject);
begin
  adoquery_pesquisa.SQL.Text := 'SELECT * FROM SOCIOS WHERE ATIVO = '+
                                  QuotedStr('ATIVO');
  adoquery_pesquisa.Close;
  adoquery_pesquisa.Open;
  pk_socio := '';
end;

procedure TFPesquisa.btn_pesquisarClick(Sender: TObject);
begin
if edt_pesquisa.text = '' then
  ShowMessage('Impossivel Pesquisar !')
else
  begin
    adoquery_pesquisa.SQL.text := 'SELECT * FROM SOCIOS WHERE NOME LIKE '+QuotedStr(edt_pesquisa.Text+'%')+
                                    'WHERE ATIVO = '+QuotedStr('ativo');
    adoquery_pesquisa.Close;
    adoquery_pesquisa.Open;
  end;
end;

procedure TFPesquisa.btn_fecharClick(Sender: TObject);
begin
  close;
  edt_pesquisa.clear;
  adoquery_pesquisa.Close;
  adoquery_pesquisa.SQL.Text := 'SELECT * FROM SOCIOS'
end;

procedure TFPesquisa.btn_selecionarClick(Sender: TObject);
begin
  pk_socio := adoquery_pesquisa.fieldbyname('ID').AsString;
  nome_socio := adoquery_pesquisa.fieldbyname('NOME').AsString;
  FPesquisa.close;
  fDependentes.edt_socio.Text := nome_socio;
end;

procedure TFPesquisa.btn_limparClick(Sender: TObject);
begin
 edt_pesquisa.Clear;
 adoquery_pesquisa.SQL.Text := 'SELECT * FROM SOCIOS';
 pk_socio := '';
end;

end.
