{Un conjunt de corredores entrenan para una carrera , corriendo una hora cada uno de los 7 dias de la semana y
teniendo como meta alcanzar en dicha hora , una minima de x kms .
En un archivo de texto se graba la meta x en la primera linea y en la restantes el nombre y los 7 dias de cada corredor
por linea.

Se pide desarrollar un programa pascal correctamente modularizado que lea  almacene los nombres en un vetor
y los tramos en una matriz
A.Generar un arreglo con los nombres de los corredores que superaron la meta establecida algun dia de la semana .Imprimirlos
B.Calcule e imprima .Cuantos dias no alcanzo la meta el corredor con promedo diario maximo}

program EjercicioAdicionalSegundoCuatri1;

const
      maxfilas=4;
      Dias=7;

type
    st3=string[3];
    TV=array[1..maxfilas] of st3;
    TM=array[1..maxfilas,1..dias] of  real;



procedure LeeMatrizyVector(var mat:TM ; var vec:TV; var x:real);
var
i,j:byte;
arch:text;
begin
assign(arch,'EjercicioAdicionalSegundoCuatri1.txt');
reset(Arch);
readln(arch,x);
for i:=1 to maxfilas do
   begin
   read(arch,vec[i]);
   for j:=1  to dias do
       begin

       read(arch,mat[i,j]);
       end;
   readln(arch);
   end;
close(arch);
end;

procedure Escribe(mat:TM ; vec:TV);
var
i,j:byte;

begin

for i:=1 to maxfilas do
   begin
   write(vec[i]);
   for j:=1 to dias do
      begin

      write(mat[i,j]:8:2);
      end;
   writeln;
   end;

end;

Function promedio(mat:tm;i:byte):real;
var
j:byte;
sum:real;
begin
sum:=0;
for j:=1 to dias do
    begin
    sum:=sum+mat[i,j]
    end;

promedio:=sum/dias;
end;

function esta(mat:tm;x:Real;i:byte):boolean;
var
j:byte;
begin
j:=1;
while (j<dias) and (x>mat[i,j])  do
j:=j+1;

Esta:=mat[i,j]>=x;
end;

procedure GeneraVector(mat:tm;vec:tv;x:real;var VectorResultante:tv; var k:byte);
var
i,j:byte;
begin
k:=0;
for i:=1 to maxfilas do
    begin
    for j:=1 to dias do
        begin
        end;
      if esta(mat,x,i) then
        begin
        k:=k+1;
        vectorresultante[k]:=vec[i];
        end;

    end;
end;

function MaxPromedio( mat:tm;vec:tv;x:real):byte;
var
i,j,maxpromediofila:byte;
max,prom:real;
begin
max:=0;
for i:=1 to maxfilas do
    begin
    for j:=1 to dias do
        begin

        end;
    prom:=promedio(mat,i);
    if  prom>=max then
        maxPromedioFila:=i;
        max:=prom;
    end;

maxpromedio:=maxpromediofila;
end;


procedure resolucionB(mat:tm;vec:tv;x:real);
var
cont,j,fila:byte;

begin
cont:=0;
Fila:=maxpromedio(mat,vec,x);
for j:=1 to dias do
   begin
   if mat[fila,j]<x then
      cont:=cont+1;
   end;
if cont<>0 then
   writeln('Los dias que no alcanzo la meta el  ',vec[fila], ' son  ' , cont,'dias' )
else
   writeln('todos los dias alcanzaron la meta');

end;

procedure escribe(vectorresultante:tv;k:byte);
var
i:Byte;
begin
for i:=1 to k do
    begin
    write(vectorResultante[i],'  ')
    end;
end;

var
mat:TM;
vec,vectorResultante:TV;
x:real;
k:byte;

begin

LeeMatrizyVector(mat,vec,x);
escribe(mat,vec);
GeneraVector(mat,vec,x,vectorResultante,k);
escribe(vectorResultante,k);
writeln;
resolucionB(mat,vec,x);
readln;
end.

