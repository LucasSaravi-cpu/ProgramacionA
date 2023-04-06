{Leer numero de libreta y tres notas ( de tipo real) correspondientes a una materia mostrar numero de libreta y dos
carteles indicado si aprobo o no , para aprobar se necesita un promedio de 5 puntos como minimo)
ademas informar el concepto de la siguiente forma:

si obtienes 9 o mas le corresponde sobresaliente
menos de 9 y hasta 8 inclusive el concepto es distinguido
menos de 8 y hasta 6 es bueno
menos de 6 y hasta 4 regular
menos de 5 es insuficiente }

program Guia3Ejercicio9;
var
promedio,a,b,c:real;
libreta:byte;
begin
writeln('Ingrese el numero de la libreta');
readln(libreta);
writeln('ingrese 3 notas a b c');
readln(a,b,c);
promedio:=(a+b+c)/3;
if promedio<=5 then
   begin
   if promedio<=4 then
      writeln('concepto desaprobado. insuficiente')
   else
       if (promedio <6) and (promedio>=4)then
           writeln('concepto desaprobado. regular')
   end
else
    if (promedio<=8) and (promedio>=6) then
       writeln('concepto aprobado ,bueno')
      else
          writeln(' concepto aprobado ,distinguido');


readln;
end.
