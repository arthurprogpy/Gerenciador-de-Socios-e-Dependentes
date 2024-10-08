program GerenciadorDeDependentes;

uses
  Forms,
  Unit_Login in 'Unit_Login.pas' {fLogin},
  Unit_dataModule in 'Unit_dataModule.pas' {fDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfLogin, fLogin);
  Application.CreateForm(TfDataModule, fDataModule);
  Application.Run;
end.
