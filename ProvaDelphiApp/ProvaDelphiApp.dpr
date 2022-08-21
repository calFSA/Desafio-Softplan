program ProvaDelphiApp;

uses
  Vcl.Forms,
  ProvaDelphiApp.View.ufPrincipal in 'View\ProvaDelphiApp.View.ufPrincipal.pas' {fPrincipal},
  ProvaDelphiApp.View.ufTarefa1 in 'View\ProvaDelphiApp.View.ufTarefa1.pas' {fTarefa1},
  ProvaDelphiApp.View.ufTarefa3 in 'View\ProvaDelphiApp.View.ufTarefa3.pas' {fTarefa3},
  ProvaDelphiApp.Controller.uCustomThreadController in 'Controller\ProvaDelphiApp.Controller.uCustomThreadController.pas',
  ProvaDelphiApp.View.ufTarefa2 in 'View\ProvaDelphiApp.View.ufTarefa2.pas' {fTarefa2},
  ProvaDelphiApp.Model.uProjeto in 'Model\ProvaDelphiApp.Model.uProjeto.pas',
  ProvaDelphiApp.Controller.Interfaces.IProjetoPopulaDataSet in 'Controller\Interfaces\ProvaDelphiApp.Controller.Interfaces.IProjetoPopulaDataSet.pas',
  ProvaDelphiApp.Model.Interfaces.IProjeto in 'Model\Interfaces\ProvaDelphiApp.Model.Interfaces.IProjeto.pas',
  ProvaDelphiApp.Controller.uProjetoPopulaDataSetController in 'Controller\ProvaDelphiApp.Controller.uProjetoPopulaDataSetController.pas',
  ProvaDelphiApp.Controller.Interfaces.IProjetoCriaDataSet in 'Controller\Interfaces\ProvaDelphiApp.Controller.Interfaces.IProjetoCriaDataSet.pas',
  ProvaDelphiApp.Controller.uProjetoCriaDataSetController in 'Controller\ProvaDelphiApp.Controller.uProjetoCriaDataSetController.pas',
  ProvaDelphiApp.Controller.uProjetoController in 'Controller\ProvaDelphiApp.Controller.uProjetoController.pas',
  ProvaDelphiApp.Controller.Interfaces.IProjeto in 'Controller\Interfaces\ProvaDelphiApp.Controller.Interfaces.IProjeto.pas',
  ProvaDelphiApp.Controller.Interfaces.IGeraSQL in 'Controller\Interfaces\ProvaDelphiApp.Controller.Interfaces.IGeraSQL.pas',
  ProvaDelphiApp.Controller.uGeraSQLController in 'Controller\ProvaDelphiApp.Controller.uGeraSQLController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfPrincipal, fPrincipal);
  Application.Run;
end.
