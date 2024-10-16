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
      DsSocios: TDataSource;
      adoquery_aux: TADOQuery;
      Label3: TLabel;
      btn_pesquisa: TBitBtn;
      edt_pesquisa: TMaskEdit;
      btn_limmpar: TBitBtn;
      RdInativo: TCheckBox;
      RdStatus: TRadioGroup;
      gridSocios: TDBGrid;
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
  var valorComparado : integer;
  valorComparadoString: String;
  comprimentoString, i: integer;
  begin
    if operacao = 'novo' then
      begin
        if (edt_nome.Text = '') or (edt_renda.Text = '') then
          ShowMessage('Preencha todos os campos')
        else
          if Length(edt_nome.text) <= 4 then
            ShowMessage('Digite pelo menos 5 caracteres no campo Nome !')
          else // INICIO ELSE  PARA VERIFICAR A RENDA
          begin
            comprimentoString := length(edt_renda.Text);
            for i := 1 to comprimentoString -1 do  //INICIO FOR PARA PERCORRER A STRING
            begin
              if edt_renda.Text[i] = '.' then   // INICIO IF VERIFICA��O '.'
              begin
                if i + 2 = comprimentoString then // INICIO IF VERIFICA��O SE O PONTO ESTA A DOIS CARACTERES NO FINAL DA STRING
                begin
                  adoquery_aux.SQL.Text := 'INSERT INTO SOCIOS VALUES('+
                                            QuotedStr(edt_nome.text)+
                                            ', :ativo,' +
                                            edt_renda.Text + ')';

                  if RdInativo.Checked = false then // INICIO IF PARA VER SE O RDiNATIVO ESTA MARCADO
                    adoquery_aux.Parameters.ParamByName('ativo').Value := 'ATIVO'
                  else
                  begin
                    adoquery_aux.Parameters.ParamByName('ativo').Value := 'INATIVO'
                  end;  // FIM IF PARA VER SE O RDiNATIVO ESTA MARCADO

                  fDataModule.conexaoDB.BeginTrans;
                  try
                    adoquery_aux.ExecSQL;
                    fDataModule.conexaoDB.CommitTrans;;
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
                  break;
                end
              else if i + 2 < comprimentoString then
              begin
                ShowMessage('Insira no formato Monetario sem separadores de milhar. Ex: 1000.90');
                break;
              end // FIM IF VERIFICA��O SE O PONTO ESTA A DOIS CARACTERES NO FINAL DA STRING
              else if i + 2 > comprimentoString then
              begin
                ShowMessage('Insira duas casas decimais apos o ponto. Ex: 1000.90');
                break;
              end;
            end
          else if edt_renda.Text[i] = ',' then
          begin
            ShowMessage('Utilize ponto no lugar da virgula. Ex: 100.90');
            break;
          end;
        end; // FIM FOR PARA PERCORRER A STRING
    end; // FIM ELSE PARA VERIFICAR A RENDA
  end // FIM IF OPERACAO = NOVO

  else if operacao = 'editar' then
  begin

  valorComparadoString := (StringReplace(edt_renda.text,'.','',[rfReplaceAll]));
  valorComparado := StrToint(StringReplace(valorComparadoString,',','',[rfReplaceAll]));

  if (edt_renda.Text =  '') or (edt_nome.Text = '') then
  begin
    ShowMessage('Preencha algum todos os campos !');
  end
  else if valorComparado <= 0 then
  begin
      ShowMessage('N�o � poss�vel inserir valores menores ou iguais a 0 !');
  end
  else
  begin
    comprimentoString := length(edt_renda.Text);
    for i := 1 to comprimentoString - 1 do
    begin //INICIO FOR
      if edt_renda.Text[i] = '.' then
      begin
        if i + 2 = comprimentoString then
        begin
          if RdInativo.Checked = true then
            atividade := QuotedStr('INATIVO')
          else
            atividade := QuotedStr('ATIVO');

          adoquery_aux.SQL.Text := 'UPDATE SOCIOS SET ' +
                                    ' NOME = ' + QuotedStr(edt_nome.Text)+ ','+
                                    ' ATIVO = ' + atividade + ','+
                                    ' RENDA =  '+ edt_renda.Text +
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

          ShowMessage('Informa��es alteradas!');
          bloqueia_campos;
          bloqueia_salvar(Sender);
          break;
        end
      else if i + 2 < comprimentoString then
        begin
          ShowMessage('Insira no formato Monetario sem separadores de milhar. Ex: 100.90');
          break;
        end
      else if i + 2 > comprimentoString then
        begin
          ShowMessage('Insira duas casas decimais apos o ponto. Ex: 100.90');
          break;
        end;
      end
      else if edt_renda.Text[i] = ',' then
      begin
        ShowMessage('Insira a renda no formato Ex : 1000.09');
        break;
      end;
    end;
  end;
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
    renda := adoquery_socios.fieldbyname('renda').AsString;
    edt_renda.Text := StringReplace(renda, ',','.',[rfreplaceall]);
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
    btn_novo.Enabled := true;
    btn_salvar.Enabled := false;
    btn_editar.Enabled := true;
    btn_cancelar.Enabled := false;
    btn_excluir.Enabled := true;
  end;

  procedure TFSocios.btn_pesquisaClick(Sender: TObject);
  begin
    if edt_pesquisa.Text = '' then
      ShowMessage('Impossivel Pesquisar !')
    else
    if RdStatus.ItemIndex = 0 then
       adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE NOME LIKE ' + QuotedStr(edt_pesquisa.Text+'%') +
                                    'AND ATIVO = '+QuotedStr('ATIVO')
    else if RdStatus.ItemIndex = 1 then
    begin
           adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE NOME LIKE ' + QuotedStr(edt_pesquisa.Text+'%') +
                                    'AND ATIVO = '+QuotedStr('INATIVO')
    end
    else
    begin
      adoquery_socios.SQL.Text := 'SELECT * FROM SOCIOS WHERE NOME LIKE ' +
                                  QuotedStr(edt_pesquisa.Text+'%');
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
      ShowMessage('Impossivel Selecionar !')
    else
      begin
        resposta := MessageDlg('Caso voc� exclua um socio voc� automaticamente'+
                      'remove todos os dependentes atrelados a ele.'+
                       'Tem certeza que deseja excluir ?', mtConfirmation, [mbYes, mbCancel],0);

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
            end;
          end;
      end;


  procedure TFSocios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  chave := '';
end;

end.
