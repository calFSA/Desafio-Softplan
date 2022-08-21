unit ProvaDelphiApp.View.ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    spQuery1: TspQuery;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    lblSqlGerado: TLabel;
    memColunas: TMemo;
    memTabelas: TMemo;
    memCondicoes: TMemo;
    btnGeraSql: TBitBtn;
    memSqlGerado: TMemo;
    btnLimpar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSqlClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }

    function GeraSQL: TStringList;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

uses
  ProvaDelphiApp.Controller.Interfaces.IGeraSQL,
  ProvaDelphiApp.Controller.uGeraSQLController;

procedure TfTarefa1.btnGeraSqlClick(Sender: TObject);
begin
  memSqlGerado.Clear;
  memSqlGerado.lines := GeraSQL;
end;

procedure TfTarefa1.btnLimparClick(Sender: TObject);
begin
  LimparCampos;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  Release;
  fTarefa1 := nil;
end;

function TfTarefa1.GeraSQL: TStringList;
var
  AGeraSQL: IGeraSQL;
begin
  AGeraSQL := TGeraSql.Create;
  try
    AGeraSQL.SetColunas(memColunas);
    AGeraSQL.SetTabela(memTabelas);
    AGeraSQL.SetCondicoes(memCondicoes);
    Result := AGeraSQL.GeraSQL;
  finally
    AGeraSQL := nil;
  end;
end;

procedure TfTarefa1.LimparCampos;
begin
  memColunas.Clear;
  memTabelas.Clear;
  memCondicoes.Clear;
  memSqlGerado.Clear;
end;

end.
