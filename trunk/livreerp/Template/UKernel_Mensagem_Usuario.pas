unit UKernel_Mensagem_Usuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls;


//==============================================================================
// Mensagens Usadas Para Modulo Kernel_Usuario
//==============================================================================
Const
  Kernel_SenhaInvalida : Pchar = 'Senha Inv�lida';
  Kernel_Informe_SenhaValida : PAnsiChar = 'Informe uma Senha v�lida';
  Kernel_Informe_LoginValido : PAnsiChar = 'Informe um usu�rio v�lido';

implementation

end.
