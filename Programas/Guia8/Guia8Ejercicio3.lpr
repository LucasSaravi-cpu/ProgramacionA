{Calcular el promedio de los elementos de una matriz A de NxN (cuadrada) que cumplan
 A[i, j] <> A [j, i] (elementos simtricos diferentes) }

program Guia8Ejercicio3;
type
  TM=array [1..50, 1..50] of integer;

Procedure LeeMatriz (n:byte; var a:tm);
var
  j, i:byte;
begin
  for i:=1 to n do
  begin
      for j:=1 to n do
      begin
          write(' ingrese un valor para la posicion ',i,'x',j,'  '); readln(a[i,j]);
      end;
  end;
end;
{
Function CalculaPromedio(a:tm;n:byte):real;
var
  acum, i, j:byte;
  cont:word;
begin
  cont:=0;
  Acum:=0;
  for i:=1 to n do
     begin
    for j:=1 to n do
        begin
        if a[i, j] <> a[j, i] then
           begin
           acum:=acum+a[i,j];
           cont:=cont+1;
           end;

        end;
     end;

  CalculaPromedio:=(Acum/cont);
end;         }

Function CalculaPromedio(a:tm;n:byte):real;
var
  acum, i, j:byte;
  cont:word;
begin
  cont:=0;
  Acum:=0;
  for i:=1 to n do
     begin
      j:=1;
      while (n<j) and (a[i, j] <> a[j, i]) do
           j:=j+1;

       if a[i, j] <> a[j, i] then
           begin
           acum:=acum+a[i,j]+a[j,i];
           cont:=cont+2;
           end;

      end;

  CalculaPromedio:=(Acum/cont);
end;



var
  n:byte;
  a:tm;
begin

  writeln(' ingrese la cantidad de filas y columnas de la matriz ');
  readln(n);      //Como es cuadrada no necesitariamos M
  LeeMatriz (n, a);
  write(' el promedio de la suma es: ',CalculaPromedio (a, n):8:2);
  readln();

end.


