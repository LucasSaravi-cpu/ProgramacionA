{En un centro comercial se bonifica el estacionamiento de acuerdo al monto de la compra. El valor
de la hora de estacionamiento es de $ 1.5 por hora.

 Monto <= $20 no se bonifica
$20 < Monto <= $50 2 horas gratis
 $50 < Monto <= $100 3 horas gratis
 $ 100 < Monto gratis si día 1.5, otros días $ 8 de descuento
Procesar para un día determinado (1..7) que ingresa por teclado los datos (montos y horas ) de un
conjunto de clientes e informar:
a) Total de autos que no pagaron
b) Total de autos que pagaron con descuento }

program Guia4EjercicioAdicional3;
var
  nopaga,descuento,dia,n,i:byte;
  monto,horas,estacionamiento:real;
begin
nopaga:=0;
descuento:=0;
writeln('Ingrese la cantidad de clientes');
readln(n);
for i:=1 to n do
  begin
  writeln('ingrese las horas ');
  readln(horas);
  writeln('ingrese el monto');
  readln(monto);
  Writeln('ingrese el dia ');
  readln(dia);
  If monto <= 20 then
     Estacionamiento:=horas*1.5
  else
    if (monto>=20) and (monto<=50) then
       begin
       horas:=horas-2;
       if (horas<=0) then
          Nopaga:=NoPaga+1
       else
          begin
          estacionamiento:=horas*1.5;
          descuento:=descuento+1;
          end;
       end
    else
        if (monto>=50) and (monto<=100) then
           begin
           horas:=horas-3;
           if horas<=0 then
              Nopaga:=NoPaga+1
           else
             begin
             estacionamiento:=horas*1.5;
             descuento:=descuento+1;
             end
           end
        else
            if monto>100 then
              if dia<=5 then
                NoPaga:=NoPaga+1
             else
                begin
                Estacionamiento:=(horas*1.5)-8;
                descuento:=descuento+1;
                end;

  end;
writeln('El total de autos que no pagaron son ',nopaga,'total de autos que pagaron con descuento',descuento);
readln;
end.

