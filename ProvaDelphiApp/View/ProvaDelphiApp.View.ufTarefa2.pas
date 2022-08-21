unit ProvaDelphiApp.View.ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ComCtrls, ProvaDelphiApp.Controller.uCustomThreadController;

type
  TfTarefa2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    edtIntervalo1: TSpinEdit;
    edtIntervalo2: TSpinEdit;
    btnIniciar: TButton;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Th1, Th2: TCustomThreadController;
    procedure Iniciar;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}


{ TfTarefa2 }

procedure TfTarefa2.btnIniciarClick(Sender: TObject);
begin
  Iniciar;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa2 := nil;
end;

procedure TfTarefa2.Iniciar;
begin
  Th1 := TCustomThreadController.Create(True);
  Th1.FreeOnTerminate := True;
  Th1.SetIntervalo(edtIntervalo1.Value);
  Th1.SetProgressBar(ProgressBar1);

  Th2 := TCustomThreadController.Create(True);
  Th2.FreeOnTerminate := True;
  Th2.SetIntervalo(edtIntervalo2.Value);
  Th2.SetProgressBar(ProgressBar2);

  Th1.Start;
  Th2.Start;
end;

end.

