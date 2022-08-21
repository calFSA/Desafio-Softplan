unit ProvaDelphiApp.Controller.Interfaces.IGeraSQL;

interface

uses
  Vcl.StdCtrls, System.Classes;

type
  IGeraSQL = interface
    ['{70C241AF-819C-4517-8D0E-4B4EC5C81832}']

    procedure SetColunas(Colunas: TMemo);
    procedure SetTabela(Tabela: TMemo);
    procedure SetCondicoes(Condicoes: TMemo);
    function GeraSQL: TStringList;
  end;

implementation

end.
