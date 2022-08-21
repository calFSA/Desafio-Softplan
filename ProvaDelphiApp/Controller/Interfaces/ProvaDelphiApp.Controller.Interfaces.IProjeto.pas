unit ProvaDelphiApp.Controller.Interfaces.IProjeto;

interface

uses
  System.Generics.Collections, ProvaDelphiApp.Model.uProjeto;

type
  IProjetoController = interface
    ['{5044428B-0FD4-4F18-8A29-3D4D543BE497}']

    procedure CriarProjeto;
    function NovoValor: Currency;
    function Projeto: TList<TProjeto>;
  end;

implementation

end.
