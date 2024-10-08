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
    procedure FormShow(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_entrarClick(Sender: TObject);
  private
    { Private declarations }
    senha : String;
  public

  end;

var
  fLogin: TfLogin;
  usuario: String;
implementation

uses Unit_dataModule, Unit_Menu;

{$R *.dfm}

procedure TfLogin.FormShow(Sender: TObject);
begin
  fDataModule.conexaoDB.ConnectionString := 'Provider=SQLOLEDB.1; '+
                                      'Initial Catalog=Gerenciador de Socios;'+
                                      'Data Source=DESKTOP-L66KA8R;';

  fDataModule.conexaoDB.Open('operador_socios', '123');
end;

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
      adoquery_login.SQL.Text := 'SELECT * FROM OPERADORES WHERE ' +
                                QuotedStr(edt_usuario.Text);
      adoquery_login.Open;

      if adoquery_login.IsEmpty then
        begin
          ShowMessage('Não existe nenhum cadastro com este usuário !');
        end
      else
        begin
          senha := adoquery_login.FieldByName('senha').AsString;

          if edt_senha.Text <> senha then
            begin
              ShowMessage('Senha Incorreta !');
            end
          else
            fLogin.Hide;
            usuario := edt_usuario.text;
            FMenu.show;
          end;
        end;
     end;
end.
