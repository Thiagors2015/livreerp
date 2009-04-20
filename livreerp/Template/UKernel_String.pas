unit UKernel_String;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls;

  function TiraAcentos(Texto: String): string;

implementation

function TiraAcentos(Texto: String): string;
var
  I: integer;
begin
  // Transforma as letras n�o acentuadas em mai�sculas
  Texto := UpperCase(Texto);
  // Troca as letras acentuadas por n�o acentuadas
  for I := 1 to Length(Texto) do
    Case Texto[I] of
      '�','�','�','�','�','�','�','�': Texto[I] := 'A';
      '�','�','�','�': Texto[I] := 'E';
      '�','�': Texto[I] := 'I';
      '�','�','�','�','�','�': Texto[I] := 'O';
      '�','�': Texto[I] := 'U';
      '�','�': Texto[I] := 'C';
    end;
  Result := Texto;
end;

end.
