unit ProvaDelphiApp.View.ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils,
  System.Variants, System.Threading,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  ProvaDelphiApp.Controller.uProjetoPopulaDataSetController,
  ProvaDelphiApp.Controller.Interfaces.IProjetoPopulaDataSet,
  ProvaDelphiApp.Controller.uProjetoController,
  ProvaDelphiApp.Controller.uProjetoCriaDataSetController,
  ProvaDelphiApp.Controller.Interfaces.IProjetoCriaDataSet;

type
  TTipoCalculo = (CalcularTotal, CalcularTotalDivisoes);

  TfTarefa3 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbgValores: TDBGrid;
    btnCalcularTotal: TButton;
    edtTotal: TEdit;
    btnCalcularTotalDivisoes: TButton;
    edtTotalDivisoes: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCalcularTotalClick(Sender: TObject);
    procedure btnCalcularTotalDivisoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure CalculaValor(AEdit: TEdit; ATipoCalculo: TTipoCalculo);
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnCalcularTotalClick(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      CalculaValor(edtTotal, CalcularTotal);
    end);
end;

procedure TfTarefa3.btnCalcularTotalDivisoesClick(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      CalculaValor(edtTotalDivisoes, CalcularTotalDivisoes);
    end);
end;

procedure TfTarefa3.CalculaValor(AEdit: TEdit; ATipoCalculo: TTipoCalculo);
var
  AProjeto: IProjetoPopulaDataSet;
  AValorCalculo: Currency;
begin
  AProjeto := TProjetoPopulaDataSet.Create;
  try
    AProjeto.SetDataSet(dbgValores.DataSource.DataSet);

    case ATipoCalculo of
      CalcularTotal:
        AValorCalculo := AProjeto.CalcularTotal;
      CalcularTotalDivisoes:
        AValorCalculo := AProjeto.CalcularTotalDivisoes;
    else
      AValorCalculo := 0;
    end;

    AEdit.Text := FormatFloat('#,##0.00', AValorCalculo);
  finally
    AProjeto := nil;
  end;
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa3 := nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
var
  ACriaDataSet: IProjetoCriaDataSet;
  ADatasource: TDatasource;
  ADataSet: TCLientDataset;
begin
  ACriaDataSet := TCriaDataSet.Create;
  try
    ADataSet := ACriaDataSet.CriaDataSet;
    ADatasource := ACriaDataSet.ConfiguraDataSource;

    ADatasource.DataSet := ADataSet;
    dbgValores.DataSource := ADatasource;

    TFloatField(ADataSet.FieldByName('Valor')).DisplayFormat := 'R$ #,##0.00';
  finally
    ACriaDataSet := nil;
    ADataSet := nil;
    ADatasource := nil;
  end;
end;

end.
