{El ente de Comercio Exterior controla si las empresas respetan el límite de exportación que se le asigna (Monto total
permitido). Para ello almacena en dos archivos, CUPOS y VENTAS, la siguiente información:
ARCHIVO CUPOS
-Cod. Empresa ANU5 {campo de secuencia ,
 clave primaria}
-Límite de exportación
-Monto exportado
ARCHIVO VENTAS
-Cod. Empresa ANU5 {campo de secuencia ,
 clave primaria}
-Tipo de mercadería {A, B ó C}
-Monto de mercadería
Considerar que si se trata de mercadería B ó C hay un fomento de exportación, por lo tanto los montos se reducen
en un 15 % y 20 % respectivamente.
Se pide enfrentar ambos archivos para actualizar CUPOS modificando el Monto exportado, siempre que no supere el
Límite de exportación. Si lo supera, no se debe actualizar el Monto exportado y se lista la venta (Cod, Tipo y Monto).
Calcular y listar al final del proceso:
a) Porcentaje de empresas con ventas aceptadas sobre el total de empresas.
b) Cantidad de ventas erróneas, por no corresponden a ninguna empresa registrada en CUPOS.
c) Monto promedio de las ventas rechazadas

Ejemplo txt :

Cod. Empresa|Límite de exportación|Monto exportado
001|50000|20000
002|100000|50000
003|75000|30000
004|200000|100000
005|30000|15000

Cod. Empresa|Tipo de mercadería|Monto de mercadería
001|A|10000
004|C|50000
005|B|10000








}

program EnfrentamientoCuposYventas;

type
   st5=string[5];
   tr=record
      codigo:st5;
      cupoExportacion:real;
      MontoExpor:real;
   end;
   tr2=record
   codigo:st5;
   tipo:char;
   MontoMercaderia:Real;
   end;

   tar=file of tr;
   tarb=file of tr2;

var
  cupos:tar;
  ventas:tarb;


Procedure Modificaciones(var cupos:tar; var ventas:tarb);
var
temp:tar;
CU:tr;
VEN:tr2;
ventaaceptada,ventaerronea:byte;
porce:real;
begin
ventaerronea:=0;
ventaaceptada:=0;
assign(temp,'temp.dat');
rewrite(temp); {se abre el archivo para gravar los datos nuevos}
reset(cupos);
reset(ventas);
read(cupos,cu);
read(ventas,ven);
while not eof(cupos) or not eof(ventas) do
  if cu.codigo>ven.codigo then
     begin
     read(ventas,ven); {avanza en la siguiente venta}
     ventaerronea:=ventaerronea+1;      { cantidad de ventas erroneas esta en ventas y no en cupos }
     end
  else
      if cu.codigo=ven.codigo then { si los codigos son iguales entonces se hace la modificaci¢n}
         begin
         if (cu.cupoexportacion>=cu.montoexpor) then  {se acepta la venta}
            begin
            if  (ven.tipo='A') then
                cu.montoexpor:=ven.montomercaderia*0.9
            else
                if  (ven.tipo='B') then
                    cu.montoexpor:=ven.montomercaderia*0.85
                else
                    cu.montoexpor:=ven.montomercaderia;

            ventaaceptada:=ventaaceptada+1;              { se cuenta la ventas aceptadas}
            write(temp,cu); { copio el cupo actualizados }
            read(ventas,ven);
            read(cupos,cu);
            end
         else                   {no se acepta la venta}
            begin
            writeln('Supero el monto exportado se lista la venta ' , ven.codigo,' ',ven.tipo,' ',ven.montomercaderia:2:3);
            write(temp,cu);
            read(ventas,ven);    { avanzo en ventas  }
            read(cupos,cu);{ avanzo en cupos }
            end
         end {finaliza el begin de cu.codigo=ven.codigo}
    else           { else de cu.codigo<ven.codigo}
        begin
        write(temp,cu);
        read(cupos,cu);{avanza en el siguiente cupo}
        end;             {fin del if y fin del while}

write(temp,cu);{graba el centinela en el archivo actualizado}
Porce:=ventaaceptada/(filesize(cupos)-1)*100;   { filesize(cupos) ya que los cupos indican la cantidad de empresas, le resto uno por que cuenta tambien el centinela }
close(ventas);
close(cupos);
close(temp);
writeln('La cantidad de ventas erroneas son ',ventaerronea:2);
writeln('El % de empresas con ventas aceptadas es',porce:2:3);
end;


begin{programa principal}

assign(cupos,'cupos.dat');
assign(ventas,'ventas.dat');
modificaciones(cupos,ventas);

readln;
end.



