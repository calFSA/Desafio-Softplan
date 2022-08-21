unit ProvaDelphiApp.View.ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.StrUtils;

type
  TfPrincipal = class(TForm)
    menTarefas: TMainMenu;
    Tarefa1: TMenuItem;
    Tarefa2: TMenuItem;
    Tarefa3: TMenuItem;
    procedure Tarefa1Click(Sender: TObject);
    procedure Tarefa2Click(Sender: TObject);
    procedure Tarefa3Click(Sender: TObject);
  private
    { Private declarations }
    function HasForm(pForm: TForm): boolean;
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.dfm}

uses
  ProvaDelphiApp.View.ufTarefa1,
  ProvaDelphiApp.View.ufTarefa2,
  ProvaDelphiApp.View.ufTarefa3;

function TfPrincipal.HasForm(pForm: TForm): boolean;
var
  i: integer;
begin
  Result := False;

  for i := 0 to Pred(MDIChildCount) do
  begin
    if MDIChildren[i] = pForm then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TfPrincipal.Tarefa1Click(Sender: TObject);
begin
  if not HasForm(fTarefa1 as TForm) then
  begin
    fTarefa1         := TfTarefa1.Create(Self);
    fTarefa1.Caption := ReplaceStr(menTarefas.Items[0].Caption, '&', '');
  end
  else
    fTarefa1.Show;
end;

procedure TfPrincipal.Tarefa2Click(Sender: TObject);
begin
  if not HasForm(fTarefa2 as TForm) then
  begin
    fTarefa2         := TfTarefa2.Create(Self);
    fTarefa2.Caption := ReplaceStr(menTarefas.Items[1].Caption, '&', '');
  end
  else
    fTarefa2.Show;
end;

procedure TfPrincipal.Tarefa3Click(Sender: TObject);
begin
  if not HasForm(fTarefa3 as TForm) then
  begin
    fTarefa3         := TfTarefa3.Create(Self);
    fTarefa3.Caption := ReplaceStr(menTarefas.Items[2].Caption, '&', '');
  end
  else
    fTarefa3.Show;
end;

end.
