{En un vivero se cuenta un archivo Ejemplares.dat que contiene las plantas que tiene a la venta. Cada ejemplar a la venta tiene un tipo y una especie
un codigo de barras ( unico para cada ejemplar) el  precio de venta y la antiguedad . La estructura del registro es entonces la siguiente :
Tipo A -arbol F-floral H- huerta 1 er campo de secuencia clave secundaria
especie (cadena de 10 , 2 do campo de secuencua clave secundaria
precio de venta ( real)
antiguedad ( entero)

Se solicita escribir un programa que genere el siguiente listado:

VIVERO - Resumen de ejemplares

Tipo : Arbol

Especies  Cod.Barras del mas caro    Cant.Ejemplares   cantidad con antigedad>3años
alamo     111111111                       1                      1
cedron    2222222222                      2                      1
pino      4444444444                      1                      1
precio venta promedio 20.00

Tipo : floral

Especies  Cod.Barras del mas caro    Cant.Ejemplares   cantidad con antigedad>3años
Amapola    6666666666                     2                        0
clavel     7777777777                     2                        1
rosa       9999999999                     1                        1
precio venta promedio 9.20


Tipo : huerta

Especies  Cod.Barras del mas caro    Cant.Ejemplares   cantidad con antigedad>3años
tomate     10101010                         1                        0
zapallo    21212121                         2                        0
precio venta promedio 7.67


Tipo con mas ejemplares Floral


A Alamo 1111111111 10.00 4
A Cedro 2222222222 15.00 8
A Cedro 3333333333  5.00 1
A Pino  4444444444 50.00 7
F Amapola 5555555555 5.00 2
F Amapola 6666666666 8.00 1
F Clavel  7777777777 9.00 3
F Clavel  8888888888 4.00 4
F Rosa    9999999999 20.00 4
H Tomate   1010101010 11.00 1
H zapallo  2121212121 8.00 1
H zapallo  3131313131 4.00 2
Z ZZZZZZZZZZ 0 0.00 0 0.00 0


}


program Final1;
Type

    st10=String[10];

    TR=record
    tipo:char;
    especie:St10;
    codigo:st10;
    precio:real;
    antiguedad:integer;
    end;

 TarVivero=File of TR;

Procedure Resuelve(var vivero:TarVivero);
var
r:TR;



ViveroTipoAct:char;
ViveroEspecieAct,ViveroEspecieAnt:st10;
sumaPrecio:real;
contadorEspecie:integer;
promedio:real;
ContadorEspeciesIguales:integer;
ContadorAntiguedad:integer;


begin

Reset(vivero);  {Abre el archivo}
read(vivero,R); {lee la componente actual sobre la variable  }
writeln('VIVERO RESUMEN DE EJEMPLARES');
  ViveroEspecieAnt:='  ';

while not eof(vivero) do { mientras que no se termine el archivo}
begin



sumaprecio:=0;
contadorEspecie:=0;
ViveroTipoAct:=r.tipo;

writeln('Tipo: ', ViveroTipoAct);
writeln('Especies  Cod.Barras del mas caro    Cant.Ejemplares   cantidad con antiguedad>3anios ');

while  (ViveroTipoAct=r.tipo)  do
          begin


          ViveroEspecieAct:=r.especie;


           if ViveroEspecieAnt<>ViveroEspecieAct then
              begin

               ContadorEspeciesIguales:=0;

            ContadorAntiguedad:=0;

          while(ViveroTipoAct=r.tipo) and (ViveroEspecieAct=r.especie) do
                    begin




                   if r.antiguedad>3 then
                      contadorAntiguedad:=contadorAntiguedad+1;

                    Sumaprecio:=SumaPrecio+r.precio;
                    ContadorEspecie:=ContadorEspecie+1;
                    contadorEspeciesIguales:=ContadorEspeciesIguales+1;


                     writeln(r.especie ,'  ', r.codigo,'   ',contadorEspeciesIguales,'    ',contadorAntiguedad) ;

                   ViveroEspecieAnt:=ViveroEspecieAct;
                      read(vivero,R);

                    end;


              end
           else
           begin
           read(vivero,r);
           end;





          end;

promedio:=Sumaprecio/ContadorEspecie;
writeln('El promedio de precio es ' , promedio:8:2);

end;


close(vivero);
end;


var
vivero:TarVivero;
begin
Assign(vivero, 'ejemplares.dat');
resuelve(vivero);

readln;
end.

