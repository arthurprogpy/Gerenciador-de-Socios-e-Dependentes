unit Unit_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, ExtCtrls;

type
  TfLogin = class(TForm)
    edt_usuario: TEdit;
    edt_senha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btn_entrar: TBitBtn;
    btn_sair: TBitBtn;
    adoquery_login: TADOQuery;
    imgUser: TImage;
    imgPass: TImage;
    cb_tipoLogin: TComboBox;
    lbl1: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_entrarClick(Sender: TObject);
    function descriptografa (texto :String) :String;
    function criptografa(texto: String) : String;
    procedure BitBtn1Click(Sender: TObject);
    function validacao(tipo: integer; usuario, senha: string) :boolean;
    function autenticacao :boolean;
  private
    { Private declarations }

  public
    tipo_acesso: String;
  end;

var
  fLogin: TfLogin;
  usuario, ID, renda, ativo, senha, nome: String;
implementation

uses Unit_dataModule, Unit_Menu, Unit_MenuSocios;

{$R *.dfm}

procedure TfLogin.btn_sairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfLogin.btn_entrarClick(Sender: TObject);
begin
  if (trim(edt_usuario.Text) = '') or (trim(edt_senha.Text) = '')  then
    begin
      ShowMessage('Preencha todos os campos !');
    end
  else
    begin
      if validacao(cb_tipoLogin.ItemIndex, edt_usuario.Text, edt_senha.Text) = True then
        begin
          if tipo_acesso = 'OPERADOR' then
            begin
              if fMenu = nil then
                begin
                  Application.CreateForm(TfMenu, fMenu);
                  fMenu.Show;
                  fLogin.Hide;
                end;
            end
          else if tipo_acesso = 'SOCIO' then
            begin
              if fMenuSocios = nil then
                begin
                  Application.CreateForm(TfMenuSocios, fMenuSocios);
                end;
              id := adoquery_login.fieldbyname('ID').AsString;
              nome := adoquery_login.fieldbyname('NOME').AsString;
              ativo := adoquery_login.fieldbyname('ATIVO').AsString;
              renda := FormatFloat(',0.00', adoquery_login.fieldbyname('renda').AsCurrency);
              usuario := adoquery_login.fieldbyname('USUARIO').AsString;
              senha := descriptografa(adoquery_login.fieldbyname('SENHA').AsString);
              fMenuSocios.Show;
              fLogin.Hide;

            end;
        end;
     end;
end;
function TfLogin.descriptografa(texto: String): String;
var
  i, cod_ascii : integer;
  descripto: String;
begin
  i := length(texto) + 1;
  while i > 1 do
  begin
    i := i - 3;
    cod_ascii := StrToInt(copy(texto, i,3));
    descripto := descripto + chr(cod_ascii);
   end;
  Result := descripto;

end;
function TfLogin.criptografa(texto: String): String;
var
  i :integer;
  cripto, cod_ascii : string;
begin
  cripto := '';

  for i := length(texto) downto 1 do
    begin
      cod_ascii :=  IntToStr(ord(texto[i]));
      cod_ascii := StringOfChar('0', 3-Length(cod_ascii)) + cod_ascii;
      cripto := cripto + cod_ascii;
    end;
  Result := cripto;
end;
procedure TfLogin.BitBtn1Click(Sender: TObject);
begin
  edt_senha.Text := criptografa(edt_usuario.Text);
end;

function TfLogin.validacao(tipo : Integer;usuario, senha: string): boolean;
begin
  if tipo = 0 then
    begin
      adoquery_login.SQL.Text := 'SELECT * FROM SOCIOS WHERE USUARIO = ' +
                              QuotedStr(edt_usuario.Text);

      adoquery_login.Open;

      if adoquery_login.IsEmpty then
        begin
          ShowMessage('Nenhum Usuario Cadastrado !');
          Result := false;
        end
      else
        begin
          senha := descriptografa(adoquery_login.fieldbyname('senha').AsString);
            if edt_senha.Text <> senha then
              begin
                ShowMessage('Senha Incorreta');
                Result := false;
              end
            else
              begin
                tipo_acesso := 'SOCIO';
                Result := true;
              end;
        end;
    end
  else if tipo = 1 then
    begin
      adoquery_login.SQL.Text := 'SELECT * FROM OPERADORES WHERE USUARIO = ' +
                              QuotedStr(edt_usuario.Text);

      adoquery_login.Open;

      if adoquery_login.IsEmpty then
        begin
          ShowMessage('Nenhum Usuario Cadastrado !');
          Result := false;
        end
      else
        begin
          senha := descriptografa(adoquery_login.fieldbyname('senha').AsString);
            if edt_senha.Text <> senha then
              begin
                ShowMessage('Senha Incorreta');
                Result := false;
              end
            else
              begin
                usuario := adoquery_login.fieldbyname('usuario').AsString;
                id := adoquery_login.fieldbyname('ID').AsString;
                tipo_acesso := 'OPERADOR';

                Result := true;
              end;
        end;
    end;
end;

function TfLogin.autenticacao: boolean;
begin
  fDataModule.conexaoDB.ConnectionString := 'Provider=SQLOLEDB.1; '+
                                      'Initial Catalog=Gerenciador de Socios;'+
                                      'Data Source=DESKTOP-L66KA8R;';
  try
    fDataModule.conexaoDB.Open('operador_socios', '123');
    result := true;
  except
     ShowMessage('N�o foi possivel se conectar ao banco !');
     result := false;
  end;
end;

end.
