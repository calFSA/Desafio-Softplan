unit ProvaDelphiApp.Controller.uGeraSQLController;

interface

uses
  ProvaDelphiApp.Controller.Interfaces.IGeraSQL, Vcl.StdCtrls, System.Classes;

type
  TGeraSql = class(TInterfacedObject, IGeraSQL)
  private
    FColunas: TMemo;
    FTabela: TMemo;
    FCondicoes: TMemo;

  public
    procedure SetColunas(value: TMemo);
    procedure SetTabela(value: TMemo);
    procedure SetCondicoes(value: TMemo);
    function GeraSQL: TStringList;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TGeraSql }

uses
  uspQuery;

constructor TGeraSql.Create;
begin
  FColunas := TMemo.Create(nil);
  FTabela := TMemo.Create(nil);
  FCondicoes := TMemo.Create(nil);
end;

destructor TGeraSql.Destroy;
begin
  FColunas.FreeOnRelease;
  FTabela.FreeOnRelease;
  FCondicoes.FreeOnRelease;

  inherited;
end;

function TGeraSql.GeraSQL: TStringList;
var
  qryGeraSQL: TspQuery;
  spColunas: TStringList;
  spTabelas: TStringList;
  spCondicoes: TStringList;
begin
  qryGeraSQL := TspQuery.Create(nil);
  try
    spColunas := TStringList.Create;
    spTabelas := TStringList.Create;
    spCondicoes := TStringList.Create;

    spColunas.AddStrings(FColunas.Lines);
    spTabelas.AddStrings(FTabela.Lines);
    spCondicoes.AddStrings(FCondicoes.Lines);

    qryGeraSQL.spColunas := spColunas;
    qryGeraSQL.spTabelas := spTabelas;
    qryGeraSQL.spCondicoes := spCondicoes;

    Result := TStringList.Create;
    Result := qryGeraSQL.GeraSQL;

  finally
    spColunas.Free;
    spTabelas.Free;
    spCondicoes.Free;

    qryGeraSQL.FreeOnRelease;
  end;
end;

procedure TGeraSql.SetColunas(value: TMemo);
begin
  FColunas := value;
end;

procedure TGeraSql.SetCondicoes(value: TMemo);
begin
  FCondicoes := value;
end;

procedure TGeraSql.SetTabela(value: TMemo);
begin
  FTabela := value;
end;

end.
