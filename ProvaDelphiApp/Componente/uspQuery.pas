unit uspQuery;

interface

uses
  System.Classes, FireDAC.Comp.Client, System.StrUtils, System.SysUtils;

type
  TspQuery = class(TFDQuery)
  private
    FspColunas: TStringList;
    FspTabelas: TStringList;
    FspCondicoes: TStringList;

    procedure SetspColunas(value: TStringList);
    procedure SetspTabelas(value: TStringList);
    procedure SetspCondicoes(value: TStringList);

    function MontaSelect: TStringList;
    function MontaFrom: TStringList;
    function MontaWhere: TStringList;
  Public
    function GeraSQL: TStringList;

  Published
    property spColunas: TStringList read FspColunas write SetspColunas;
    property spTabelas: TStringList read FspTabelas write SetspTabelas;
    property spCondicoes: TStringList read FspCondicoes write SetspCondicoes;
  end;

implementation

{ TspQuery }

function TspQuery.GeraSQL: TStringList;
begin
  Result := TStringList.Create;
  Result.Text := MontaSelect.Text + MontaFrom.Text + MontaWhere.Text;
end;

function TspQuery.MontaFrom: TStringList;
var
  ATabela: string;
begin
  Result := TStringList.Create;
  Result.Add('from ');

  for ATabela in spTabelas do
    Result.Add('  ' + ATabela);
end;

function TspQuery.MontaSelect: TStringList;
var
  AColuna: string;
begin
  Result := TStringList.Create;
  Result.Add('select ');

  if spColunas.Count = 0 then
    Result.Add(' * ');

  for AColuna in spColunas do
  begin
    case Result.Count of
      1: Result.Add('  ' + AColuna);
    else
      Result.Add('  ' + AColuna);
    end;
  end;
end;

function TspQuery.MontaWhere: TStringList;
var
  ACondicao: String;
begin
  Result := TStringList.Create;

  if spCondicoes.Count > 0 then
    Result.Add('where 1 = 1 ');

  for ACondicao in spCondicoes do
    Result.Add('  and ' + ACondicao);
end;

procedure TspQuery.SetspColunas(value: TStringList);
begin
  if value.Count = 0 then
    raise Exception.Create('Coluna não informada!');

  FspColunas := value;
end;

procedure TspQuery.SetspCondicoes(value: TStringList);
begin
  if value.Count = 0 then
    raise Exception.Create('Condição não informada!');

  FspCondicoes := value;
end;

procedure TspQuery.SetspTabelas(value: TStringList);
begin
  if value.Count = 0 then
    raise Exception.Create('Tabela não informada!');

  FspTabelas := value;
end;

end.
