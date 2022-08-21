unit spComponentesRegistro;

interface

uses
  System.Classes, uspQuery;

procedure register;

type
  TspQueryDT = class(TspQuery)
  end;

implementation

procedure register;
begin
  RegisterComponents('ProvaDelphi', [TspQuery]);
end;

end.
