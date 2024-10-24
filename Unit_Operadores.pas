unit Unit_Operadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TFOperadores = class(TForm)
    adoquery_operadores: TADOQuery;
    pnlClient: TPanel;
    Usuario: TLabel;
    edt_usuario: TEdit;
    Senha: TLabel;
    edt_senha: TEdit;
    edt_nome: TEdit;
    Nome: TLabel;
    Panel1: TPanel;
    btn_novo: TBitBtn;
    btn_editar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    btn_salvar: TBitBtn;
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
    procedure bloqueia_salvar(Sender : TObject);
    procedure libera_salvar (Sender : TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperadores: TFOperadores;
  operacao : String;
  Pk: String;

implementation

uses Unit_dataModule, Unit_Login, Unit_Pesquisa;

{$R *.dfm}


procedure TFOperadores.bloqueia_campos;
var i: integer;
begin
  for i := 1 to FOperadores.ComponentCount -1 do
    begin
      if FOperadores.Components[i] is TEdit then
        begin
          (FOperadores.Components[i] as TEdit).Enabled := false;
          (FOperadores.Components[i] as TEdit).color := clinfobk;
        end;
    end
end;

procedure TFOperadores.bloqueia_salvar(Sender: TObject);
begin
  btn_novo.Enabled := true;
  btn_salvar.Enabled := false;
  btn_editar.Enabled := true;
  btn_cancelar.Enabled := false;
  btn_excluir.Enabled := true;

  if Sender = btn_novo then
    operacao := 'novo'
  else if Sender = btn_salvar then
    operacao := 'salvar'
  else if Sender = btn_editar then
    operacao := 'editar'
  else if Sender = btn_cancelar then
    operacao := 'cancelar'
  else if Sender = btn_excluir then
    operacao := 'excluir'
end;

procedure TFOperadores.libera_campos;
  var i: integer;
begin
  for i := 1 to FOperadores.ComponentCount -1 do
    begin
      if FOperadores.Components[i] is TEdit then
        begin
          (FOperadores.Components[i] as TEdit).Enabled := true;
          (FOperadores.Components[i] as TEdit).color := clwhite;
        end;
    end
end;

procedure TFOperadores.libera_salvar(Sender: TObject);
begin
  btn_novo.Enabled := false;
  btn_salvar.Enabled := true;
  btn_editar.Enabled := false;
  btn_cancelar.Enabled := true;
  btn_excluir.Enabled := false;

  if Sender = btn_novo then
    operacao := 'novo'
  else if Sender = btn_salvar then
    operacao := 'salvar'
  else if Sender = btn_editar then
    operacao := 'editar'
  else if Sender = btn_cancelar then
    operacao := 'cancelar'
  else if Sender = btn_excluir then
    operacao := 'excluir'
end;

procedure TFOperadores.limpa_campos;
  var i: integer;
begin
  for i := 1 to FOperadores.ComponentCount -1 do
    begin
      if FOperadores.Components[i] is TEdit then
        begin
          (FOperadores.Components[i] as TEdit).Clear;
        end;
    end
end;

procedure TFOperadores.FormShow(Sender: TObject);
begin
  bloqueia_salvar(Sender);
  limpa_campos;
  bloqueia_campos;
end;

procedure TFOperadores.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TFOperadores.btn_novoClick(Sender: TObject);
begin
  libera_salvar(Sender);
  libera_campos;
  limpa_campos;
end;

procedure TFOperadores.btn_cancelarClick(Sender: TObject);
begin
  libera_campos;
  bloqueia_campos;
  bloqueia_salvar(Sender);
end;

procedure TFOperadores.btn_salvarClick(Sender: TObject);
begin
  if (Trim(edt_usuario.Text) = '') or  (Trim(edt_senha.text) = '') or (Trim(edt_nome.Text) = '')
   then
    ShowMessage('Preencha todos os Campos !')
  else
    begin
      if operacao = 'novo' then
        begin
          fDataModule.conexaoDB.BeginTrans;

          adoquery_operadores.SQL.Text := 'INSERT INTO OPERADORES(USUARIO, NOME, SENHA, TIPO_ACESSO)' +
                                            ' VALUES(' +
                                            QuotedStr(edt_usuario.Text)+','+
                                            QuotedStr(edt_nome.Text)+','+
                                            QuotedStr(FLogin.criptografa(edt_senha.Text))+')';

          try
            adoquery_operadores.ExecSQL;
            fDataModule.conexaoDB.CommitTrans;
          except
          on E : exception do
            ShowMessage('Erro: ' + E.message);
          end;

          bloqueia_campos;
          bloqueia_salvar(Sender);
      end
     else if operacao = 'editar' then
      begin
        adoquery_operadores.SQL.Text := 'UPDATE OPERADORES SET USUARIO = ' +
                                            QuotedStr(edt_usuario.Text) +','+
                                            'NOME = '+ QuotedStr(edt_nome.Text) +','+
                                            'SENHA = ' + fLogin.criptografa(QuotedStr(edt_senha.Text)) +
                                            ' WHERE ID = ' + id;

          fDataModule.conexaoDB.BeginTrans;
          try
          adoquery_operadores.ExecSQL;
           fDataModule.conexaoDB.CommitTrans;
          except
          on E : exception do
            ShowMessage('Erro: ' + E.message);
          end;
          bloqueia_campos;
          bloqueia_salvar(Sender);
         end;
      end;   
  end;

procedure TFOperadores.btn_editarClick(Sender: TObject);
begin
  adoquery_operadores.SQL.Text := 'SELECT * FROM OPERADORES WHERE ID = :ID';
  adoquery_operadores.Parameters.ParamByName('id').Value := id;
  adoquery_operadores.Open;

  edt_nome.Text := adoquery_operadores.FieldByName('NOME').AsString;
  edt_senha.Text := fLogin.descriptografa(adoquery_operadores.FieldByName('senha').AsString);
  edt_usuario.Text := adoquery_operadores.FieldByName('usuario').AsString;

  libera_campos;
  libera_salvar(Sender);
end;

end.
