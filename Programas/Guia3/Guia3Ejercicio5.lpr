{Leer el numero x calcular e imprimir el resultado de la funcion y definida asi :

y = 1+sqr(1+x) si x=0
0 si x=0
y=1-sqr(1-x) si x>0
}
program Guia3Ejercicio5;
var
y,x:real;
begin
writeln('Escribe el valor x');
readln(x);
if x<0 then
  y:=1+sqr(1+x)
else
   if x>0 then
     y:=1-sqr(1-x)
   else
     y:=0;

writeln('y:', y:8:2);
readln;
end.
