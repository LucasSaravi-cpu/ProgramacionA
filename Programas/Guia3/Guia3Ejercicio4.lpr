{El costo de un pasaje aereo depende de la clase 1000 turista y 2000 bussines y recibe un descuento del 10% si viaja la primera semana del mes . Ingrese
la clase (T o B ) y el dia (1..31) indicar el importe del pasaje}

program Guia3Ejercicio4;
var
dia:byte;
clase:char;
Importe:real;
begin
writeln('Ingrese el dia del mes que viajara');
readln(dia);
writeln('Ingrese la clase T o B');
readln(clase);
clase:=upcase(clase);
if (clase='B') then
  importe:=2000
else
  importe:=1000;

if (dia<=7) then
 importe:=importe*0.9;

writeln('Debe pagar $',importe:8:2);
readln;
end.
