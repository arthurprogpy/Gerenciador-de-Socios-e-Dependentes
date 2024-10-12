unit Unit_Socios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, ADODB, Mask;

type
  TFSocios = class(TForm)
    edt_nome: TEdit;
    edt_renda: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    pnl_botoes: TPanel;
    btn_novo: TBitBtn;
    btn_editar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    btn_salvar: TBitBtn;
    adoquery_socios: TADOQuery;
    Grid_socios: TDBGrid;
    DsSocios: TDataSource;
    adoquery_aux: TADOQuery;
    Label3: TLabel;
    btn_pesquisa: TBitBtn;
    edt_pesquisa: TMaskEdit;
    btn_limmpar: TBitBtn;
    RdInativo: TCheckBox;
    procedure limpa_campos;
    procedure bloqueia_campos;
    procedure bloqueia_salvar(Sender : TObject);
    procedure libera_salvar(Sender: TObject);
    procedure libera_campos;
    procedure FormShow(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_editarClick(Sender: TObject);
    procedure Grid_sociosCellClick(Column: TColumn);
    function formata_valor(valor, destino: String): String;
    procedure btn_pesquisaClick(Sender: TObject);
    procedure btn_limmparClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSocios: TFSocios;
  valorMonetario: currency;
  valorConvertido, chave, nome, renda, atividade: string;
  resposta: Integer;

implementation

uses Unit_Operadores, Unit_dataModule;

{$R *.dfm}

procedure TFSocios.bloqueia_campos;
var i: integer;
begin
  for i := 1 to FSocios.ComponentCount -1 do
    begin
      if FSocios.Components[i] is TEdit then
        begin
          (FSocios.Components[i] as TEdit).Enabled := false;
          (FSocios.Components[i] as TEdit).color := clinfobk;
          RdInativo.Enabled := false;
        end;
    end;
end;

procedure TFSocios.bloqueia_salvar(Sender: TObject);
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

procedure TFSocios.libera_campos;
  var i: integer;
begin
  for i := 1 to FOperadores.ComponentCount -1 do
    begin
      if FSocios.Components[i] is TEdit then
        begin
          (FSocios.Components[i] as TEdit).Enabled := true;
          (FSocios.Components[i] as TEdit).color := clwhite;
          RdInativo.Enabled := true;
        end;
    end;
end;

procedure TFSocios.libera_salvar(Sender: TObject);
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

procedure TFSocios.limpa_campos;
  var i: integer;
begin
  for i := 1 to FSocios.ComponentCount -1 do
    begin
      if FSocios.Components[i] is TEdit then
        begin
          (FSocios.Components[i] as TEdit).Clear;
        end;
    end;
end;

procedure TFSocios.FormShow(Sender: TObject);
begin
  bloqueia_campos;
  limpa_campos;
  bloqueia_salvar(Sender);

  adoquery_socios.Close;
  adoquery_socios.SQL.Text := ' SELECT ID, NOME, RENDA, ATIVO FROM SOCIOS';
  adoquery_socios.Open;
end;

procedure TFSocios.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TFSocios.btn_novoClick(Sender: TObject);
begin
  libera_salvar(Sender);
  limpa_campos;
  libera_campos;
end;

procedure TFSocios.btn_salvarClick(Sender: TObject);
begin
  if operacao = 'novo' then
    begin
      if (edt_nome.Text = '') or (edt_renda.Text = '') then
        ShowMessage('Preencha todos os campos')
      else
        if Length(edt_nome.text) <= 4 then
          ShowMessage('Digite pelo menos 5 caracteres no campo Nome !')
        else
          begin
          fDataModule.conexaoDB.BeginTrans;

          valorConvertido := formata_valor(edt_renda.Text, 'T');
          edt_renda.text := valorConvertido;

          if StrToFloat(valorConvertido) < 0 then
          begin
            ShowMessage('Impossivel Adicionar valores negativos');
            limpa_campos;
          end
          else
            begin
              adoquery_aux.SQL.Text := 'INSERT INTO SOCIOS VALUES('+
                                        QuotedStr(edt_nome.text)+
                                        ', :ativo,' +
                                        QuotedStr(valorConvertido)+ ')';

              if RdInativo.Checked = false then
                adoquery_aux.Parameters.ParamByName('ativo').Value := 'ATIVO'
              else
                begin
                  adoquery_aux.Parameters.ParamByName('ativo').Value := 'INATIVO'
                end;
        try
          adoquery_aux.ExecSQL;
          fDataModule.conexaoDB.CommitTrans;
          ShowMessage('Usuario Inserido com Sucesso !');
          adoquery_socios.Close;;
          adoquery_socios.open;
          limpa_campos;
          bloqueia_salvar(Sender);
          bloqueia_campos;
        except
        on E : exception do
          ShowMessage('Erro ao inserir: '+ E.message);
        end;
      end;
  end;
  end
    else if operacao = 'editar' then
      begin
        if chave = '' then
          ShowMessage('Impossivel Alterar')
        else if Length(edt_nome.Text) <= 4 then
          begin
            ShowMessage('Insira Pelo Menos 4 caracteres no campo nome !');
          end
        else
          begin
            fDataModule.conexaoDB.BeginTrans;

            libera_salvar(Sender);
            libera_campos;

            if RdInativo.Checked = true then
              atividade := QuotedStr('INATIVO')
            else
              begin
                atividade := QuotedStr('ATIVO');
              end;

            valorConvertido := formata_valor(edt_renda.Text, 'T');

            if StrToFloat(valorConvertido) < 0 then
            begin
              ShowMessage('Impossivel Adicionar valores negativos !');
              limpa_campos;
            end
             else if Length(edt_nome.Text) <= 4 then
              begin
                ShowMessage('Insira Pelo Menos 4 caracteres no campo nome !');
              end
            else
              begin
                adoquery_aux.SQL.Text := 'UPDATE SOCIOS SET ' +
                                        ' NOME = ' + QuotedStr(edt_nome.Text)+ ','+
                                        ' ATIVO = ' + atividade + ','+
                                        ' RENDA =  '+ valorConvertido +
                                        ' WHERE ID = ' + chave;

                ShowMessage(adoquery_aux.SQL.Text);
                try
                adoquery_aux.ExecSQL;
                fDataModule.conexaoDB.CommitTrans;
                ShowMessage('Informa��es alteradas !');

                adoquery_socios.close;
                adoquery_socios.Open;
                except
                on E: exception do
                  ShowMessage('Erro: ' + E.Message);
                end;
              end;
                bloqueia_salvar(Sender);
                bloqueia_campos;
          end;
    end;
end;
procedure TFSocios.btn_editarClick(Sender: TObject);
begin
  if chave <> '' then
    begin
      libera_campos;
      libera_salvar(Sender);
    end
  else
    begin
      ShowMessage('Impossivel alterar !');
    end;
end;

procedure TFSocios.Grid_sociosCellClick(Column: TColumn);
begin
  edt_nome.Text := adoquery_socios.fieldbyname('nome').AsString;
  edt_renda.Text := adoquery_socios.fieldbyname('renda').AsString;
  nome := adoquery_socios.fieldbyname('nome').AsString;
  chave := adoquery_socios.Fields.Fields[0].AsString;

  if adoquery_socios.fieldbyname('ativo').AsString = 'ATIVO' then
    begin
      RdInativo.checked := false
    end
  else
    begin
     RdInativo.checked := true;
    end;
  bloqueia_campos;

end;

function TfSocios.formata_valor(valor, destino: String): String;
var
  valor_formatado: String;
begin
  if valor = '' then
  begin
    Result := '';
    exit;
  end;

  valor_formatado := StringReplace(valor, 'R$', '', [rfReplaceAll]);
  valor_formatado := StringReplace(valor_formatado, '$', '', [rfReplaceAll]);

  valor_formatado := StringReplace(valor_formatado, ',', '.', [rfReplaceAll]);

  if destino = 'E' then
  begin
    Result := FormatCurr('#,##0.00', StrToCurr(valor_formatado));
  end
  else
  begin
    Result := valor_formatado;
  end;
end;
procedure TFSocios.btn_pesquisaClick(Sender: TObject);
begin
  if edt_pesquisa.Text = '' then
    ShowMessage('Impossivel Pesquisar !')
  else
    adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE NOME LIKE ' + QuotedStr(edt_pesquisa.Text+'%');
    adoquery_socios.Close;
    adoquery_socios.Open;
end;

procedure TFSocios.btn_limmparClick(Sender: TObject);
begin
  edt_pesquisa.Clear;
  adoquery_socios.SQL.Text := 'SELECT ID, NOME, ATIVO, RENDA FROM SOCIOS';
  adoquery_socios.close;
  adoquery_socios.Open;
end;

procedure TFSocios.btn_cancelarClick(Sender: TObject);
begin
  bloqueia_campos;
  bloqueia_salvar(Sender);
  limpa_campos;
  chave := '';
end;

procedure TFSocios.btn_excluirClick(Sender: TObject);
begin
  if chave = '' then
    ShowMessage('Impossivel Selecionar')
  else
    begin
      resposta := MessageDlg('Caso voc� exclua um socio voc� automaticamente'+
                    'remove todos os dependentes atrelados a ele.'+
                     'Tem certeza que deseja excluir ?', mtConfirmation, [mbYes, mbCancel],0);

      if resposta = mRyes then
        begin
          adoquery_aux.SQL.text := 'DELETE FROM DEPENDENTES WHERE ID_SOCIO = '+chave;
          adoquery_aux.ExecSQL;
          adoquery_aux.SQL.text := 'DELETE FROM SOCIOS WHERE ID = '+chave;
          adoquery_aux.ExecSQL;
        end;
    end;
end;

end.
