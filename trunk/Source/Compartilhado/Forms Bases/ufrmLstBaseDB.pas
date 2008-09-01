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
unit ufrmLstBaseDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UfrmLstBase, DB, ImgList, ActnList, Grids,
  DBGrids, StdCtrls, Buttons, pngextra, ComCtrls, ExtCtrls;

type
  TfrmLstBaseDB = class(TfrmLstBase)
    procedure actAnteriorExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PreencheComboFiltro(J: Integer; cbb : TComboBox); override;
    procedure ImprimeCombox(codrel: integer); override;
    procedure NovoCadastro; override;
    procedure AlterarCadastro; override;
    procedure ExcluirCadastro; override;
    procedure PesquisaBase; override;
  end;

var
  frmLstBaseDB: TfrmLstBaseDB;

implementation

{$R *.dfm}

{ TfrmLstBaseDB }

procedure TfrmLstBaseDB.AlterarCadastro;
begin
  inherited;
  // Fun��o Implementada no Filho
end;

procedure TfrmLstBaseDB.ExcluirCadastro;
begin
  inherited;
  // Fun��o Implementada no Filho
end;

procedure TfrmLstBaseDB.ImprimeCombox(codrel: integer);
begin
  inherited;
  // Fun��o Implementada no Filho
end;

procedure TfrmLstBaseDB.NovoCadastro;
begin
  inherited;
  // Fun��o Implementada no Filho
end;

procedure TfrmLstBaseDB.PesquisaBase;
begin
  inherited;
  // Fun��o Implementada no Filho
end;

procedure TfrmLstBaseDB.PreencheComboFiltro(J: Integer; cbb: TComboBox);
begin
  inherited;
  // Fun��o Implementada no Filho
end;

procedure TfrmLstBaseDB.actAnteriorExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.Active then
    dsBase.DataSet.Prior;
end;

procedure TfrmLstBaseDB.actPrimeiroExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.Active then
    dsBase.DataSet.First;
end;

procedure TfrmLstBaseDB.actProximoExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.Active then
    dsBase.DataSet.Next;
end;

procedure TfrmLstBaseDB.actUltimoExecute(Sender: TObject);
begin
  inherited;
  if dsBase.DataSet.Active then
    dsBase.DataSet.Last;
end;

end.
