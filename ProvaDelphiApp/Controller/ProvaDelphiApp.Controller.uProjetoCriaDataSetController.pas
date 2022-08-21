unit ProvaDelphiApp.Controller.uProjetoCriaDataSetController;

interface

uses
  ProvaDelphiApp.Controller.Interfaces.IProjetoCriaDataSet, Datasnap.DBClient,
  Data.DB, ProvaDelphiApp.Controller.uProjetoController, ProvaDelphiApp.Controller.Interfaces.IProjeto,
  ProvaDelphiApp.Model.uProjeto;

type
  TCriaDataSet = class(TInterfacedObject, IProjetoCriaDataSet)
  private
    function ConfiguraDataSet: TCLientDataset;

  public
    function ConfiguraDataSource: TDatasource;
    function CriaDataSet: TCLientDataset;
    destructor Destroy; override;
  end;

implementation

{ TCriaDataSet }

function TCriaDataSet.ConfiguraDataSet: TCLientDataset;
begin
  ConfiguraDataSet := TCLientDataset.Create(nil);

  ConfiguraDataSet.FieldDefs.Add('IdProjeto', ftInteger);
  ConfiguraDataSet.FieldDefs.Add('NomeProjeto', ftString, 65);
  ConfiguraDataSet.FieldDefs.Add('Valor', ftFloat);
  ConfiguraDataSet.CreateDataSet;
end;

function TCriaDataSet.ConfiguraDataSource: TDatasource;
begin
  ConfiguraDataSource := TDatasource.Create(nil);
end;

function TCriaDataSet.CriaDataSet: TCLientDataset;
var
  AProjetoController: IProjetoController;
  AProjeto: TProjeto;
begin
  CriaDataSet := ConfiguraDataSet;
  try
    AProjetoController := TProjetoController.Create(10);

    for AProjeto in AProjetoController.Projeto do
      CriaDataSet.AppendRecord([AProjeto.Id, AProjeto.Nome, AProjeto.Valor]);

  finally
    AProjetoController := nil;
  end;
end;

destructor TCriaDataSet.Destroy;
begin
  ConfiguraDataSet.Free;
  ConfiguraDataSource.Free;

  inherited;
end;

end.
