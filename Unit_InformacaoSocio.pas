unit Unit_InformacaoSocio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TfInformacoesSocio = class(TForm)
    adoquery_aux: TADOQuery;
    pnlBottom: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_nome: TEdit;
    edt_renda: TEdit;
    pnl_botoes: TPanel;
    btn_editar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_fechar: TBitBtn;
    btn_salvar: TBitBtn;
    RdInativo: TCheckBox;
    edt_senha: TEdit;
    edt_UserSocio: TEdit;
    adoquery_socios: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure bloqueia_salvar(Sender: TObject);
    procedure libera_salvar(Sender: TObject);
    procedure limpa_campos;
    procedure btn_editarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    operacao: String;
  end;

var
  fInformacoesSocio: TfInformacoesSocio;

implementation

uses
  Unit_Login, Unit_dataModule;

{$R *.dfm}

procedure TfInformacoesSocio.FormShow(Sender: TObject);
begin
  bloqueia_campos;
  bloqueia_salvar(Sender);
  limpa_campos;

  adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE ID = '+ID;
  adoquery_socios.Close;
  adoquery_socios.Open;

  edt_nome.Text := adoquery_socios.fieldbyname('NOME').AsString;
  edt_renda.Text := FormatFloat(',0.00', adoquery_socios.fieldbyname('renda').AsCurrency);
  edt_senha.Text := fLogin.descriptografa(adoquery_socios.fieldbyname('Senha').AsString);
  edt_UserSocio.Text := adoquery_socios.fieldbyname('USUARIO').AsString;
end;

procedure TfInformacoesSocio.bloqueia_campos;
var i: integer;
begin
  for i := 1 to fInformacoesSocio.ComponentCount -1 do
    begin
      if fInformacoesSocio.Components[i] is TEdit then
        begin
          (fInformacoesSocio.Components[i] as TEdit).Enabled := false;
          (fInformacoesSocio.Components[i] as TEdit).color := clinfobk;
        end;
    end;
end;

procedure TfInformacoesSocio.bloqueia_salvar(Sender: TObject);
begin

  btn_salvar.Enabled := false;
  btn_editar.Enabled := true;
  btn_cancelar.Enabled := false;


  if Sender = btn_salvar then
    operacao := 'salvar'
  else if Sender = btn_editar then
    operacao := 'editar'
  else if Sender = btn_cancelar then
    operacao := 'cancelar'

end;

procedure TfInformacoesSocio.libera_campos;
  var i: integer;
begin
  for i := 1 to fInformacoesSocio.ComponentCount -1 do
    begin
      if fInformacoesSocio.Components[i] is TEdit then
        begin
          (fInformacoesSocio.Components[i] as TEdit).Enabled := true;
          (fInformacoesSocio.Components[i] as TEdit).color := clwhite;
        end;
    end;
end;

procedure TfInformacoesSocio.libera_salvar(Sender: TObject);
begin

  btn_salvar.Enabled := true;
  btn_editar.Enabled := false;
  btn_cancelar.Enabled := true;

  if Sender = btn_salvar then
    operacao := 'salvar'
  else if Sender = btn_editar then
    operacao := 'editar'
  else if Sender = btn_cancelar then
    operacao := 'cancelar'

end;

procedure TfInformacoesSocio.limpa_campos;
  var i: integer;
begin
  for i := 1 to fInformacoesSocio.ComponentCount -1 do
    begin
      if fInformacoesSocio.Components[i] is TEdit then
        begin
          (fInformacoesSocio.Components[i] as TEdit).Clear;
        end;
    end;
end;

procedure TfInformacoesSocio.btn_editarClick(Sender: TObject);
begin
  libera_salvar(Sender);
  libera_campos;
end;

procedure TfInformacoesSocio.btn_salvarClick(Sender: TObject);
var Lativo: string;
begin
  if (trim(edt_nome.Text) = '') or (Trim(edt_UserSocio.Text) = '') or (Trim(edt_senha.Text) = '') then
    begin
      ShowMessage('Preencha todos os campos')
    end
  else
    begin
      adoquery_aux.SQL.Text := 'UPDATE SOCIOS SET NOME = '+QuotedStr(edt_nome.Text) +','+
                                  ' USUARIO = '+ QuotedStr(edt_UserSocio.Text)+','+
                                  ' SENHA = '+ QuotedStr(fLogin.criptografa(edt_senha.Text))+
                                  ' WHERE ID = '+ID;

      fDataModule.conexaoDB.BeginTrans;
      try
        adoquery_aux.ExecSQL;
        fDataModule.conexaoDB.CommitTrans;
        ShowMessage('Informações atualizadas!');
      except
      on E: Exception do
        ShowMessage('Erro: '+E.Message);
      end;
        adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE ID = '+ID;
        adoquery_socios.Close;
        adoquery_socios.Open;

        edt_nome.Text := adoquery_socios.fieldbyname('NOME').AsString;
        edt_renda.Text := FormatFloat(',0.00', adoquery_socios.fieldbyname('renda').AsCurrency);
        edt_senha.Text := fLogin.descriptografa(adoquery_socios.fieldbyname('Senha').AsString);
        edt_UserSocio.Text := adoquery_socios.fieldbyname('USUARIO').AsString;

        Lativo :=  adoquery_socios.fieldbyname('ativo').AsString;
        if Lativo = 'Ativo' then
          RdInativo.Checked := False
        else
         RdInativo.Checked := True;


        bloqueia_salvar(Sender);
        bloqueia_campos;
    end;
end;

end.
