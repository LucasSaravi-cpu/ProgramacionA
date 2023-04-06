{Agregar el numero x, calculo de las raices reales(Si las tiene) al ejercicio 3}

program Guia3Ejercicio6;
var
a,b,c,x1,x2:real;

begin
 writeln('Escirbir los coeficientes de la ecuacion');
 readln(a,b,c);
 if sqr(b)-4*a*c<0 then
    writeln('tiene raices imaginarias')
 else
    begin
    writeln('tiene raices reales');
    x1:= -b+sqrt(sqr(b)-4*a*c)/(2*a);
    x2:= -b-sqrt(sqr(b)-4*a*c)/(2*a);
    writeln('x1= ',x1:8:2,'  x2= ',x2:8:2);
    end;
 readln;

end.


