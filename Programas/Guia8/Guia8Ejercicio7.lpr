{Leer una matriz A de NxN números enteros. Armar un vector V con los elementos de la matriz
que pertenecen a filas de orden par y cumplen con la condición de ser mayores que el promedio
de los elementos de la columna a la que pertenecen. Mostrar V. }

program Guia8Ejercicio7;

type
   TM=array[1..50,1..50] of integer;
   TV=array[1..30] of integer;


Procedure LeeMatriz(Var Mat:TM; Var N:byte);
Var
i,j: byte;
arch:text;
Begin
assign(arch,'Guia8Ejercicio7.txt');
reset(Arch);
readln(arch,N);

For i:= 1 to N do
  begin
  For J:= 1 to N do
   Begin
   read(arch,mat[i,j])
   end;
  readln(arch);
  end;
end;


function PromedioColumnas(mat:tm;N,J:byte):real;
var
i:byte;
sumador:integer;
begin
sumador:=0;
for i:=1 to N do
   sumador:=sumador+mat[i,j];

promedioColumnas:=sumador/N;

end;


procedure GeneraArreglo(mat:tm;N:byte;var V:tv;var k:byte);
var
i,j:byte;
begin
k:=0;
i:=0;
while i<=N do
    begin
     i:=i+2;
    for j:=1 to n do
       begin
       if   mat[i,j]>promediocolumnas(mat,N,j) then
           begin
           k:=k+1;
           V[k]:=Mat[i,j];
           end;
       end;


    end;

end;


Procedure EscribeVector(V:TV;k:byte);
var
  i:byte;
begin
  for i:=1 to k do
      write(V[i]:4);
end;


Procedure EscribeMatriz (Mat: TM; N: Byte);
Var
 i, j: byte;
Begin
For i:= 1 to N do
   Begin
   For j:= 1 to n do
       Write(Mat[i, j]: 4);
Writeln;
   end;
end;




var
 N,k:byte;
 Mat:TM;
 B:TV;

begin
leematriz(mat,N);
EscribeMatriz(mat,N);
writeln;
GeneraArreglo(mat,N,B,K);
writeln('El vector generado es');
writeln;
EscribeVector(B,k);
readln;
end.
