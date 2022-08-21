unit ProvaDelphiApp.Model.Interfaces.IProjeto;

interface

type
  IConfiguraCampos = interface
    ['{F44349A0-BD90-4C1C-B7F7-EDFFA61FC3B8}']

    procedure SetId(value: Integer);
    procedure SetNome(value: String);
    procedure SetValor(value: Currency);
  end;

implementation

end.
