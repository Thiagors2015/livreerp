{
Projeto ERP Livre - Sistema de Gest�o Comercial Livre
Copyright (c) 2008 S�rgio Guedes

O ERP Livre � um software de livre distribui��o, que pode ser copiado e
distribu�do sob os termos da Licen�a P�blica Geral GNU, conforme publicada
pela Free Software Foundation, vers�o 2 da licen�a ou qualquer vers�o posterior.

Este programa � distribu�do na expectativa de ser �til aos seus usu�rios,
por�m  N�O TEM NENHUMA GARANTIA, EXPL�CITAS OU IMPL�CITAS,
COMERCIAIS OU DE ATENDIMENTO A UMA DETERMINADA FINALIDADE.

Consulte a Licen�a P�blica Geral GNU para maiores detalhes.

@project-name: ERP Livre
@project-email: ERPLivre@yahoo.com.br
@autor-name: S�rgio Guedes
@autor-email: sergio_rj45@yahoo.com.br

}
unit UdbFuncoes;

interface

  uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls, DBClient, Provider,FMTBcd,
   SqlExpr, Variants ;

  // Ordena colunas Clicada no Grid
  procedure OrdenaColunas(cds: TclientDataset; grid: TDBGrid; Column: TColumn);
  // Desativa Indexa��o do campos do Clientdataset
  procedure TiraOrdenacao(cds: TclientDataset);
  {: atualiza o ClientDataSet (principalmente para Relat�rios)}
  procedure RefreshCds (aCds : TClientDataSet);

implementation

procedure OrdenaColunas(cds: TclientDataset; grid: TDBGrid; Column: TColumn);
var
  sIndexName : string;
  Options: TIndexOptions;
  I : integer;
begin
 // Alterar as cores do t�tulo de um DBGrid em tempo execu��o
  for i:= 0 to grid.Columns.count-1 do
  begin
    // Coloca Todas Colunas com Cor padr�o
    grid.Columns[i].Title.Color := clBtnFace;
    grid.Columns[i].Title.Font.Color := clBlack;
    grid.Columns[i].Title.Font.Style := [];
  end;

  cds.IndexDefs.Update;
  //  Muda o Tipo de Ordena��o
  if cds.IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    Options := [ixDescending];
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    Options := [];
  end;

  if cds.IndexDefs.IndexOf(sIndexName) < 0 then
    cds.AddIndex(sIndexName, Column.FieldName, Options);

  cds.IndexName := sIndexName;

  // Pinta somente a coluna selecionada
  // Column.Title.color := ClYellow;
  Column.Title.Font.Style := [fsBold];
  // Column.Title.Font.Color := clRed;
end;

procedure TiraOrdenacao(cds: TclientDataset);
Begin
  cds.IndexDefs.Update;
  //  Verifica se existe algum indice, se existir limpa
  if cds.IndexName <> '' then
    cds.IndexName :=  '';
end;

procedure RefreshCds (aCds : TClientDataSet);
begin
  {: atualiza o ClientDataSet (principalmente para Relat�rios)}
  aCds.Close;
  aCds.Open;
end;


end.
 