unit ProvaDelphiApp.Controller.uProjetoPopulaDataSetController;

interface

uses
 Data.DB, ProvaDelphiApp.Controller.Interfaces.IProjetoPopulaDataSet;

type
  TProjetoPopulaDataSet = class(TInterfacedObject, IProjetoPopulaDataSet)
    FDataSet: TDataSet;

    function SetDataSet(DataSet: TDataSet): IProjetoPopulaDataSet;
    function CalcularTotal: Currency;
    function CalcularTotalDivisoes: Currency;
  end;

implementation

{ TOperacoesEmLote }

function TProjetoPopulaDataSet.SetDataSet(DataSet: TDataSet): IProjetoPopulaDataSet;
begin
  Result := Self;
  FDataSet := DataSet;
end;

function TProjetoPopulaDataSet.CalcularTotal: Currency;
var
  ATotal: Currency;
begin
  ATotal := 0;
  FDataSet.First;

  while not FDataSet.Eof do
  begin
    ATotal := ATotal + FDataSet.FieldByName('Valor').AsCurrency;
    FDataSet.Next;
  end;

  Result := ATotal;
end;

function TProjetoPopulaDataSet.CalcularTotalDivisoes: Currency;
var
  AId: Integer;
  ATotal, AValorAtual, AValorAnterior: Currency;
begin
  ATotal := 0;
  AValorAnterior := 0;

  FDataSet.First;
  AId := FDataSet.FieldByName('IdProjeto').AsInteger;

  while not FDataSet.Eof do
  begin
    AValorAtual := FDataSet.FieldByName('Valor').AsCurrency;

    if AId <> FDataSet.FieldByName('IdProjeto').AsInteger then
      ATotal := ATotal + (AValorAtual / AValorAnterior);

    AValorAnterior := FDataSet.FieldByName('Valor').AsCurrency;
    AId := FDataSet.FieldByName('IdProjeto').AsInteger;

    FDataSet.Next;
  end;

  Result := ATotal;
end;

end.
