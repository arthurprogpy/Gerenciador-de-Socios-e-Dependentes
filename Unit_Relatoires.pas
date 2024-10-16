unit Unit_Relatoires;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TFRelatorioSocios = class(TForm)
    RLReport1: TRLReport;
    header: TRLBand;
    information: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    rlbl1: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioSocios: TFRelatorioSocios;

implementation

uses Unit_seleciona_socios, Unit_dataModule;

{$R *.dfm}

end.
