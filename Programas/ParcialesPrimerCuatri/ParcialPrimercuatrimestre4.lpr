{Una cadena de hoteles , esta presente en N destinos .En cada uno de ellos tiene reservas efectuadas por cantidad variables de pasajeros y dias
La informacion se agrupa de la siguiente forma
Codigo destino (cadena de 4 caracteres ) y a continuacion por cada reserva a dicho destino
cantidad de pasajeros ( 0 indica fin de reservas para ese destino)
cantidad de dias
El precio por dia y pasajero es fijo en todos los hoteles $100 .Se bonifica 1 pasajero si son mas de 5 y para estadias de mas de 7 dias hay un descuento de 10%
Se pide ingresar la informacion descripta anteriormente para calcular e informar
a) presio a pagar por  cada reserva
b) cod de destino con mas pasajeros

Desarrollar y utilizar la funcion importe que a partir de los datos de na reserva ( cant de pasajeros y de dias ) devuelva el importe a abonar.}


program ParcialPrimercuatrimestre4;

var  { principal}
  imp:real;
  sumP,i,n,maxP,cantp,dias:word;
  lugar,maxlugar:string[4];

function importe(pasajeros,dias:byte):real;
begin
if  pasajeros>5 then
   pasajeros:=pasajeros-1;
   importe:=(100*dias)*pasajeros;



if dias>7 then
  importe:=(100*dias)*pasajeros*0.9
else
     importe:=(100*dias)*pasajeros;


end;

begin
maxp:=0;
writeln('Ingrese la cantidad de destinos');
readln(n);
for i:=1 to n do
begin
sump:=0;
writeln('Ingrese lugar de destino');
readln(lugar);
writeln('Ingrese la cantidad de pasajeros');
readln(cantp);
while cantp<>0 do { Mientras la cantidad de pasajeros no sea 0 }
begin
sump:=sump+cantP;
writeln('ingrese cantidad de dias');
readln(dias);
imp:=importe(cantp,dias);
writeln('El importe es ',imp:8:2);
writeln('Ingrese cantidad de pasajeros');
readln(cantp);
end;

if sump>maxp then
   begin
   maxp:=sump;
   maxlugar:=lugar;
   end;
end;
writeln('El lugar con mas pasajeros es',maxlugar);
readln;
end.
end;

end.
