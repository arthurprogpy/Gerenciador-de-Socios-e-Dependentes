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
    procedure FormShow(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);


  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  FPesquisa: TFPesquisa;
  sql_pesquisa: string;
  chave: String;

implementation

uses Unit_dataModule;

{$R *.dfm}

procedure TFPesquisa.FormShow(Sender: TObject);
begin
  adoquery_pesquisa.SQL.Text := sql_pesquisa;
end;

procedure TFPesquisa.btn_selecionarClick(Sender: TObject);
begin
  if adoquery_pesquisa.Active = false  then
    ShowMessage('Impossivel Selecionar')
  else
    begin
      chave := adoquery_pesquisa.Fields[0].AsString;
      adoquery_pesquisa.Close;
      FPesquisa.Close;
      edt_pesquisa.Clear;
    end;
end;

procedure TFPesquisa.btn_pesquisarClick(Sender: TObject);
begin
  adoquery_pesquisa.SQL.text := sql_pesquisa + ' WHERE USUARIO LIKE '+
                                              QuotedStr(edt_pesquisa.text+'%');

  adoquery_pesquisa.Open;
end;

procedure TFPesquisa.btn_fecharClick(Sender: TObject);
begin
  close;
  edt_pesquisa.clear;
  adoquery_pesquisa.Close;
  chave := '';
end;

end.
