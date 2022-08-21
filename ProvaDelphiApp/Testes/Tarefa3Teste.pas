unit Tarefa3Teste;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TTarefa3Teste = class(TObject) 
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
  end;

implementation

procedure TTarefa3Teste.Setup;
begin
end;

procedure TTarefa3Teste.TearDown;
begin
end;


initialization
  TDUnitX.RegisterTestFixture(TTarefa3Teste);
end.
