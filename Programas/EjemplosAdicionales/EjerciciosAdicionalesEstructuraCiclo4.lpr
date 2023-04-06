{Una panaderia vende sus productos por kg , a los siguientes valores

pan $10
masas $50
tortas $70

Desea procesar las ventas realizadas en el dia , de cada una se conoce:

Codigo de producto( p-pan , M-masas , T-tortas *- fin de datos)
peso del producto
tipo de pago ( E -efectivo T-tarjeta)

Se pide ingresar las ventas para calcular e informar

a)importe total de ventas en el dia , efectivo y tarjeta por separado ( no importa el producto)
b) Cantidad ventas de pan , masas y tortas por separado
c)Importe de la venta maxima aclarando a que producto corresponde.

}


program EjerciciosAdicionalesEstructuraCiclo4;

Function monto(producto:char;peso:real):real;
begin
 case producto of
 'P':monto:=peso*10;
 'M':monto:=peso*50;
 'T':monto:=peso*70;
 end;

end;

var
  arch:text;
  maxventa,producto,pago:char;
  venta,tarjeta,efectivo,peso,max:Real;
  cont1,cont2,cont3:byte;
begin
  assign(arch,'EjerciciosAdicionalesEstructuraCiclo4.txt');
  reset(Arch);
  tarjeta:=0;
  efectivo:=0;
  cont1:=0;
  cont2:=0;
  cont3:=0;
  max:=0;
  while not eof(Arch) do
     begin
     readln(arch,producto,peso,pago,pago);
     producto:=upcase(producto);
     pago:=upcase(pago);

     If pago='E' then
        Efectivo:=Efectivo+monto(producto,peso)
     else
        tarjeta:=tarjeta+monto(producto,peso);

     if producto='P' then
        cont1:=cont1+1
     else
        if producto='M' then
           cont2:=cont2+1
        else
           cont3:=cont3+1;
     Venta:=monto(producto,peso);
     if (venta>max) then
         begin
         max:=venta;
         maxVenta:=producto;
         end;
     end;
writeln('Efectivo  ',efectivo:8:2,'  tarjeta  ',tarjeta:8:2);
writeln('pan',cont1,' masas  ',cont2,'  tortas',cont3);
writeln('venta maxima  ',max:8:2,'  ' ,maxventa);
close(arch);
readln;
end.

