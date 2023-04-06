program Guia7Ejercicio17;
type
  TVstrg=array[1..50] of string[5];
  TVbyte=array[1..50] of byte;
  TVreal=array[1..50] of real;
  TVtipo=array[1..5] of real;
const
  CantDtipos=5;
  TipoImp:TVtipo=(12,14,22,14,22);
{17.- La oficina de Rentas de la Provincia de Bs As debe estimar lo que recaudar  en concepto de
impuestos inmobiliarios.
La informaci¢n disponible de cada inmueble (cuya cantidad no se conoce a priori) es
 Identificaci¢n (cadena de 5)
 Tipo (1-particular; 2-comercial; 3- bald¡o; 4-servicios; 5-otros)
 Superficie en m2
El impuesto se debe calcular multiplicando la superficie del inmueble por un valor, determinado por
el tipo del inmueble de la siguiente forma:
 Tipo 1  $12 por m2
 Tipos 2 y 4  $14 por m2
 Tipos 3 y 5  $22 por m2
Se aplica un incremento extra del 6% a los inmuebles cuya superficie supera la superficie
promedio general.
Se pide: desarrollar un programa que lea la informaci¢n indicada y almacene en estructuras
adecuadas, para luego informar:
a.- Para cada inmueble su identificaci¢n y el respectivo impuesto.
b.- Total a recaudar por cada tipo de inmueble (se sugiere implementar un arreglo de 5 elementos
utilizando el Tipo como ¡ndice) fijate de poner en el arreglo de superficie, que no se pide mostrar, el valor del impuesto a pagar}
Procedure LeeVec (var A:TVstrg;var B:TVbyte;var C:TVreal;var N:byte);
var
   Res:char;
   i:byte;
begin
  Res:='S';i:=1;
  while Res<>'N' do
        begin
             write('Ingrese la identificacion del ',i,' inmueble: ');
             readln(A[i]);
             write('Ahora el tipo: ');
             readln(B[i]);
             write('Por ultimo, ingrese la superficie: ');
             readln(C[i]);
             writeln('Hay otro inmueble(S/N)?');
             readln(Res);Res:=upcase(Res);
             i:=i+1;
        end;
  N:=i-1;
end;
Function Prom(A:TVreal;N:byte):real;
var
   i:byte;
   Aux:Real;
begin
  Aux:=0;
  for i:=1 to N do
  Aux:=Aux+A[i];
  Prom:=Aux/n;
end;
Function Imp(A:byte;B:real;K:real):real;
begin
  if B>K then
     Imp:=(B*TipoImp[A])*(1.06)
  else
     Imp:=B*TipoImp[A];
end;
Procedure IniciaVec(var A:TVtipo;N:byte);
var
   i:byte;
begin
  for i:=1 to N do
  A[i]:=0;
end;
Procedure EscribeVector(A:TVtipo);
var
  i:byte;
begin
  writeln('Los impuestos recaudados por inmuebles son: ');
  for i:=1 to CantDtipos do
      writeln('Para el tipo ',i,' se recaudan ',A[i]:1:2);
end;

{PROGRAMA PRINCIPAL}
var
  N,i:byte;
  PromSup,Impuesto:real;
  VecId:TVstrg;
  VecTyp:TVbyte;
  VecSup:TVreal;
  TotXtipo:TVtipo;
begin
  IniciaVec(TotXtipo,CantDtipos);
  LeeVec(VecId,VecTyp,VecSup,N);
  PromSup:=Prom(VecSup,N);
  For i:= 1 to N do
      begin
           Impuesto:=Imp(VecTyp[i],VecSup[i],PromSup);
           writeln('El impuesto ',i,' con identificacion ',VecId[i],' debe pagar ',Impuesto:1:2);
           TotXtipo[VecTyp[i]]:=TotXtipo[VecTyp[i]]+Impuesto;
      end;
  EscribeVector(TotXtipo);
  readln;

end.


