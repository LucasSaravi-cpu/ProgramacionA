{Callar e informar el factorial de cada numero de un conjunto cuya cantidad no se conoce ( -1 indicar fin de datos)
Implementar y utilizar funcion factorial correctamente parametriada}

program Guia5Ejercicio1;

function factorial(n:integer):integer;
var
 res,i:integer;
begin
res:=1;
for i:=1 to n do
    res:=res*i;  {La variable i va aumentando}

factorial:=res;
end;


var
n,resultado:integer;

begin
writeln('ingrese un numero');
readln(n);
while n<>-1 do
   begin
   resultado:=factorial(n);
   writeln('El factorial es ' ,resultado:3);
   writeln('Ingrese otro numero');
   readln(n);
   end;
readln;
end.

