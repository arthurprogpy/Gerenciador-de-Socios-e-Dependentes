unit Unit_teste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    edt_teste: TEdit;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var i, comprimentoString: integer;
valorComparado: currency;
begin
  valorComparado := StrToCurr(edt_teste.text);
  if edt_teste.Text =  '' then
    ShowMessage('Preencha alguma Renda')
  else if valorComparado <= 0 then
    ShowMessage('Não é possivel inserir valores menores ou iguais a 0 !')
  else
    comprimentoString := length(edt_teste.Text);
    for i := 1 to comprimentoString -1 do
      begin
        if edt_teste.Text[i] = '.' then
          begin
            if i + 2 = comprimentoString then
              begin
                ShowMessage('Valor ok');
                break;
              end
            else
              begin
                ShowMessage('INCORRETO');
                break;
              end
          end
        else if edt_teste.Text[i] = ',' then
          begin
            ShowMessage('INCORRETO');
            break;
          end;

      end;
    end;


end.
