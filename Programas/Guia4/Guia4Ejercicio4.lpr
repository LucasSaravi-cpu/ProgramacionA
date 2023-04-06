{De M empleados se conoce la edad y la antiguedad en la empresa , a partir de dichos datos calcular e informar la antiguedad del mas joven y la edad del mas antiguo}

program Guia4Ejercicio4;
var
  edad,i,n,ant,antiguedad,masviejo:byte;
  max,min:real;

begin
min:=999999;
max:=-8888;
writeln('ingrese la cantidad de empleados');
readln(n);
for i:=1 to n do
    begin
    writeln('ingrese la edad');
    readln(edad);
    writeln('ingresar la antiguedad en la empresa');
    readln(Antiguedad);
    if edad<min then
       begin
       min:=edad;
       ant:=antiguedad;
       end;
    if antiguedad>max then
       begin
       max:=antiguedad;
       masviejo:=edad;
       end
    end;
writeln('La antiguedad del mas joven es de ', ant);
writeln('La edad del mas antiguo es de ',masviejo);
readln;
end.

