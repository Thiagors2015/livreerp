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

program Retaguarda;

uses
  Forms,
  UfrmBase in '..\Compartilhado\Forms Bases\UfrmBase.pas' {frmBase},
  udmBase in '..\Compartilhado\Forms Bases\udmBase.pas' {dmBase: TDataModule},
  Udmprincipal in '..\Compartilhado\DataModule\Udmprincipal.pas' {dmprincipal: TDataModule},
  UVariaveisGerais in '..\Compartilhado\Procedimentos\UVariaveisGerais.pas',
  ufrmCadBase in '..\Compartilhado\Forms Bases\ufrmCadBase.pas' {frmCadBase},
  ufrmCadBaseDB in '..\Compartilhado\Forms Bases\ufrmCadBaseDB.pas' {frmCadBaseDB},
  UFuncoes_Gerais in '..\Compartilhado\Procedimentos\UFuncoes_Gerais.pas',
  UfrmLstBase in '..\Compartilhado\Forms Bases\UfrmLstBase.pas' {frmLstBase},
  UdbFuncoes in '..\Compartilhado\Procedimentos\UdbFuncoes.pas',
  ufrmLstBaseDB in '..\Compartilhado\Forms Bases\ufrmLstBaseDB.pas' {frmLstBaseDB},
  UfrmLstAgencia in '..\Controle Bancario\Agencia\UfrmLstAgencia.pas' {frmLstAgencia},
  UdmCadastroBase in '..\Compartilhado\Forms Bases\UdmCadastroBase.pas' {dmCadastroBase: TDataModule},
  uFuncoes_Sistema in '..\Compartilhado\Procedimentos\uFuncoes_Sistema.pas',
  UfrmMensagem in '..\Compartilhado\Forms Comuns\UfrmMensagem.pas' {frmMensagem},
  UMensagem in '..\Compartilhado\Procedimentos\UMensagem.pas',
  UfrmSobre in '..\Compartilhado\Forms Comuns\UfrmSobre.pas' {frmSobre},
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Livre ERP';
  Application.CreateForm(Tdmprincipal, dmprincipal);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.