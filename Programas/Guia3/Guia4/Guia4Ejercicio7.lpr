{Se conoce el radio de M esferas se pide ingresar esta informacion para calcular e informar el volumen de cada una , detener el proceso cuando se hayan procesado los M valores o cuando el
volumen de a esferas sea menor a X (ingresado por teclado)}

program Guia4Ejercicio70;
Uses math;
var

radio,volumen,x:real;
begin
Writeln('Ingrese el valor para comparar');
readln(x);
writeln('ingresar el radio de las esferas');
readln(radio);
volumen:=(4/3)*3.14*power(radio,3);
while volumen>=x  do
  begin
  writeln('El volumen de la esfera con radio',radio:8:2,'es:',volumen:8:2);
  writeln('Ingresar el nuevo radio ');
  readln(radio);
  volumen:=(4/3)*3.14*power(radio,3);
  end;
readln;
end.

