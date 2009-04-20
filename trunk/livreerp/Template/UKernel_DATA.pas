unit UKernel_DATA;

interface

  uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ADODB,
  IniFiles, Registry, ShellAPI,ComObj, ExtCtrls, DateUtils;

  {Descri��o: Retona uma data por extenso
  Parametros: dt_Data: Data a ser retornada como extenso
  Autor: S�rgio Guedes  }    
  function Kernel_DataExtenso(dt_Data:TDateTime): String;
  {Descri��o: Incrementa uma data em Dias
  Parametros: dt_inicial: Data a ser Incrementada em dias
    int_diasuteis: N�mero de dias que sera incrementado
  Autor: S�rgio Guedes  }
  function Kernel_IncrementaDataDias(dt_inicial: tdatetime;
    int_diasuteis: integer): tdatetime;
  {Descri��o: Decrementa uma data em Dias
  Parametros: dt_inicial: Data a ser Decrementada em dias
    int_diasuteis: N�mero de dias que sera Decrementado
  Autor: S�rgio Guedes  }
  function Kernel_DecrementaDataDias(dt_inicial: tdatetime;
    int_diasuteis: integer): tdatetime;
  {Descri��o: Retorna a diferen�a entre as duas horas
  Parametros: dt_inicio: Data inicial
    dt_fim: Data final
  Autor: S�rgio Guedes  }
  function Kernel_DiferencaEntreHoras(dt_Inicio, dt_fim: String): String;
  {Descri��o: Retorna a diferen�a de dias entre duas datas
  Parametros: dt_vencimento: Data de Vencimento, inicial
    Dt_Atual: Data atual para calcular diferen�a
  Autor: S�rgio Guedes  }
  function DiferencaDiasEntreDatas(dt_vencimento:TDateTime; Dt_Atual:TDateTime): String;
  {Descri��o: Retorna a idade da data passada como parametro
  Parametros: dt_nascimento: Data de Nascimento a ser retornada a idade
  Autor: S�rgio Guedes  }
  function Kernel_RetornaIdade(dt_nascimento : TDate): Integer;
  {Descri��o: Retorna o dia por extenso
  Parametros: dt_nascimento: Data de Nascimento a ser retornada a idade
  Autor: S�rgio Guedes  }  
  function Kernel_RetornaDiaExtenso(dt_Data: TDate): string;

  function Kernel_ProximoDiaUtil(apartirDe: TDate): TDate;
  function Kernel_FeriadoNacional(data: TDate): Boolean;

implementation

uses UdmPrincipal, UfrmKernel_Mensagem;

function Kernel_FeriadoNacional(data: TDate): Boolean;
begin
   Result := (FormatDateTime('DD/MM', data) = '01/01') or //Confraterniza��o Mundial
             (FormatDateTime('DD/MM', data) = '21/04') or //Tiradentes
             (FormatDateTime('DD/MM', data) = '01/05') or //Dia Mundial do Trabalho
             (FormatDateTime('DD/MM', data) = '07/09') or //Independ�ncia do Brasil
             (FormatDateTime('DD/MM', data) = '02/11') or //Finados
             (FormatDateTime('DD/MM', data) = '15/11') or //Proclama��o da Rep�blica
             (FormatDateTime('DD/MM', data) = '25/12') or //Natal
             (FormatDateTime('DD/MM', data) = '12/10');   //Nossa Senhora Aparecida / Crian�as
end;

function Kernel_ProximoDiaUtil(apartirDe: TDate): TDate;
begin
   Result := apartirDe + 1;
   if DayOfWeek(Result) = 7 then //s�bado
      Result := Result + 2;

   if DayOfWeek(Result) = 1 then //domingo
      Result := Result + 1;

   if Kernel_FeriadoNacional(Result) then
      Result := Kernel_ProximoDiaUtil(Result);
end;

function Kernel_RetornaDiaExtenso(dt_Data: TDate): string;
var i: Integer;
begin
  Result := '()';
  i := DayOfTheWeek(dt_Data);
  case i of
    1: Result := '(Segunda-feira)';
    2: Result := '(Ter�a-feira)';
    3: Result := '(Quarta-feira)';
    4: Result := '(Quinta-feira)';
    5: Result := '(Sexta-feira)';
    6: Result := '(S�bado)';
    7: Result := '(Domingo)';
  end;
end;

function DiferencaDiasEntreDatas(dt_vencimento:TDateTime; Dt_Atual:TDateTime): String;
Var Data: TDateTime;
dia, mes, ano: Word;
begin
  Data := Dt_Atual - dt_vencimento;
  DecodeDate( Data, ano, mes, dia);
  Result := FloatToStr(dia);
end;

function Kernel_RetornaIdade(dt_nascimento : TDate): Integer;
Var AuxIdade, Meses : String;
  MesesFloat : Real;
  IdadeInc, IdadeReal : Integer;
begin
  AuxIdade := Format('%0.2f', [(Date - dt_nascimento) / 365.6]);
  Meses := FloatToStr(Frac(StrToFloat(AuxIdade)));
  if AuxIdade = '0' then
  begin
  Result := 0;
  Exit;
  end;
  if Meses[1] = '-' then
  begin
  Meses := FloatToStr(StrToFloat(Meses) * -1);
  end;
  Delete(Meses, 1, 2);
  if Length(Meses) = 1 then
  begin
  Meses := Meses + '0';
  end;
  if (Meses <> '0') And (Meses <> '') then
  begin
  MesesFloat := Round(((365.6 * StrToInt(Meses)) / 100) / 30.47)
  end
  else
  begin
  MesesFloat := 0;
  end;
  if MesesFloat <> 12 then
  begin
  IdadeReal := Trunc(StrToFloat(AuxIdade)); // + MesesFloat;
  end
  else
  begin
  IdadeInc := Trunc(StrToFloat(AuxIdade));
  Inc(IdadeInc);
  IdadeReal := IdadeInc;
  end;
  Result := IdadeReal;
end;

function Kernel_IncrementaDataDias(dt_inicial: tdatetime;
  int_diasuteis: integer): tdatetime;
var dw:integer;
begin
  dw := DayOfWeek(dt_inicial)-1;
  result :=dt_inicial+int_diasuteis;
end;

function Kernel_DecrementaDataDias(dt_inicial: tdatetime;
    int_diasuteis: integer): tdatetime;
var dw:integer;
begin
  dw := DayOfWeek(dt_inicial)-1;
  result := dt_inicial-int_diasuteis;
end;

function Kernel_DiferencaEntreHoras(dt_Inicio, dt_fim: String): String;
{Retorna a diferen�a entre duas horas}
var
  FIni,FFim : TDateTime;
begin
  Fini := StrTotime(dt_Inicio);
  FFim := StrToTime(dt_fim);
  If (dt_Inicio > dt_fim) then
    begin
      Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
    end
   else
    begin
      Result := TimeToStr((StrTotime('23:59:59') + StrToTime('00:00:01') -Fini)+FFim);
    end;
end;

function Kernel_DataExtenso(dt_Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda';
  DiaDasemana [3]:= 'Ter�a';
  DiaDasemana [4]:= 'Quarta';
  DiaDasemana [5]:= 'Quinta';
  DiaDasemana [6]:= 'Sexta';
  DiaDasemana [7]:= 'S�bado';
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Mar�o';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (dt_Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (dt_Data);
  Result := DiaDaSemana[NoDia] {+ ', ' +
  IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano)};
end;


end.
