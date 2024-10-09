program GerenciadorDeDependentes;

uses
  Forms,
  Unit_Login in 'Unit_Login.pas' {fLogin},
  Unit_dataModule in 'Unit_dataModule.pas' {fDataModule: TDataModule},
  Unit_Menu in 'Unit_Menu.pas' {fMenu},
  Unit_Socios in 'Unit_Socios.pas' {FSocios},
  Unit_Operadores in 'Unit_Operadores.pas' {FOperadores},
  Unit_Pesquisa in 'Unit_Pesquisa.pas' {FPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TfDataModule, fDataModule);
  Application.CreateForm(TFSocios, FSocios);
  Application.CreateForm(TFOperadores, FOperadores);
  Application.CreateForm(TFPesquisa, FPesquisa);
  if fLogin.autenticacao = false then
    begin
      Application.Terminate;
    end;
    
  Application.Run;

end.
