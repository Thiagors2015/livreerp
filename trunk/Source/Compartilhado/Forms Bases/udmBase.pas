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
unit udmBase;

interface

uses
  SysUtils, Classes, SqlExpr, db, AppEvnts, XPMan;

type
  TdmBase = class(TDataModule)
    xpmnfstBase: TXPManifest;
    aplctnvntsBase: TApplicationEvents;
  private
    { Private declarations }
  public

  end;

var
  dmBase: TdmBase;

implementation

{$R *.dfm}

{ TdmBase }

end.
