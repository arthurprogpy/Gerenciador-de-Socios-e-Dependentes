unit Unit_Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfLogin = class(TForm)
    edt_usuario: TEdit;
    edt_senha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btn_entrar: TBitBtn;
    btn_sair: TBitBtn;
    adoquery_login: TADOQuery;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_entrarClick(Sender: TObject);
    function descriptografa (texto :String) :String;
    function criptografa(texto: String) : String;
    procedure BitBtn1Click(Sender: TObject);
    function validacao(usuario, senha: string) :boolean;
    function autenticacao :boolean;
    function formata_valor(valor, destino: String) : String;
  private
    { Private declarations }
    senha : String;
  public

  end;

var
  fLogin: TfLogin;
  usuario, ID: String;
implementation

uses Unit_dataModule, Unit_Menu;

{$R *.dfm}

procedure TfLogin.btn_sairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfLogin.btn_entrarClick(Sender: TObject);
begin
  if (edt_usuario.Text = '') or (edt_senha.Text = '') then
    begin
      ShowMessage('Preencha todos os campos !');
    end
  else
    begin
      validacao(edt_usuario.Text, edt_senha.Text);
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

function TfLogin.validacao(usuario, senha: string): boolean;
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
      senha := adoquery_login.fieldbyname('senha').AsString;
        if edt_senha.Text <> descriptografa(senha) then
          begin
            ShowMessage('Senha Incorreta');
            Result := false;
          end
        else
          begin
            usuario := adoquery_login.fieldbyname('usuario').AsString;
            id := adoquery_login.fieldbyname('ID').AsString;
            if fMenu = nil  then
              begin
                Application.CreateForm(TfMenu, fMenu);
              end;
            fMenu.Show;
            fLogin.Hide;
            Result := true;
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
     ShowMessage('Não foi possivel se conectar ao banco !');
     result := false;
  end;
end;

function TfLogin.formata_valor(valor, destino: String): String;
var
valor_formatado: String;
i: integer;
begin
  if (valor = '') or (destino = '') then
    begin
      Result := '';
      exit;
    end;
    valor_formatado := valor;
    Delete(valor_formatado, pos('R', valor_formatado), 1);
    Delete(valor_formatado, pos('$', valor_formatado), 1);
    Delete(valor_formatado, pos('.', valor_formatado), 1);

    valor_formatado := Trim(valor_formatado);

    if destino = 'T' then
    begin
      Result := FormatCurr('#,##0.00', StrToCurr(valor_formatado))
    end
    else if destino = 'E' then
      begin
        Result := valor_formatado
      end
    else if destino = 'B' then
      begin
        for i := 1 to length(valor_formatado) do
          begin
            if valor_formatado[i] = ',' then
              valor_formatado[i] := '.';
          end;
          Result := valor_formatado;
      end
end;

end.
