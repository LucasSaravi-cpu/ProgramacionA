{Desarrolle n programa pascal claro , eficiente , eficaz y modularizado que implemente la siguiente consigna
Leer en la primera linea de un archivo N y M a continuacion una matriz A entera de NxM y un vector B de N enteros
Cada linea tendra una fila de la matriz y a continuacion un elemento del vector paralelo a la fila

A partir de la matriz A y del arreglo B generar dos arreglos paralelos Vprom y Vfila .
Vprom es el promedio de los elementos de la fila que sea divisibles por la componente del vector B
en la misma posicion.
Vfila es complementado con el Nro de fila al cual corresponde el calculo.
No generar elementos en ambos arreglos Cuando
No hay multiplos en la fila
el promedio obtenido ya esta en Vprom.

Desarrollar la funcion promedio que recibe cada parametros de la mtriz A y el arreglo B y un valor para
la fila y obtiene el promedio de dicha fila , cero si no hay elementos.}

program EjercicioAdicionalSegundoCuatri2;

type
     TM=array[1..50,1..50] of integer;
     TV=array[1..50] of integer;
     TVprom=array[1..50] of real;
     TVfilas=array[1..50] of byte;



procedure leematriz(var mat:tm;var vec:tv; var n,m:byte );
var
i,j:byte;
arch:text;
begin
assign(arch,'EjercicioAdicionalSegundoCuatri2.txt');
reset(arch);
readln(arch,n,M);
for i:=1 to n do
   begin
   for j:=1 to m do
      begin
      read(arch,mat[i,j]);

      end;
read(arch,vec[i]);
readln(arch);

   end;
close(arch);
end;



Procedure EscribeMatriz (Mat: TM;vec:tv; N,M : Byte);
Var
 i, j: byte;
Begin
For i:= 1 to N do
   begin
   For j:= 1 to M do
       begin
       Write(Mat[i, j]: 4);
       end;
write(vec[i]:4);
Writeln;
   end;
end;

Function Esta ( Vec:TVprom; N:byte; prom:real ):boolean;
Var
 i: byte;
Begin
i:=1;
While (i< N) and (prom <> Vec[i]) do
 i:= i+1;
Esta := Vec[i] = prom;
End;


function promedio(mat:tm;vec:tv;m,i:byte):real;
var
j,cont:byte;
sum:real;
begin
sum:=0;
cont:=0;
for j:=1 to m do
    begin
    if (mat[i,j] mod vec[i]=0) then
       begin
       sum:=sum+mat[i,j];
       cont:=cont+1;

       end;
    end;
if cont<>0 then
  promedio:=sum/cont
else
  promedio:=0;
end;

procedure GeneraVectores(mat:tm;Vec:tv;N,M:byte; var vprom:tvprom ; var vfilas:tvfilas;var P:byte);
var
i,j:byte;
prom:real;
begin
p:=0;
for i:=1 to n do
begin
   for j:=1 to m do
      begin
      end;
prom:=promedio(mat,vec,m,i);

if (prom<>0) and ( not esta(vprom,n,prom)) then
   begin
   p:=p+1;
   vprom[p]:= prom ;
   vfilas[P]:=i;
   end;

end;
end;

procedure escribevectorprom(vprom:tvprom;p:byte);
var
i:byte;
begin
for i:=1 to p do
   write(vprom[i]:5:2);

end;

procedure escribevectorfilas(vfilas:tvfilas;f:byte);
var
i:byte;
begin
for i:=1 to f do
   write(vfilas[i]:5);
end;


var
n,m,p:byte;
mat:tm;
vec:tv;
vprom:tvprom;
vfilas:tvfilas;

begin
leematriz(mat,vec,n,m);
escribeMatriz(mat,vec,n,m);
generavectores(mat,vec,n,m,vprom,vfilas,p);
writeln('vector promedio');
Escribevectorprom(vprom,p);
writeln;
writeln('vector filas');
Escribevectorfilas(vfilas,p);
readln;


end.


