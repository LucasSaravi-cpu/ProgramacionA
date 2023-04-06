{leer dos numeros reales y luego utilizar en forma repetitiva un menu para obtener uno o mas de los siguientes
resultados: suma . resta producto o division}

program Guia4EjemploRepeat;
var
  x,y:real;
  op:char;
begin
writeln('Ingresen dos numeros distintos de cero');
readln(x,y);

repeat
  writeln('S Suma');
  writeln('R resta');
  writeln('P producto');
  writeln('D division');
  writeln('F finalizar');
  writeln('ingrese la opcon');
  readln(op);

  if op='S' then
     writeln(x+y:8:2)
  else
     if op='R' then
        writeln(x-y:8:2)
     else
        if op='P' then
           writeln(x*y:8:2)
        else
           if op='D' then
              writeln(x/y:8:2);

  until op='F' ;  {Cuando apreto F termina el repeat , no lleva begin . Y es hasta que se cumpla la opcion ingresada sigue'}
readln;
end.
