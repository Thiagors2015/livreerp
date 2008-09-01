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
unit uFuncoes_Sistema;

interface
 
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;
 
{ Retorna true se o computador est� configurado para rede }
function NetIsPresent: boolean;
{ Retorna o nome do computador }
function SysComputerName: string;
{ Retorna o diret�rio do Windows }
function SysWinDir: string;
{ Retorna a identifica��o da plataforma }
function SysPlatform: DWord;
{ Define o nome do computador }
function SysSetComputerName(const S: string): boolean;
{ Retorna o diret�rio System do Windows }
function SysSystemDir: string;
{ Retorna o diret�rio Temp do Windows }
function SysTempDir: string;
{ Retorna o nome do usu�rio logado no Windows }
function SysUserName: string;
{ Retorna informa��es de vers�o do Windows }
function SysVersion(var Ver: _OSVERSIONINFOA): boolean;
{ Retorna uma string contendo a vers�o do Windows }
function SysVersionStr: string;
 
{ Processa as mensagens enviadas a uma janela }
procedure WndProcessMessages(const Wnd: HWnd);
{ Processa as mensagens enviadas a uma janela - somente o intervalo
  de mensagens informado }
procedure WndProcessMessagesEx(const Wnd: HWnd; const FromMsg, ToMsg: Cardinal);
 
implementation
 
{ *** Net *** }
function NetIsPresent: boolean;
begin
  Result := GetSystemMetrics(SM_NETWORK) <> 0;
end;
 
{ Sys }
function SysComputerName: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;
 
function SysWinDir: string;
begin
  SetLength(Result, MAX_PATH);
  Windows.GetWindowsDirectory(PChar(Result), MAX_PATH);
  Result := string(PChar(Result));
end;
 
function SysPlatform: DWord;
var
  Ver: _OSVERSIONINFOA;
begin
  if SysVersion(Ver) then
  Result := Ver.dwPlatformId
  else
  Result := 0;
end;
 
function SysSetComputerName(const S: string): boolean;
begin
  Result := Windows.SetComputerName(PChar(S));
end;
 
function SysSystemDir: string;
begin
  SetLength(Result, MAX_PATH);
  if GetSystemDirectory(PChar(Result), MAX_PATH) > 0 then
  Result := string(PChar(Result))
  else
  Result := '';
end;
 
function SysTempDir: string;
begin
  SetLength(Result, MAX_PATH);
  if GetTempPath(MAX_PATH, PChar(Result)) > 0 then
  Result := string(PChar(Result))
  else
  Result := '';
end;
 
function SysUserName: string;
var
  I: DWord;
begin
  I := 255;
  SetLength(Result, I);
  Windows.GetUserName(PChar(Result), I);
  Result := string(PChar(Result));
end;
 
function SysVersion(var Ver: _OSVERSIONINFOA): boolean;
begin
  Ver.dwOSVersionInfoSize := SizeOf(Ver);
  Result := GetVersionEx(Ver);
end;
 
function SysVersionStr: string;
var
  Ver: _OSVERSIONINFOA;
begin
  if SysVersion(Ver) then
  Result := IntToStr(Ver.dwMajorVersion) + '.' +
  IntToStr(Ver.dwMinorVersion)
  else
  Result := '';
end;
 
procedure WndProcessMessages(const Wnd: HWnd);
begin
  WndProcessMessagesEx(Wnd, 0, 0);
end;
 
procedure WndProcessMessagesEx(const Wnd: HWnd; const FromMsg, ToMsg: Cardinal);
var
  Msg: tagMsg;
begin
  while PeekMessage(Msg, Wnd, FromMsg, ToMsg, PM_REMOVE) do
  DispatchMessage(Msg);
end;

end.

