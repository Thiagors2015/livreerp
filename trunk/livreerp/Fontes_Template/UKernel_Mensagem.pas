unit UKernel_Mensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls;

Const
   Kernel_arquivo_ConexaoDB : string = 'Conexao.conf'; // arquivo de configuracoes da conexao com o db
   Kernel_arquivo_Terminal : string = 'Terminal.conf'; // arquivo de configuracoes do modulo de pedido

   Kernel_RegLivreFrame = '\Software\LivreFrameWizard\';

  //------------------------------------------------------------------------------
  // Mensagens de Erros do kernel
  //------------------------------------------------------------------------------

  Kernel_Erro_FalhaInesperada : PAnsiChar = 'Aten��o: Ocorreu uma falha ao tentar excluir ';

  //------------------------------------------------------------------------------
  // Mensagens de Confirma��o/Decisao do kernel
  //------------------------------------------------------------------------------

  Kernel_Confirmacao_ImportarDados : PAnsiChar = 'Deseja Realmente Importar esse dados?';
  Kernel_Confirmacao_ExportarDados :  PAnsiChar = 'Deseja Realmente Exportar esse dados?';
  Kernel_Confirmacao_Sair_Aplicacao : PAnsiChar = 'Deseja Realmente Finalizar a Aplica��o?';
  Kernel_Confirmacao_Apaga_Registro :  PAnsiChar = 'Deseja Realmente Excluir esse Registro?';
  Kernel_Confirmacao_Abandonar_Alteracoes :  PAnsiChar = 'Deseja Realmente Abandonar Altera��es?';
  Kernel_Confirmacao_Confirmacao_Saida : PAnsiChar = 'Deseja Realmente Confirmar essa Opera��o ?';

  //==============================================================================
  // Mensagens de Avisos do kernel
  //==============================================================================

  Kernel_Aviso_TabelaVazia_Filtro  : string = 'Nenhum Registro Encontrado no filtro utilizado !';
  Kernel_Aviso_TabelaVazia  : string = 'Nenhum Registro Encontrado no filtro utilizado !';
  Kernel_Aviso_CampoObrigatorio : string = 'Imposs�vel : Campo Obrigat�rio n�o preenchido';
  Kernel_Aviso_Exclusao : string = 'Registro Exclu�do com Sucesso!';
  Kernel_Aviso_Insercao : string = 'Registro Inserido com Sucesso!';
  Kernel_Aviso_Alteracao : string = 'Registro Alterado com Sucesso!';
  Kernel_Aviso_RegistrosVinculados : string = 'Exclus�o Imposs�vel. '+ #13 +
                      ' Motivo : Existe Registros Cadastrados com estas Informa��es.';
  Kernel_Aviso_Exclusao_RegistroPadrao : string = 'Exclus�o Impossivel. '+ #13 +
                           ' Motivo: Registro Padr�o do Banco de Dados';
  Kernel_Aviso_Alteracao_RegistroPadrao : string = 'Altera��o Impossivel. '+ #13 +
                           ' Motivo: Registro Padr�o do Banco de Dados';
  Kernel_Aviso_FecharSistema : string = 'O sistema ser� encerrado automaticamente para evitar futuros problemas!';

  //==============================================================================
  // Mensagens do Empresa de SoftHouse
  //==============================================================================

  Kernel_Nome_Projeto : string = 'LivreFrame - Framework';
  Kernel_Frase_SoftHouse : string = 'Sua necessidade! Nossa Inspira��o';
  Kernel_SuporteTecnico : string = 'Qualquer d�vida entre em contato com o Suporte T�cnico ou Administrador do Sistema.';

  
implementation

end.
