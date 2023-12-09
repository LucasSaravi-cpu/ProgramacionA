{Leer en la primera linea de un archivo de texto N y M a continuacion una matriz A entera de NxM y un B vector de N enteros
cada linea de larchivo tendra una fila de la matriz y a continacuion un elemento del vector paralelo a la fila

4 3
16 3 4     4
11 4 10    3
2 14 8     7
8 6 16     2


A partir de la matriz A y del arreglo B genere dos arreglos paralelos Vprom y vfilas

vprom es el promedio con los elemtnos de la fila que sea divisible por la componenete del vector B en la misma posicion
V fila es complemento con el nro de fila al cual corresponde el calculo


no generar elementos en ambos arreglos cuando
a) no hay multiplos en la fila
b) el promedio obtenido ya esta en vprom ( para otra fila )

desarrollar la funcon promedio que recibe como parametro la matriz A el arreglo B y un valor para la fila y obtene el promedio de dicha fila , cero si no hay elementos
impirmir ambos arreglos}


program project1;



Const
   TOPE =10;

type

   MT = array[1..TOPE,1..TOPE] of byte;


TV = array[1..TOPE] of byte;
TV2 = array[1..TOPE] of byte;
TV3 = array[1..TOPE] of real;



function promedio(mat:mt;m:byte;vec:tv;fila:byte):real;
var
sum,cont:byte;
j:byte;
begin
sum:=0;
cont:=0;

for j:=1 to m do
      begin
      if (mat[fila,j] mod vec[fila]=0) then
         begin
         sum:=sum+mat[fila,j];
         cont:=cont+1;
         end;


      end;
if cont<>0 then
  promedio:=sum/cont
else
  promedio:=0;


end;




procedure Leematriz(var mat:mt ;var n,m:byte ;var vec:tv);
var
i,j:byte;
arch:text;
espacio:char;

begin
assign(arch,'matriz.txt');
reset(Arch);
readln(arch,n,m);



    for i:=1 to n do
       begin
       for j:=1 to m do
          begin
           read(arch,mat[i][j],espacio);
           end;
       read(arch , Vec[i]);
       readln(Arch);
       end;


close(Arch);
end;


 procedure MuestraMat( mat: MT;  n,m: Byte);
var
  j,i: Byte;
begin
   for i:=1 to n do
       begin
       for j:=1  to m do
          begin
           write(mat[i][j]);
           end;
       writeln();

       end;
end;

  procedure Escribevec( vec: tv; n:byte);
var
  i: Byte;
begin
   for i:=1 to n do
        begin
           writeln(vec[i]:3);



       end;
end;
procedure EscribevecProm( vec: tv3; n:byte);
var
i: Byte;
begin
 for i:=1 to n do
      begin
         writeln(vec[i]:8:2);



     end;
end;


Function esta(vecprom:tv3 ; k:byte; valor:real):byte;
var
i:byte;
begin

 esta:=0; //No esta

 for i:=1 to k do
      begin
      if vecprom[i]=valor then
         esta:=1;
      end;



end;

procedure generaVectores(vec:tv;mat:mt;n,m:byte;var vecprom :tv3 ; var vecfila :tv2; var k:byte);
var
  prom:real;
  i:byte;
begin
k:=1;
for i:=1 to n do
      begin
      prom:=promedio(mat,m,vec,i);


      writeln(esta(vecprom,k,prom));

      if (prom<>0) and (esta(vecprom,k,prom)<>1)  then
        begin

         vecfila[k]:=i;
          vecprom[k]:=prom;
          k:=k+1;
        end;




end;

end;


var
vec:tv;
vecprom:tv3;
vecfila:tv2;
mat:mt;
n,m,k:byte;
begin
writeln('La matriz es ');
LeeMatriz(mat,n,m,vec);
muestramat(mat,n,m);
writeln('El vector con el que vamos a trabajar es');
escribevec(vec,n);
generavectores(vec,mat,n,m,vecprom,vecfila,k);
writeln(' el vector promedio es ');
escribevecProm(vecprom,k);
writeln('El vector fila es ');
escribevec(vecfila,k);

readln;
end.

