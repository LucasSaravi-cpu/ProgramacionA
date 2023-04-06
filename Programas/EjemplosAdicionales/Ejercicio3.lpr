{En un centro comercial se bonifica el estacionamiento de acuerdo al monto de la compra. El valor
de la hora de estacionamiento es de $ 1.5 por hora.

 Monto <= $20 no se bonifica
$20 < Monto <= $50 2 horas gratis
 $50 < Monto <= $100 3 horas gratis
 $ 100 < Monto gratis si día 1.5, otros días $ 8 de descuento
Procesar para un día determinado (1..7) que ingresa por teclado los datos (montos y horas ) de un
conjunto de clientes e informar:
a) Total de autos que no pagaron
b) Total de autos que pagaron con descuento  }

pprogram P3;
  Function Abono(Monto, Tiempo:Real; DiasSem:Byte):char;
  Begin
    if Monto <= 20 then
      Abono:='T'
    Else
      If (Monto <= 50) then
       If tiempo > 2 then
          Abono:='D'
       Else
           Abono:='G'
       Else
         If Monto <= 100 then
          If tiempo > 3 then
           Abono:='D'
          Else
            Abono:='G'
        Else // Monto > 100
            Case DiasSem Of
            1..5: Abono:='G';
            6..7: Abono:='D';
            end;

   end;

 Var
  Monto, Tiempo : real;
  DiasSem : Byte;
  resabono : char;
  totalgratis, totaldesc : word;
begin
  totalgratis := 0; totaldesc := 0;
  write('Dia: '); readln(DiasSem);
  write('Horas: '); readln(Tiempo);
  While Tiempo <> 0 do
  begin
    write('Monto: '); readln(Monto);
    resabono := Abono(Monto, Tiempo, DiasSem);
    if resabono = 'G' then
      totalgratis := totalgratis + 1
    else
      if resabono = 'D' then
        totaldesc := totaldesc + 1;
    write('Horas: '); readln(Tiempo);
  end;
  writeln('La cantidad de autos que no pagaron es de ', totalgratis);
  writeln('La cantidad de autos que pagaron con descuento es de ', totaldesc);
  readln;
end.







