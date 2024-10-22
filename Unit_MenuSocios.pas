unit Unit_MenuSocios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, jpeg, Buttons;

type
  TfMenuSocios = class(TForm)
    pnlBottom: TPanel;
    btn_socios: TBitBtn;
    btn_dependentes: TBitBtn;
    btn_fechar: TBitBtn;
    pnlTop: TPanel;
    imglogo: TImage;
    statBarMenu: TStatusBar;
    pnlClient: TPanel;
    lbl: TLabel;
    tmr1: TTimer;
    procedure btn_sociosClick(Sender: TObject);
    procedure btn_dependentesClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenuSocios: TfMenuSocios;

implementation

{$R *.dfm}

uses Unit_InformacaoSocio, Unit_SociosDependentes, Unit_Login;

procedure TfMenuSocios.btn_sociosClick(Sender: TObject);
begin
  if fInformacoesSocio = nil then
    begin
      Application.CreateForm(TfInformacoesSocio, fInformacoesSocio);
    end;
  fInformacoesSocio.ShowModal;
end;

procedure TfMenuSocios.btn_dependentesClick(Sender: TObject);
begin
  if FDependetesSocios = nil then
    Application.CreateForm(TFDependetesSocios, FDependetesSocios);
  FDependetesSocios.ShowModal;
end;

procedure TfMenuSocios.btn_fecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfMenuSocios.tmr1Timer(Sender: TObject);
begin
  statBarMenu.Panels[0].Text := usuario;
  statBarMenu.Panels[1].Text := DateToStr(date);
  statBarMenu.Panels[2].Text := TimeToStr(Time);
end;

end.
