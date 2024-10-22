  unit Unit_Socios;

  interface

  uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, ADODB, Mask;

  type
    TFSocios = class(TForm)
    pnlTOp: TPanel;
    Label3: TLabel;
    btn_pesquisa: TBitBtn;
    edt_pesquisa: TMaskEdit;
    btn_limmpar: TBitBtn;
    RdStatus: TRadioGroup;
    adoquery_socios: TADOQuery;
    DsSocios: TDataSource;
    pnlBottom: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_nome: TEdit;
    edt_renda: TEdit;
    pnl_botoes: TPanel;
    btn_novo: TBitBtn;
    btn_editar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    btn_salvar: TBitBtn;
    RdInativo: TCheckBox;
    adoquery_aux: TADOQuery;
    pnlClient: TPanel;
    gridSocios: TDBGrid;
    adoquery_sociosID: TAutoIncField;
    adoquery_sociosNOME: TStringField;
    adoquery_sociosRENDA: TBCDField;
    adoquery_sociosATIVO: TStringField;
    Label4: TLabel;
    Label5: TLabel;
    edt_senha: TEdit;
    edt_UserSocio: TEdit;
    adoquery_sociossenha: TStringField;
    adoquery_sociosusuario: TStringField;
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

      procedure btn_pesquisaClick(Sender: TObject);
      procedure btn_limmparClick(Sender: TObject);
      procedure btn_cancelarClick(Sender: TObject);
      procedure btn_excluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_rendaChange(Sender: TObject);
    procedure edt_rendaKeyPress(Sender: TObject; var Key: Char);

    private
      { Private declarations }
    public
      { Public declarations }
    end;

  var
    FSocios: TFSocios;
    valorMonetario: currency;
    valorVerificado, chave, nome, renda, atividade: string;
    resposta: Integer;

  implementation

  uses Unit_Operadores, Unit_dataModule, Unit_Login;

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
    for i := 1 to FSocios.ComponentCount -1 do
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
    adoquery_socios.SQL.Text := ' SELECT * FROM SOCIOS';
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
    var valorComparado : integer;
    valorComparadoString: String;
    comprimentoString, i: integer;
    LRenda: Double;
    begin
      if operacao = 'novo' then
        begin
          if (Trim(edt_nome.Text) = '') or (Trim(edt_renda.Text) = '') or (Trim(edt_senha.text) = '') or (Trim(edt_UserSocio.Text) = '') then
            ShowMessage('Preencha todos os campos')
          else
            if Length(edt_nome.text) <= 4 then
              ShowMessage('Digite pelo menos 5 caracteres no campo Nome !')
            else // INICIO ELSE  PARA VERIFICAR A RENDA

            adoquery_aux.SQL.Text := 'INSERT INTO SOCIOS VALUES('+
                                              QuotedStr(edt_nome.text)+
                                              ', :ativo,' +
                                              edt_renda.Text +','+ 
                                              QuotedStr(fLogin.criptografa(edt_senha.Text))+','+
                                              QuotedStr(edt_UserSocio.Text)+')';

            ShowMessage(adoquery_aux.SQL.Text);
            
            if RdInativo.Checked = false then // INICIO IF PARA VER SE O RDiNATIVO ESTA MARCADO
              adoquery_aux.Parameters.ParamByName('ativo').Value := 'ATIVO'
            else
            begin
              adoquery_aux.Parameters.ParamByName('ativo').Value := 'INATIVO'
            end;  // FIM IF PARA VER SE O RDiNATIVO ESTA MARCADO

            fDataModule.conexaoDB.BeginTrans;
            try
              adoquery_aux.ExecSQL;
              fDataModule.conexaoDB.CommitTrans;
            except
            on E : exception do
              ShowMessage('Erro ao inserir: '+ E.message);
            end;

            ShowMessage('Usuario Inserido com Sucesso !');
            adoquery_socios.Close;;
            adoquery_socios.open;

            limpa_campos;
            bloqueia_salvar(Sender);
            bloqueia_campos;
        end
  else if operacao = 'editar' then
  begin

  valorComparadoString := (StringReplace(edt_renda.text,'.','',[rfReplaceAll]));
  valorComparado := StrToint(StringReplace(valorComparadoString,',','',[rfReplaceAll]));

  if (trim(edt_renda.Text) =  '') or (trim(edt_nome.Text) = '') then
  begin
    ShowMessage('Preencha algum todos os campos !');
  end
  else if valorComparado <= 0 then
  begin
      ShowMessage('Não é possível inserir valores menores ou iguais a 0 !');
  end
  else
    begin
          if RdInativo.Checked = true then
            atividade := QuotedStr('INATIVO')
          else
            atividade := QuotedStr('ATIVO');

          adoquery_aux.SQL.Text := 'UPDATE SOCIOS SET ' +
                                    ' NOME = ' + QuotedStr(edt_nome.Text)+ ','+
                                    ' ATIVO = ' + atividade + ','+
                                    ' RENDA =  '+ edt_renda.Text + ','+
                                    ' USUARIO = '+ QuotedStr(edt_UserSocio.Text) + ','+
                                    ' SENHA = ' + QuotedStr(fLogin.criptografa(edt_senha.Text)) +
                                    ' WHERE ID = ' + chave;

          fDataModule.conexaoDB.BeginTrans;
          try
            adoquery_aux.ExecSQL;
            fDataModule.conexaoDB.CommitTrans;

            adoquery_socios.Close;
            adoquery_socios.Open;
          except
            on E: exception do
              ShowMessage('Erro: ' + E.Message);
          end;

          ShowMessage('Informações alteradas!');
          bloqueia_campos;
          bloqueia_salvar(Sender);
        end
    end;
  end;
  procedure TFSocios.btn_editarClick(Sender: TObject);
  begin
    if chave <> '' then
      begin
        libera_salvar(Sender);
        libera_campos;
      end
    else
      begin
        ShowMessage('Impossivel alterar !');
      end;
  end;

  procedure TFSocios.Grid_sociosCellClick(Column: TColumn);
  var renda: string;
  begin

    edt_nome.Text := adoquery_socios.fieldbyname('nome').AsString;
    edt_renda.Text := FormatFloat('0.00', adoquery_socios.fieldbyname('renda').AsCurrency);
    nome := adoquery_socios.fieldbyname('nome').AsString;
    chave := adoquery_socios.Fields.Fields[0].AsString;
    edt_senha.Text := fLogin.descriptografa(adoquery_socios.fieldbyname('SENHA').AsString);
    edt_UserSocio.Text := adoquery_socios.fieldbyname('USUARIO').AsString;

    if adoquery_socios.fieldbyname('ativo').AsString = 'ATIVO' then
      begin
        RdInativo.checked := false
      end
    else
      begin
       RdInativo.checked := true;
      end;
    bloqueia_campos;
    btn_novo.Enabled := true;
    btn_salvar.Enabled := false;
    btn_editar.Enabled := true;
    btn_cancelar.Enabled := false;
    btn_excluir.Enabled := true;
  end;

  procedure TFSocios.btn_pesquisaClick(Sender: TObject);
  begin
    if (RdStatus.ItemIndex = 0) and (Trim(edt_pesquisa.Text) = '') then
      begin
        adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE ATIVO = '+QuotedStr('ATIVO');
      end
    else if (RdStatus.ItemIndex = 1) and (Trim(edt_pesquisa.Text) = '') then
      begin
        adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE ATIVO = '+QuotedStr('INATIVO');
      end
    else if (RdStatus.ItemIndex = 0) and (Trim(edt_pesquisa.Text) <> '') then
       begin
       adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE NOME LIKE ' + QuotedStr(edt_pesquisa.Text+'%') +
                                    'AND ATIVO = '+QuotedStr('ATIVO')
       end
    else if (RdStatus.ItemIndex = 1) and (Trim(edt_pesquisa.Text) <> '') then
      begin
        adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE NOME LIKE ' + QuotedStr(edt_pesquisa.Text+'%') +
                                    'AND ATIVO = '+QuotedStr('INATIVO')
      end;
    adoquery_socios.Close;
    adoquery_socios.Open;
  end;

  procedure TFSocios.btn_limmparClick(Sender: TObject);
  begin
    edt_pesquisa.Clear;
    adoquery_socios.SQL.Text := 'SELECT ID, NOME, ATIVO, RENDA FROM SOCIOS';
    adoquery_socios.close;
    adoquery_socios.Open;
    RdStatus.ItemIndex := 0;
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
      ShowMessage('Impossivel Excluir !')
    else
      begin
        resposta := MessageDlg('Caso você exclua um socio você automaticamente '+
                      'remove todos os dependentes atrelados a ele.'+
                       ' Tem certeza que deseja excluir ?', mtConfirmation, [mbYes, mbCancel],0);

        if resposta = mRyes then
          begin
            adoquery_aux.SQL.text := 'DELETE FROM DEPENDENTES WHERE ID_SOCIO = '+chave;
            try
            adoquery_aux.ExecSQL;
            except
            on E : exception do
              ShowMessage('Erro: '+E.Message);
            end;

            adoquery_aux.SQL.text := 'DELETE FROM SOCIOS WHERE ID = '+chave;
            try
            adoquery_aux.ExecSQL;
            except
            on E : exception do
              ShowMessage('Erro: '+E.Message);
            end;
            adoquery_socios.Close;
            adoquery_socios.Open;
            limpa_campos;
            chave := '';
            end;
          end;
      end;


  procedure TFSocios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  chave := '';
end;

procedure TFSocios.edt_rendaChange(Sender: TObject);
begin
  edt_renda.Text := StringReplace(edt_renda.Text, ',', '.', []);
  edt_renda.SelStart := Length(edt_renda.Text);
end;

procedure TFSocios.edt_rendaKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', ',', #8]) then
begin
  Key := #0;
end;
end;

end.
