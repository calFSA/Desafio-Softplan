unit ProvaDelphiApp.Controller.uProjetoController;

interface

uses System.SysUtils, ProvaDelphiApp.Controller.Interfaces.IProjeto,
  System.Generics.Collections, ProvaDelphiApp.Model.uProjeto;

type
  TProjetoController = class(TInterfacedObject, IProjetoController)
  private

    FProjeto: TList<TProjeto>;
    FLimiteProjeto: Integer;

    procedure CriarProjeto;
    function NovoValor: Currency;

    property ListaProjeto: TList<TProjeto> read FProjeto;
  public
    constructor Create(ALimite: Integer);
    destructor Destroy; override;

    function Projeto: TList<TProjeto>;
  end;

implementation

{ TProjetoController }

constructor TProjetoController.Create(ALimite: Integer);
begin
  FProjeto := TList<TProjeto>.Create;
  FLimiteProjeto := ALimite;

  CriarProjeto;
end;

procedure TProjetoController.CriarProjeto;
var
  i: Integer;
begin
  for i := 1 to FLimiteProjeto do
    FProjeto.Add(TProjeto.Create(i, 'Projeto ' + i.ToString, NovoValor));
end;

destructor TProjetoController.Destroy;
begin
  FProjeto.Free;

  inherited;
end;

function TProjetoController.Projeto: TList<TProjeto>;
begin
  Result := ListaProjeto;
end;

function TProjetoController.NovoValor: Currency;
begin
  Randomize;
  Result := Random(Trunc(1000));
end;

end.
