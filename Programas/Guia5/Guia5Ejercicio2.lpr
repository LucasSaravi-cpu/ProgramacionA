{Lee en cada linea de un archivo un par de datos X(real) ,N(entero positivo) calcula e informa X^N  Implementar y Utilizar
funcion potencia correctamente parametrizada
Que cambiaria si N fuera positivo , negativo o cero?}



program Guia5Ejercicio2;

Function Potencia(N:real;x:real):real;
begin
     potencia:=exp(n*ln(x));                                  {Si N es negativo , tengo que la N hacerla real ya que los numeros darian con ,}
end;                                                           {Si N es positivo , solo alcanzaria con numeros enteroos variable byte}
                                                                {Si N es 0 , el resultado de cualquier potencia elevado a la 0 es 1 }
var
x,resultado:real;
n:real;
arch:text;
begin
  assign(arch,'Guia5Ejercicio2.txt');
  reset(Arch);
  while not eof(arch) do
    begin
    readln(arch,n,x);
    resultado:=potencia(n,x);
    writeln('El resultado es',resultado:8:2);
    end;
close(Arch);
readln;
end.

