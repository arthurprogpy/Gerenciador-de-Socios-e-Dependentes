program GerenciadorDeDependentes;

uses
  Forms,
  Unit_Login in 'Unit_Login.pas' {fLogin},
  Unit_dataModule in 'Unit_dataModule.pas' {fDataModule: TDataModule},
  Unit_Menu in 'Unit_Menu.pas' {fMenu};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TfDataModule, fDataModule);
  Application.CreateForm(TfMenu, fMenu);
  Application.Run;
end.
