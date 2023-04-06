program Guia3Ejercicio8;


var
  impu:real;
  ganual:real;
begin

writeln('Ingrese el total ganado en el año');
readln(ganual);

If ganual<10000 then
   impu:=0
else
    if (ganual>=10000) and (ganual<15000) then
       impu:=(ganual-10000)*0.02
    else
        impu:=300+((ganual-15000)*0.05);


writeln('El impuesto segun el total ganado es igual a' ,impu:8:3);
readln;


end.

