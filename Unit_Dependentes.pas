unit Unit_Dependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TfDependentes = class(TForm)
    pnl_botoes: TPanel;
    btn_novo: TBitBtn;
    btn_editar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    btn_salvar: TBitBtn;
    edt_nome: TEdit;
    Label1: TLabel;
    edt_idade: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ds_dependendias: TDataSource;
    adoquery_dependentes: TADOQuery;
    adoquery_aux: TADOQuery;
    grid_dependencias: TDBGrid;
    edt_pesquisar: TMaskEdit;
    Label4: TLabel;
    btn_pesqusiar: TBitBtn;
    btn_Limpar: TBitBtn;
    edt_socio: TMaskEdit;
    btn_socio: TBitBtn;
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure bloqueia_salvar(Sender: TObject);
    procedure libera_salvar(Sender: TObject);
    procedure limpa_campos;
    procedure btn_novoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_socioClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure grid_dependenciasCellClick(Column: TColumn);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_pesqusiarClick(Sender: TObject);
    procedure btn_LimparClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDependentes: TfDependentes;
  operacao, chave, id_socio, Id_dependente: String;
  resposta: integer;
implementation

uses Unit_Socios, Unit_dataModule, Unit_Pesquisa;

{$R *.dfm}

procedure TfDependentes.bloqueia_campos;
var i: integer;
begin
  for i := 1 to FSocios.ComponentCount -1 do
    begin
      if fDependentes.Components[i] is TEdit then
        begin
          (fDependentes.Components[i] as TEdit).Enabled := false;
          (fDependentes.Components[i] as TEdit).color := clinfobk;
        end;
    end;
end;

procedure TfDependentes.bloqueia_salvar(Sender: TObject);
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

procedure TfDependentes.libera_campos;
  var i: integer;
begin
  for i := 1 to fDependentes.ComponentCount -1 do
    begin
      if fDependentes.Components[i] is TEdit then
        begin
          (fDependentes.Components[i] as TEdit).Enabled := true;
          (fDependentes.Components[i] as TEdit).color := clwhite;
          btn_pesqusiar.Enabled := true;
        end;
    end;
end;

procedure TfDependentes.libera_salvar(Sender: TObject);
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

procedure TfDependentes.limpa_campos;
  var i: integer;
begin
  for i := 1 to fDependentes.ComponentCount -1 do
    begin
      if FDependentes.Components[i] is TEdit then
        begin
          (FDependentes.Components[i] as TEdit).Clear;
        end;
    end;
end;

procedure TfDependentes.btn_novoClick(Sender: TObject);
begin
  libera_salvar(Sender);
  chave := '';
  libera_campos;
  limpa_campos;
end;

procedure TfDependentes.FormShow(Sender: TObject);
begin
  bloqueia_campos;
  bloqueia_salvar(Sender);
  limpa_campos;

  adoquery_dependentes.SQL.Text := 'SELECT * FROM DEPENDENTES';
  adoquery_dependentes.open;
end;

procedure TfDependentes.btn_salvarClick(Sender: TObject);
begin
fDataModule.conexaoDB.BeginTrans;
if operacao = 'novo' then
  begin
    if (edt_nome.Text = '') or (edt_idade.Text = '') or (edt_socio.Text = '') then
      begin
        ShowMessage('Preencha todos os campos !');
      end
    else if Length(edt_nome.Text) <= 4 then
     begin
      ShowMessage('Insira Pelo Menos 4 caracteres no campo nome !');
     end
    else
      begin
        adoquery_aux.SQL.Text := 'INSERT INTO DEPENDENTES VALUES('+
                                  QuotedStr(edt_nome.Text) +','+
                                  QuotedStr(edt_idade.Text) +','+
                                  pk_socio+')';
        try
        adoquery_aux.ExecSQL;
        fDataModule.conexaoDB.CommitTrans;
        except
        on E: exception do
          ShowMessage('Erro: '+ E.Message);
        end;
        bloqueia_campos;
        bloqueia_salvar(Sender);
        limpa_campos;
        adoquery_dependentes.close;
        adoquery_dependentes.Open;
      end;
    end
else if operacao = 'editar' then
  begin
    if Length(edt_nome.Text) <= 4 then
    begin
      ShowMessage('Insira no minimo 5 caracteres !')
    end
    else
    begin
      adoquery_aux.SQL.Text := 'UPDATE DEPENDENTES SET ' +
                              ' NOME = ' + QuotedStr(edt_nome.Text)+','+
                              ' IDADE = ' + QuotedStr(edt_idade.Text)+','+
                              ' ID_SOCIO = ' + id_socio+
                              ' WHERE ID = '+ Id_dependente;

 //   ShowMessage(adoquery_aux.SQL.Text);
      try
      adoquery_aux.ExecSQL;
      ShowMessage('Informações atualizadas com sucesso');
      fDataModule.conexaoDB.CommitTrans;
      except
      on E : exception do
      ShowMessage('Erro: '+E.message);
      end;
      adoquery_dependentes.Close;
      adoquery_dependentes.open;
      bloqueia_campos;
      bloqueia_salvar(Sender);
      limpa_campos;
  end;
end;
end;
procedure TfDependentes.btn_socioClick(Sender: TObject);
begin
  if FPesquisa = nil then
    Application.CreateForm(TfDependentes, fDependentes);
  FPesquisa.ShowModal;
end;

procedure TfDependentes.btn_editarClick(Sender: TObject);
begin
  limpa_campos;
  libera_salvar(Sender);
  libera_campos;
end;

procedure TfDependentes.grid_dependenciasCellClick(Column: TColumn);
begin
  edt_nome.Text := adoquery_dependentes.fieldbyname('NOME').AsString;
  edt_idade.text :=  adoquery_dependentes.fieldbyname('IDADE').AsString;
  id_socio :=  adoquery_dependentes.fieldbyname('ID_SOCIO').AsString;
  Id_dependente := adoquery_dependentes.fieldbyname('ID').AsString;

  adoquery_aux.SQL.Text := 'SELECT * FROM SOCIOS WHERE ID = ' + id_socio;
  adoquery_aux.Close;
  adoquery_aux.open;
  edt_socio.Text := adoquery_aux.fieldbyname('NOME').AsString;
end;

procedure TfDependentes.btn_excluirClick(Sender: TObject);
begin
 if Id_dependente = '' then
    ShowMessage('Impossivel Excluir !')
 else
  begin
    resposta := MessageDlg('Realmente Deseja excluir este dependente ?', mtConfirmation,[mbYes, mbNo], 0);
      if resposta = mrYes then
        adoquery_aux.SQL.Text := 'DELETE FROM DEPENDENTES WHERE ID = '+ Id_dependente;
        adoquery_aux.ExecSQL;
        adoquery_dependentes.close;
        adoquery_dependentes.open;
        limpa_campos;
  end;
end;

procedure TfDependentes.btn_cancelarClick(Sender: TObject);
begin
  bloqueia_salvar(Sender);
  bloqueia_campos;
  limpa_campos;
end;

procedure TfDependentes.btn_pesqusiarClick(Sender: TObject);
begin
  if edt_pesquisar.Text = '' then
    ShowMessage('Impossivel Pesquisar')
  else
    begin
      adoquery_dependentes.SQL.Text := 'SELECT * FROM DEPENDENTES WHERE NOME LIKE '+
                                        QuotedStr(edt_pesquisar.text+'%');

      adoquery_dependentes.close;
      adoquery_dependentes.open;
    end;
end;

procedure TfDependentes.btn_LimparClick(Sender: TObject);
begin
  edt_pesquisar.clear;
  adoquery_dependentes.Close;
  adoquery_dependentes.open;

end;

procedure TfDependentes.btn_fecharClick(Sender: TObject);
begin
  close;
end;

end.
