{Se pide desarrollar un programma correctamente modularizado que lea N vectores de 5 elementos reales
y para cada uno que cumpla que el quinto elementoes mayor al promedio de los 4 anteriores
lo copie en la fila de una matriz mostrar la matriz resultante }

program EjercicioAdicionalSegundoCuatri6;

type

  TM=array[1..4,1..5] of real;


 procedure lee(var vec:TM ; var n:byte);
 var
 i,j:byte;
 arch:text;
 begin
 assign(arch,'EjercicioAdicionalSegundoCuatri6.txt');
 reset(arch);
 readln(arch,n);
 for i:=1 to n do
    begin
    for j:=1 to 5 do
        begin
        readln(arch,vec[i,j]);
        end;

    end;
 end;

procedure escribe(vec:tv;n:byte);
var
i,j:byte;
begin
for i:=1 to n do
    for j:=1 to 5 do
   write(vec[i]:2:8);
writeln;
end;

var
  mat:tm;
  n:byte;
begin
lee(mat,n);
escribe(mat,n);
readln;
end.

