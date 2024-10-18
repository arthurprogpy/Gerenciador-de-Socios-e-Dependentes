unit Unit_Dependentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, Grids, DBGrids, DB, ADODB, StdCtrls, Buttons, ExtCtrls;

type
  TfDependentes = class(TForm)
    pnlRodape: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_nome: TEdit;
    edt_socio: TMaskEdit;
    btn_socio: TBitBtn;
    pnlTop: TPanel;
    cbSociosOuDependente: TComboBox;
    edt_pesquisar: TMaskEdit;
    btn_Limpar: TBitBtn;
    btn_pesqusiar: TBitBtn;
    Label5: TLabel;
    Label4: TLabel;
    pnlContent: TPanel;
    adoquery_aux: TADOQuery;
    adoquery_dependentes: TADOQuery;
    ds_dependendias: TDataSource;
    grid_dependencias: TDBGrid;
    edt_idade: TEdit;
    pnl_botoes: TPanel;
    btn_novo: TBitBtn;
    btn_editar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    btn_salvar: TBitBtn;
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
    procedure edt_idadeKeyPress(Sender: TObject; var Key: Char);
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
  for i := 1 to fDependentes.ComponentCount -1 do
    begin
      if fDependentes.Components[i] is TEdit then
        begin
          (fDependentes.Components[i] as TEdit).Enabled := false;
          (fDependentes.Components[i] as TEdit).color := clinfobk;
          btn_socio.Enabled := false;
          edt_idade.Enabled := False;
          edt_idade.Color := clInfoBk;
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
          btn_socio.Enabled := true;

          edt_idade.Enabled := true;
          edt_idade.Color := clwhite;
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
          edt_socio.Clear;
          edt_idade.Clear;
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


 adoquery_dependentes.SQL.Text := 'SELECT dependentes.ID AS ' + QuotedStr('ID DEPENDENTE')+','+
                                  ' Dependentes.nome AS '+QuotedStr('NOME DEPENDENTE')+',' +
                                  ' Dependentes.idade AS IDADE,'+
                                  '  socios.id AS '+QuotedStr('ID SOCIO')+','+
                                  ' socios.nome AS '+QuotedStr('NOME DO SOCIO')+
                                  '  FROM dependentes '+
                                  '  INNER JOIN socios '+
                                  '  ON dependentes.id_socio = socios.id'+
                                  ' WHERE SOCIOS.ATIVO = '+QuotedStr('ATIVO');

  adoquery_dependentes.Close;
  adoquery_dependentes.open;

  Id_dependente := '';
end;

procedure TfDependentes.btn_salvarClick(Sender: TObject);
begin
if operacao = 'novo' then
  begin
    if (Trim(edt_nome.Text) = '') or (Trim(edt_idade.Text) = '') or (Trim(edt_socio.Text )= '') then
      begin
        ShowMessage('Preencha todos os campos !');
      end
    else if Length(edt_nome.Text) <= 4 then
     begin
      ShowMessage('Insira Pelo Menos 4 caracteres no campo nome !');
     end
    else if StrToInt(edt_idade.Text) <= 0 then
      ShowMessage('A idade Tem que ser positiva !')
    else
      begin
        adoquery_aux.SQL.Text := 'INSERT INTO DEPENDENTES VALUES('+
                                  QuotedStr(edt_nome.Text) +','+
                                  QuotedStr(edt_idade.Text) +','+
                                  pk_socio+')';

        fDataModule.conexaoDB.BeginTrans;
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
      end;
    adoquery_dependentes.close;
    adoquery_dependentes.Open;
    end
else if operacao = 'editar' then
  begin
    if Length(edt_nome.Text) <= 4 then
    begin
      ShowMessage('Insira no minimo 5 caracteres !')
    end
    else if Id_dependente = '' then
      begin
        ShowMessage('Impossivel Editar !');
      end
    else
    begin
      adoquery_aux.SQL.Text := 'UPDATE DEPENDENTES SET ' +
                              ' NOME = ' + QuotedStr(edt_nome.Text)+','+
                              ' IDADE = ' + QuotedStr(edt_idade.Text)+','+
                              ' ID_SOCIO = ' +pk_socio+
                              ' WHERE ID = '+ Id_dependente;

      fDataModule.conexaoDB.BeginTrans;
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
  adoquery_dependentes.close;
  adoquery_dependentes.Open;
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
  if Id_dependente = '' then
    begin
      ShowMessage('Impossivel Editar, Selecione alguem !');
      bloqueia_salvar(Sender);
      bloqueia_campos;
    end
  else
    begin
      libera_salvar(Sender);
      libera_campos;
    end;
end;

procedure TfDependentes.grid_dependenciasCellClick(Column: TColumn);
begin
  edt_nome.Text := adoquery_dependentes.fieldbyname('NOME DEPENDENTE').AsString;
  edt_idade.text :=  adoquery_dependentes.fieldbyname('IDADE').AsString;
  id_socio :=  adoquery_dependentes.fieldbyname('ID SOCIO').AsString;
  Id_dependente := adoquery_dependentes.fieldbyname('ID DEPENDENTE').AsString;

  adoquery_aux.SQL.Text := 'SELECT * FROM SOCIOS WHERE ID = ' + id_socio;
  adoquery_aux.Close;
  adoquery_aux.open;
  edt_socio.Text := adoquery_aux.fieldbyname('NOME').AsString;
  bloqueia_campos;

  btn_novo.Enabled := true;
  btn_salvar.Enabled := false;
  btn_editar.Enabled := true;
  btn_cancelar.Enabled := false;
  btn_excluir.Enabled := true;
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
        try
        adoquery_aux.ExecSQL;
        except
          on E :exception do
          ShowMessage('Ocorreu o erro :'+E.Message);
        end;
        adoquery_dependentes.close;
        adoquery_dependentes.open;
        limpa_campos;
        Id_dependente := '';
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

procedure TfDependentes.btn_LimparClick(Sender: TObject);
begin
  edt_pesquisar.clear;
  adoquery_dependentes.Close;
  adoquery_dependentes.open;
  Id_dependente := '';
end;

procedure TfDependentes.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TfDependentes.edt_idadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

end.
