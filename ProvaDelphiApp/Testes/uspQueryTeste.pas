unit uspQueryTeste;

interface
uses
  DUnitX.TestFramework, uspQuery, FireDAC.DApt, System.Classes,
  System.SysUtils;

type

  [TestFixture]
  TTarefa1Teste = class(TObject)
  private
    FspQuery: TspQuery;
    function RetornaDados(value: string): TStringList;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    function GeraSQL: TStringList;
  end;

implementation

function TTarefa1Teste.GeraSQL: TStringList;
var
  RetornoComponente: string;
begin
  Result := TStringList.Create;

  FspQuery.spColunas := RetornaDados('ID');
  FspQuery.spTabelas := RetornaDados('');
  FspQuery.spCondicoes := RetornaDados('ID=1');

  Result := FspQuery.GeraSQL;

  Assert.IsTrue(Result.Text <> '', 'Ocorreu um erro ao tentar gerar o SQL');
end;

function TTarefa1Teste.RetornaDados(value: string): TStringList;
begin
  Result := TStringList.Create;
  Result.Add(value);
end;

procedure TTarefa1Teste.Setup;
begin
//  FspQuery := TspQuery.Create(nil);
end;

procedure TTarefa1Teste.TearDown;
begin
//  FspQuery.Free;
end;


initialization
  TDUnitX.RegisterTestFixture(TTarefa1Teste);
end.
