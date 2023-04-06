{Una farmacia vende medicamentos con descuento del %25 en perfumeria realiza descuento del %10
por compras mayores a $300 en venta libre no hace descuentos
se pide leer los datos de K ventas de cada uno se conoce
rubro (M ,P, L)
IMPORTE
calcular el total efectuado en concepto de desceuntos y el promedio de las ventas libres }

program Guia4Ejercicio3;
var
importe,descuento,sum,ventaslibres:real;
n,cont,i:word;
rubro:char;
begin
cont:=0;
sum:=0;
ventaslibres:=0;
Writeln('ingresar la cantidad de ventas');
readln(n);
for i:=1 to n do
begin
   writeln('Ingresar el importe');
   readln(importe);

   writeln('Ingrese el rubro para hacerle el descuento');
   writeln('M para medicamentos');
   writeln('P para perfumeria');
   writeln('L venta libre');
   readln(rubro);
   rubro:=upcase(rubro);
   case rubro of
   'M':begin
       Descuento:=importe*0.25;
       sum:=Sum+descuento;
       end;
   'P':begin
       if importe>300 then
          begin
          descuento:=importe*0.1;
          sum:=sum+descuento;
          end;
       end;
   'L':begin

       importe:=importe;
       ventaslibres:=ventaslibres+importe;
       cont:=cont+1;
       end
   end;
   end;
writeln('El promedio de las ventas libres es',(ventaslibres/cont):8:2);
writeln('El total efectuado en concepto de descuentos es',sum:8:2);
readln;
end.

