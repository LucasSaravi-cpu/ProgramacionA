{En un vivero se cuenta con un archivo Especies.dat que contiene las plantas de cada especie

especie candena de 10 caracteres y campo de secuencia clave primaria
tipo A arbol F flora H huerta
precio real
cantidad entero postifo

Cada ccompra que realiza el vivero a sus provedores se registra en un archivo compras.dat

Se solicita que actualize el archivo especies.dat con la compra realizada

Se permite la compra de NUEVAS ESPECIES
el procentaje de ganancia necesario para establecer el precio de venta , depende del 30% para los arboles , del 25 para los flores y el 40 para la huerta..


En el proceso generar el siguiente listado

VIVERO - COMPRAS DE ESPECIES

Cantidad de especies compradas 7 99 ejemplares
cantidad de especies nuevas 2    32 ejemplares
Importe tltal de la compra es de  550
Especies con mayor cantidad de ejemplares en el vivero Rosa

Especies.dat
Alamo   A  100 4
albaca  H  12.50 45
amapola F  80 10
cedro   A  150 8
clavel  F  40 40
pino    A  500 7
rosa    F  20 50
tomate   H 11 15
zapallo  H 24 20
ZZZZZZ   Z 99 99


compras.dat
abedul  A 290 12
alamo   A  50 2
albaca  H  30 20
cedro   A  110 5
rosa    F   10 30
tomillo  H  23 20
zapallo  H  29 30
ZZZZZZZ  Z 99 99


El archivo actualizado
abebul A 377 12
alamo A 123.50 6
albaca H 14 65
amapola F 80 10
cedro   A  343 13
clavel  F  40 40
pino    A  500 7
rosa    F  12.50 80
tomate  H   11  25
tomillo  H  21 20
zapallo  H  28 30

 }

program project1;


type
   st10=string[10];
   tr=record
      nombre:st10;
      tipo:char;
      precio:real;
      cantidad:byte;
    end;
tarcompras=file of tr;
Tarespecies=file of tr;

var{programa princiapl}
compras:Tarcompras;
especies:Tarespecies;

procedure modificaciones(var compras:Tarcompras;var especies:Tarespecies);

var
temp:tarespecies;
Com:tr;
esp:tr;
cant,max,CantidadEjemplares:byte;
precioFinal:real;
EspeciesCompradas,EspeciesNuevasCompradas:byte;
EspeciesNuevas, EspeciesNuevasCanatidad:byte;
ImporteTotal:real;
maxnombre:st10;
begin

assign(temp,'temp.dat');
rewrite(temp); {se abre el archivo para gravar los datos nuevos}
reset(compras);
reset(especies);
read(especies,esp);
read(compras,com);
EspeciesCompradas:=0;
EspeciesNuevas:=0;
EspeciesNuevasCanatidad:=0;
EspeciesNuevasCompradas:=0;
ImporteTotal:=0;
max:=0;


while not eof(especies) or not eof(compras) do
     begin
     CantidadEjemplares:=0;
     if com.nombre<esp.nombre then
        begin

        write(temp,com);
       EspeciesNuevas:=EspeciesNuevas+1;
         EspeciesCompradas:=especiescompradas+1;
         EspeciesNuevasCompradas:=EspeciesNuevasCompradas+com.cantidad;
       EspeciesNuevasCanatidad:=EspeciesNuevasCanatidad+com.cantidad;
       ImporteTotal:=importeTotal+ com.precio;
        read(compras,com);
        end
     else
        if com.nombre=esp.nombre then
           begin
           EspeciesCompradas:=especiescompradas+1;
            ImporteTotal:=importeTotal+ com.precio;
           EspeciesNuevasCompradas:=EspeciesNuevasCompradas+com.cantidad;
           cant:=0;
           precioFinal:=0;
           if (esp.tipo='A') then
              begin


               precioFinal:= (esp.precio+com.precio)*1.3 ;

              end
              else
                  if (esp.tipo='F') then
                  begin


                   precioFinal:= (esp.precio+com.precio)*1.25 ;

                  end
                  else
                        begin


                         precioFinal:= (esp.precio+com.precio)*1.4 ;

                        end;
               cant:=com.cantidad + esp.cantidad;
               esp.precio:=precioFinal;
               esp.cantidad:= cant;
              write(temp,esp);
              read(compras,com);
              read(especies,esp);
              end
         else
         begin

            read(especies,esp);

            write(temp,esp);
         end;


CantidadEjemplares:=esp.cantidad+com.cantidad;
writeln(esp.cantidad);

if (max<CantidadEjemplares) then
begin
maxNombre:=esp.nombre;

max:=cantidadEjemplares;
end;



end;
close(especies);
close(compras);
close(temp);
writeln('La cantidad de especies nuevas son ' , especiesnuevas , ' y su cantidad son ' , EspeciesNuevasCanatidad );
writeln('La cantidad de especies compradas son ' , especiescompradas, ' y su cantidad son ' , EspeciesNuevasCompradas);
writeln('El importe total es de ' ,  ImporteTotal:8:2);
writeln('El maximo es ' , cantidadEjemplares, ' y el nombre es ' , maxnombre);

end;

begin{programa principal}
assign(especies,'especies.dat');
assign(compras,'compras.dat');
modificaciones(compras,especies);
readln;

end.


