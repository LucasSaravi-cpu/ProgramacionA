{Dados dos numeros calcular las cuatro operaciones aritmeticas , utilizando un menu de opciones para ingresar un codigo que indique la operacion a realizar , escribe el resultado}


program Guia3Ejercicio12A;
var
x1,x2:real;
opcion:char;
begin
writeln('Ingrese dos numeros en los cuales quiere hacer alguna operacion');
readln(x1,x2);
writeln('Ingrese en el menu la letra de la operacion que quiera realizar');
writeln('S para sumar');
writeln('R para restar');
writeln('M para multiplicar');
writeln('D para dividir');
readln(opcion);

opcion:=upcase(opcion);   {  devuelve la mayuscula del argumento}

case opcion of
'S':writeln('La suma es de ',x1+x2:8:2);
'R':writeln('la resta es de ' ,x1-x2:8:2);
'D':if x2<>0 then
       writeln('la divicion es de ',x1/x2:8:2)
    else
       writeln('Error en la divicion , se dividio por 0');
'M':writeln('La multiplicacion es de ',x1*x2:8:2);
end;
readln;
end.

