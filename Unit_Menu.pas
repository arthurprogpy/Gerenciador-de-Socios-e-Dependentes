unit Unit_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBGrids, ExtCtrls, ComCtrls, jpeg;

type
  TfMenu = class(TForm)
    pnlBottom: TPanel;
    btn_socios: TBitBtn;
    btn_dependentes: TBitBtn;
    btn_relatorios: TBitBtn;
    btn_operadores: TBitBtn;
    btn_fechar: TBitBtn;
    tmr1: TTimer;
    pnlTop: TPanel;
    statBarMenu: TStatusBar;
    pnlClient: TPanel;
    lbl: TLabel;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_sociosClick(Sender: TObject);
    procedure btn_operadoresClick(Sender: TObject);
    procedure btn_dependentesClick(Sender: TObject);
    procedure btn_relatoriosClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenu: TfMenu;

implementation

uses Unit_Socios, Unit_Operadores, Unit_Dependentes, Unit_seleciona_socios,
  Unit_teste, Unit_Login;

{$R *.dfm}

procedure TfMenu.btn_fecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfMenu.btn_sociosClick(Sender: TObject);
begin
if FSocios = nil then
  Application.CreateForm(TFSocios, FSocios);
FSocios.ShowModal;
end;

procedure TfMenu.btn_operadoresClick(Sender: TObject);
begin
if FOperadores = nil then
  Application.CreateForm(tFOperadores, FOperadores);
FOperadores.ShowModal;
end;

procedure TfMenu.btn_dependentesClick(Sender: TObject);
begin
   if fDependentes = nil then
    Application.CreateForm(TfDependentes, fDependentes);
   fDependentes.ShowModal;
end;

procedure TfMenu.btn_relatoriosClick(Sender: TObject);
begin
  if  fSelecionaSocio = nil then
    Application.CreateForm(TfSelecionaSocio, fSelecionaSocio);
  fSelecionaSocio.ShowModal;
end;

procedure TfMenu.tmr1Timer(Sender: TObject);
begin
  statBarMenu.Panels[0].Text := fLogin.edt_usuario.Text;
  statBarMenu.Panels[1].Text := DateToStr(date);
  statBarMenu.Panels[2].Text := TimeToStr(Time);
end;

end.
