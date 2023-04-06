{En una estaci¢n de servicio trabajan N operarios de playa que atienden en M surtidores de
combustible. Cada playero puede atender indistintamente en cualquier surtidor. Al final del d¡a
se tiene grabado en un archivo de texto los valores de N y M en la primera l¡nea y, luego por
cada l¡nea, la siguiente informaci¢n de cada playero:
 C¢digo de playero (2 caracteres)
 y a continuaci¢n el importe que recaud¢ dicho playero en cada uno de los M surtidores
(valor entero positivo o 0 si no lo utiliz¢)
Al final del d¡a, cada playero atendi¢ varios surtidores recaudando una cierta cantidad de dinero,
que representa un porcentaje sobre el total facturado por la estaci¢n de servicio. Sobre ese
porcentaje, cada playero cobra un extra seg£n la siguiente tabla:
40 <= Porcentaje ? $ 1000
30 <= Porcentaje < 40 ? $ 700
15 <= Porcentaje < 30 ? $ 360
 Porcentaje < 15 ? $ 0
Ingresar los datos almacenando los c¢digos en un arreglo de registros, y los importes de los
surtidores en una matriz de NxM. Luego de la lectura, completar el arreglo de registros con la
recaudaci¢n total de cada playero (en los M surtidores). A partir de esta informaci¢n calcular e
informar:
a) Por cada playero su c¢digo y el importe extra que debe percibir. Desarrollar para
utilizar en la resoluci¢n de este inciso, una funci¢n real que calcule el importe extra.
b) Generar un vector de registros con los surtidores con los que se haya vendido un
importe mayor a X (ingresado por teclado). Cada celda del vector debe contener el
n£mero de surtidor y el promedio vendido por playero (no contemplar playeros que
no hayan vendido con ese surtidor). Mostrar el arreglo generado.
c) Cu ntos playeros utilizaron todos los surtidores (puede ser ninguno) }

Program ParcialSegundoCuatrimestre4;
type
st2=string[2];
tr=record
nom:st2;
tot:real;
end;

tr2=record  { inciso b}
nro:byte;
prom:real;
end;

TM=array[1..20,1..20] of real;
tv=array[1..20] of tr;
tv2=array[1..20] of tr2;


procedure leematriz(var  playero :tv; var importes:tm; var n,m:byte);
var
arch:text;
i,j:byte;
recaudaron:real;
begin
assign(arch,'ParcialSegundoCuatrimestre4.txt');
reset(arch);
readln(arch,n,m);
for i:=1 to n do
   begin
   read(arch,playero[i].nom);
   recaudaron:=0;
   for j:=1 to m do
      begin
      read(arch,importes[i,j]);
      recaudaron:=recaudaron+importes[i,j];

      end;
      readln(arch);
   playero[i].tot:=recaudaron;
   end;
close(Arch);
end;


function total(importes:tm;n,m:byte):real;
var
i,j:byte;
begin
total:=0;
for i:=1 to n do
   for j:=1 to m do
      begin
      total:=total+importes[i,j];
      end;
end;

function ImporteExtra(playero:tv;importes:tm;n,m,i:byte):real;
var
j:byte;
porcentaje:real;
begin

   for j:=1 to m do
      begin
      porcentaje:=playero[i].tot/total(importes,n,m)*100;
      end;

  if (40<= porcentaje) then
    importeextra:=1000
  else
    if (porcentaje>=30)  then
      importeextra:=700
    else
       if (porcentaje>=15) and (porcentaje<30) then
         importeextra:=360
       else
          importeextra:=0;
end;

procedure ResuelveA(playero:tv;importes:tm;n,m:byte);
var
i,j:byte;
extra:real;
begin
for i:=1 to n do
  begin
   for j:=1 to m do
      begin
      Extra:=importeextra(playero,importes,n,m,i);
      end;
   writeln(playero[i].nom,' tiene un ingreso extra de ' , extra:2:3);
  end;
end;

procedure generaArreglo(playero:tv;importes:tm;n,m:byte; var r:tv2;var k:byte;x:real);     {Insiso b}
var
sum:real;
i,j,contador:byte;
begin
k:=0;
for j:=1 to m do
  begin
  sum:=0;
  contador:=0;
  for i:=1 to n do
     begin
     sum:=sum+importes[i,j];
     if importes[i,j]<>0 then
        contador:=contador+1

     end;

     if sum>x then
       begin
       k:=k+1;
       r[k].nro:=j;
       r[k].prom:=sum/contador;
       end;

  end;
end;


Procedure surtidores ( V : TV2; L : byte);
Var
 i : byte;
Begin
 For i:=1 to L do
    begin
    if v[i].prom<>0 then
       Writeln(V[i].nro,' ',v[i].prom:2:8);

    end;
End;

procedure EscribeMatriz(importes:tm;n,m:byte);
var
i,j:byte;
begin
for i:=1 to n do
   begin
   for j:=1 to m do
      write(importes[i,j]:4:2);
      writeln;
      end
end;

function todos(importes:tm;i,m:byte):boolean;
var
j:byte;
begin
j:=1;
while (j<=m) and (importes[i,j]<>0) do
     j:=j+1;
  todos:=j>m;
end;

function contador(importes:tm;n,m:byte):byte;
var
i,j:byte;
cont:byte;
begin
cont:=0;
   for i:=1 to n do

      if  todos(importes,i,m) then
          cont:=cont+1;

contador:=cont;
end;

var{Programa principal}
importes:tm;
k,n,m,i:byte;
playero:tv;
surtidor,r:tv2;
x:real;


begin{programa principal}
leematriz(playero,importes,n,m);
escribematriz(importes,m,n);

writeln('ingrese x');
readln(x);
generaArreglo(playero,importes,n,m,r,k,x);
writeln('la cantidad de playeros que utlizaron todos los surtidores son',contador(importes,n,m):2);
resuelveA(playero,importes,n,m);
surtidores(r,k);

readln;
end.

