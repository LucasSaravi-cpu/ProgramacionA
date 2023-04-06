{Un delivery cobra los envios a partir de las 5 cuadras de la siguiente forma
hasta 10 cuadras --->$10
mas de 10 y menos de 25 ----> $15
por cuadra extra despues de 25 --->$2

Si el monto de la compra fue mayor a 300 tiene una bonificacion de 5 y si es mayor a 500 no se cobra el envio ( no importa distancia
se pide ingresar el monto de la compra y la distancia en cuadras de un conjunto de envos (monto=0 fin de datos). calcular e informar
el costo de cada uno y la canidad de envios con costo cero}

program EjerciciosAdicionalesEstructuraCiclo2;

function envios(distancia:byte):real;
begin
if distancia<=10 then
   envios:=10
else
   if (distancia>10) and (distancia<=25) then
      envios:=15
   else
       envios:=(distancia-25)*2;

end;

var
monto,costo:real;
dis,cont:byte;
begin
writeln('ingrese monto de compra');
readln(monto);
writeln('ingrese la distancia');
readln(dis);
cont:=0;
while monto<>0 do
   begin
   if monto<=300 then
      costo:=monto+envios(dis)
   else
     if (monto>=300) and (monto<=500) then
        costo:=monto+envios(dis)*0.95
   else
        begin
        costo:=monto;
        cont:=cont+1;
        end;
  writeln('El costo es de ' , costo:8:2);
  writeln('ingrese monto de compra');
  readln(monto);
  writeln('ingrese la distancia');
  readln(dis);
  end;

writeln('cantidad de envios es de ' , cont);

readln;
end.
