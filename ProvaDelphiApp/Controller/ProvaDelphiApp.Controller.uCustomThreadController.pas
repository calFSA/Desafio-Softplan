unit ProvaDelphiApp.Controller.uCustomThreadController;

interface

uses
  System.Classes, System.SysUtils, Vcl.ComCtrls;

type
  TCustomThreadController = class(TThread)
  private
    FIntervalo: byte;
    FProgressBar : TProgressBar;
    procedure SetPosicaoProgressBar(value : integer);
  public
    procedure SetIntervalo(value: integer);
    procedure SetProgressBar(value: TProgressBar);
    procedure Execute; override;
  end;

implementation

{ TThreadObject }

procedure TCustomThreadController.Execute;
var
  i: byte;
begin
  inherited;

  for i := 1 to 100 do
  begin
    Sleep(FIntervalo);
    SetPosicaoProgressBar(i);
  end;
end;

procedure TCustomThreadController.SetIntervalo(value: integer);
begin
  if value <= 0 then
    raise Exception.Create('O intervalo deve ser maior que zero!');

  FIntervalo := value;
end;

procedure TCustomThreadController.SetProgressBar(value: TProgressBar);
begin
  FProgressBar := value;
end;

procedure TCustomThreadController.SetPosicaoProgressBar(value: integer);
begin
  FProgressBar.Position := value;
end;

end.
