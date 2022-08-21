unit ProvaDelphiApp.Model.uProjeto;

interface

uses ProvaDelphiApp.Model.Interfaces.IProjeto;

type
  TProjeto = class(TInterfacedObject, IConfiguraCampos)

  private
    FId: Integer;
    FNome: String;
    FValor: Currency;

    procedure SetId(value: Integer);
    procedure SetNome(value: string);
    procedure SetValor(value: Currency);

  public
    constructor Create(Id: Integer; Nome: String; Valor: Currency);

    property Id: Integer read FId write SetId;
    property Nome: String read FNome write SetNome;
    property Valor: Currency read FValor write SetValor;
  end;

implementation

{ TProjeto }

constructor TProjeto.Create(Id: Integer; Nome: String; Valor: Currency);
begin
  FId    := Id;
  FNome  := Nome;
  FValor := Valor;
end;

procedure TProjeto.SetId(value: Integer);
begin
  Id := value;
end;

procedure TProjeto.SetNome(value: string);
begin
  Nome := value;
end;

procedure TProjeto.SetValor(value: Currency);
begin
  Valor := value;
end;

end.
