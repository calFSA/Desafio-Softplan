unit ProvaDelphiApp.Model.Interfaces.IProjetoDataSet;

interface

uses
  Data.DB;

Type
  IPopulaDataSet = interface
    ['{588671DA-A2C1-408A-A0BF-57FF57895835}']

    function SetDataSet(DataSet: TDataSet): IPopulaDataSet;
    function CalcularTotal: Currency;
    function CalcularTotalDivisoes: Currency;
  end;

implementation

end.
