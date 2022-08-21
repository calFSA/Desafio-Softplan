unit Tarefa2Teste;

interface

uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TTarefa2Teste = class(TObject)
  private
    FTarefa2: TCustomThreadController;
    FProgressBar: TProgressBar;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure ValidaThread;
  end;

implementation

procedure TTarefa2Teste.Setup;
begin
  FTarefa2 := TTarefa2.Criar;
  FProgressBar := TProgressBar.Create(Nil);
end;

procedure TTarefa2Teste.TearDown;
begin
end;

procedure TTarefa2Teste.ValidaThread;
begin

end;

initialization

TDUnitX.RegisterTestFixture(TTarefa2Teste);

end.
