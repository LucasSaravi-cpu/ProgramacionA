{Se lee un conjunto de numeros positivos (el ultimo es un negativo) Se pide evaluar y mostrar para cada vaor ingresado el valor de y
siendo y=x^2+(x/2)+4 }

program Guia4Ejercicio5;
var
x,y:real;
begin
  writeln('Escribir numero positvo');
  readln(x);
  while (x>=0) do
  begin
  y:=sqr(x)+(x/2)+4;
  writeln('x=',x:8:2,' El valor de y=',y:8:2);
  writeln('Escribe otro numero positivo , para terminar ecribe un numero negativo');
  readln(x);
  end;
readln;
end.

