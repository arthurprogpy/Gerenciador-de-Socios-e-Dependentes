unit Unit_Menu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfMenu = class(TForm)
    btn_operadores: TBitBtn;
    btn_socios: TBitBtn;
    btn_dependentes: TBitBtn;
    btn_relatorios: TBitBtn;
    btn_fechar: TBitBtn;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_sociosClick(Sender: TObject);
    procedure btn_operadoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMenu: TfMenu;

implementation

uses Unit_Socios, Unit_Operadores;

{$R *.dfm}

procedure TfMenu.btn_fecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfMenu.btn_sociosClick(Sender: TObject);
begin
  FSocios.ShowModal;
end;

procedure TfMenu.btn_operadoresClick(Sender: TObject);
begin
  FOperadores.ShowModal;
end;

end.
