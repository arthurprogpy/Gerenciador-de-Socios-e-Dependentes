program GerenciadorDeDependentes;

uses
  Forms,
  Unit_Login in 'Unit_Login.pas' {fLogin},
  Unit_dataModule in 'Unit_dataModule.pas' {fDataModule: TDataModule},
  Unit_Menu in 'Unit_Menu.pas' {fMenu},
  Unit_Socios in 'Unit_Socios.pas' {FSocios},
  Unit_Operadores in 'Unit_Operadores.pas' {FOperadores},
  Unit_Pesquisa in 'Unit_Pesquisa.pas' {FPesquisa},
  Unit_Dependentes in 'Unit_Dependentes.pas' {fDependentes},
  Unit_Relatoires in 'Unit_Relatoires.pas' {FRelatorioSocios},
  Unit_seleciona_socios in 'Unit_seleciona_socios.pas' {fSelecionaSocio},
  Unit_teste in 'Unit_teste.pas' {Form1},
  Unit_MenuSocios in 'Unit_MenuSocios.pas' {fMenuSocios},
  Unit_InformacaoSocio in 'Unit_InformacaoSocio.pas' {fInformacoesSocio},
  Unit_SociosDependentes in 'Unit_SociosDependentes.pas' {FDependetesSocios};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Gerenciador de Socios e Dependentes';
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TfDataModule, fDataModule);
  Application.CreateForm(TFPesquisa, FPesquisa);
  Application.CreateForm(TfMenuSocios, fMenuSocios);
  Application.CreateForm(TfInformacoesSocio, fInformacoesSocio);
  Application.CreateForm(TFDependetesSocios, FDependetesSocios);
  if fLogin.autenticacao = false then
    begin
      Application.Terminate;
    end;
    
  Application.Run;

end.
