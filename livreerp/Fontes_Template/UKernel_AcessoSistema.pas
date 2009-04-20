unit UKernel_AcessoSistema;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls, ACBrValidador, ACBrBase,
  Variants, menus, SqlExpr ;

  function retornaCodMenu(const Textomenu: string): Integer;
  function retiraCaracterAtalho(const texto: String): String;
  procedure verificaAcessoSubMenu(const menu: TmenuItem);

  function verificarAcesso(const codmenu: integer): Boolean;

  //permissoes por usuario
  procedure verificaAcessoSubMenuUsuario(const menu: TmenuItem);
  function verificarAcessoUsuario(const codmenu: integer): Boolean;

implementation

uses UdmPrincipal, UKernel_DB, UKernel_VariaveisPublic, UKernel_DATA,
  UdmKernel_Acesso;

// incio permissoes por usuario

procedure verificaAcessoSubMenuUsuario(const menu: TmenuItem);
var
  I: integer;
begin
  {se a fun��o retornar positivo e a permissao por perfil nao esta visivel mostra}
  if verificarAcessoUsuario(retornaCodMenu(retiraCaracterAtalho(menu.name))) then
    if menu.Visible = False then  
      menu.Visible:= True;

  // Verifica acesso a submenus
  for i := 0 to pred(menu.Count) do
    verificaAcessoSubMenuUsuario(menu.Items[i]);
end;

{o Metodo recebe como parametro de entrada o codigo do menu corrente para capturar
o codigo do menu em quest�o -- acesso}
function verificarAcessoUsuario(const codmenu: integer): Boolean;
begin
  Result := True;

  with dmKernel_Acesso, qryAcessoMenuUsuario do
  begin
    close;
//    Params.ParamByName('Codusu').value := codUsuario;  //recebe o codigo do usuario logado
    Params.ParamByName('CODMENU').value := codMenu; //recebe o codigo do menu logado
    Open;

    //se o campo consulta for = T e o codmenu = -1 ent�o
    if (FieldByName('actconsultar').AsString = 'T') or (codMenu = -1) then
      Result := True          //a fun��o retorna possitivo
    else
      Result := False;  //se n�o a fun��o retorna negativo
    end;
end;

//  fim permissoes por usuario
function retornaCodMenu(const Textomenu: string): Integer;
var
  Qry:TsqlQuery;
begin
  qry := TsqlQuery.Create(nil); {: cria uma inst�ncia do objeto}
  try
    with Qry do
    begin
      sqlConnection:= FConexao; {: componente de conex�o}
      sql.Add('SELECT CODMENU FROM MENU WHERE NOMENAME = ' + QuotedStr(Trim(textoMenu)));
      Open;
      if not IsEmpty then
        Result := Fields[0].AsInteger
      else
        Result := -1;
    end;
  finally
    FreeAndNil(Qry);  {: libera o objeto da mem�ria}
  end;
end;

{Utilizada para remover o "&" colocado autymaticamente pelo delphi em cada item
do menu do mainmenu}
function retiraCaracterAtalho(const texto: String): String;
var
  i, tamanho : Integer;
begin
  tamanho := Length(texto);
  for i := 1 to tamanho do
    if texto[i] <> '&' then
      Result := Result + texto[i];
end;

{caso o usuario n�o seja administrador realizamos um loop (foo..do) nos itens
do mmMain passando como parametro de entrada ao metodo verificaacessosubmenu}
procedure verificaAcessoSubMenu(const menu: TmenuItem);
var
  I: integer;
begin
  {se a fun��o retornar negativa ent�o nega o acesso ao usuario logado}
  if not verificarAcesso(retornaCodMenu(retiraCaracterAtalho(menu.name))) then
    menu.Visible:= False;

  // Verifica acesso a submenus
  for i := 0 to pred(menu.Count) do
    verificaAcessoSubMenu(menu.Items[i]);
end;

{o Metodo recebe como parametro de entrada o codigo do menu corrente para capturar
o codigo do menu em quest�o -- acesso}
function verificarAcesso(const codmenu: integer): Boolean;
begin
  Result := False; // nao tem acesso

  with dmKernel_Acesso, qryAcessoMenu do
  begin
    close;
    Params.ParamByName('CODMENU').value := codMenu; //recebe o codigo do menu logado
    Open;

    if not IsEmpty then
    begin
      //se o campo consulta for = T e o codmenu = -1 ent�o
      if (FieldByName('actconsultar').AsString = 'T') or (codMenu = -1) then
        Result := True          //se for T tem acesso ao menu
      else
        Result := False;  //se for F n�o tem acesso ao menu
      end
     else
      Result := False;  //se for vazia n�o tem acesso ao menu
  end;
end;

end.
