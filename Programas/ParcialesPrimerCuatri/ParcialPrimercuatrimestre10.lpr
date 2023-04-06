{La administración de un consorcio ha registrado montos mensuales de expensas adeudadas de N propietarios, dicha
información se agrupa de la siguiente forma:
• Nombre del Propietario y a continuación los
o montos que adeuda (0 es Fin de Datos)
Se cobra, además de la deuda original, recargos punitorios que podrá pagar hasta en 5 cuotas, con el siguiente criterio:
si debe hasta $ 500 inclusive debe pagar en 1 cuota; si la deuda es mayor a $ 500 hasta $ 3000 inclusive, en 3 cuotas;
para deuda mayor a $ 3000, en 5 cuotas.
El recargo que se aplica sobre la deuda es del 10% y si registra 4 ó más montos mensuales de expensas atrasadas, se
suma una multa de $100 fija.
Se pide desarrollar un programa Pascal, eficaz, eficiente, claro, correctamente indentado y modularizado, para:
a) Informar para cada propietario cuál es la deuda original, el recargo por mora y la cantidad de cuotas otorgadas.
b) Monto promedio de deuda total, de quienes adeudan más de X montos mensuales de expensas, (X es dato).
c) Nombre del propietario que más adeuda.
Se debe desarrollar el subprograma Recargo correctamente parametrizado, que devuelva el recargo por mora que debe
abonar por la deuda original y la cantidad de cuotas para cancelarla. }


program ParcialPrimercuatrimestre10;

procedure Recargo(deuda:real;Meses:byte;var cuotas:byte ;var RecargoporMora:Real);
begin
if deuda<=500 then
   cuotas:=1
else
   if deuda<=3000 then
     cuotas:=3
   else
      cuotas:=5;

recargoporMora:=deuda*0.1;

if meses>=4 then
  recargoporMora:=recargoPorMora+100;

end;

var
arch:text;
i,n,x,cuotas,MesesAdeudados,AdeudaronMasdex:byte;
nombre,maxdeudor:string[4];
monto,DeudaOriginal,RecargoPorMora,total,max:real;


begin
assign(arch,'ParcialPrimercuatrimestre10.txt');
reset(arch);
total:=0;
max:=0;
cuotas:=0;
recargoporMora:=0;

AdeudaronMasdex:=0;
while not eof(Arch) do
   begin
   readln(arch,n,x);
   for i:=1 to n do
      begin
      readln(arch,nombre);
      DeudaOriginal:=0;
      MesesAdeudados:=0;
      read(arch,monto);
      while monto<>0 do
          begin
          DeudaOriginal:=DeudaOriginal+monto;
          MesesAdeudados:=MesesAdeudados+1;
          read(Arch,monto);
          end;
          readln(Arch);
      Recargo(DeudaOriginal,MesesAdeudados,cuotas,recargoPorMora);
      writeln('Meses Adeudados ',MesesAdeudados:3,' Deuda  ',DeudaOriginal:8:1,' Recargo por mora',RecargoPorMora:8:1,' Cuotas Otorgadas',cuotas:3);

      if MesesAdeudados>x then
        begin
         Total:=total+(DeudaOriginal+RecargoporMora);
         AdeudaronMasDeX:=AdeudaronMasDeX+1;
        end;

      if DeudaOriginal>max then
         begin
         max:=DeudaOriginal;
         maxDeudor:=Nombre;
         end;
      end;
   end;
if AdeudaronMasDeX<>0 then
   writeln('Monto promedio de deuda total, de quienes adeudan mas de X montos mensuales de expensas:', Total/AdeudaronMasDeX:8:1)
else
   writeln('No hay montos promedios de deuda total');

writeln('El Nombre del propietario que mas adeuda es  ',MaxDeudor,' su deuda es de',max:8:2);

close(Arch);
readln;
end.
