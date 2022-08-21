unit ProvaDelphiApp.Controller.Interfaces.IProjetoCriaDataSet;

interface

uses
  Datasnap.DBClient, Data.DB;

type
  IProjetoCriaDataSet = interface
    ['{32B1DB0D-7932-4348-A3DA-DD65E7DE2185}']

    function ConfiguraDataSet: TCLientDataset;
    function ConfiguraDataSource: TDatasource;
    function CriaDataSet: TCLientDataset;
  end;

implementation

end.
