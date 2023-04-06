 {Una compañía aérea, cobra el equipaje de bodega según el peso y el tamaño del mismo
Para un conjunto de vuelos, registró en un archivo de texto:
 Código de vuelo (3 caracteres)
 Cantidad de maletas
Y a continuación por cada una:
 OnLine (S/N)
 Tamaño (1-chica; 2-mediana; 3-grande)
 Peso (en kilos, real)
El costo a pagar se determina:
 Tamaño 1 $20 si pesa más de 5 kg incrementa $2 por cada kilo extra o fracción
 Tamaño 2 $50 si pesa más de 10kg incrementa $5 por cada kilo extra o fracción
 Tamaño 3 $100 si pesa más de 25kg incrementa $10 por cada kilo extra o fracción
Además si lo registro y pago online tiene un descuento del 10%.
Se pide leer la información descripta, calcular e informar:
a) El costo de cada equipaje
b) Para cada vuelo el total de bultos en cada tamaño
c) Código de vuelo con mayor importe cobrado
Desarrollar e utilizar una función COSTO() que a partir del tamaño, peso y operación (online)determine el
correspondiente importe.
}


program ParcialPrimercuatrimestre3;
function costo(tam:byte;peso:real;operaciones:char):real;
var
importe:real;
begin
if (tam=1) and (peso<=5) then
   importe:=20;
if (tam=1) and (peso>5) then
   importe:=20+(2*(peso-5));
if (tam=2) and (peso<=10) then
   importe:=50;
if (tam=2) and (peso>10) then
   importe:=50+(5*(peso-10));
if (tam=3) and (peso<25) then
   importe:=100;
if (tam=3) and (peso>=20) then
   importe:=100+(10*(peso-25));

 if operaciones='S' then
    importe:=importe*0.9;

costo:=importe;


end;

var
arch:text;
cont,cont2,cont3,maletas,i,tam,peso:byte;
max,con,sum:real;
codigo,maxcodigo:string[3];
operaciones:char;

begin
assign(arch,'ParcialPrimercuatrimestre3.txt');

reset(Arch);
max:=0;

while not eof(Arch) do
     begin
     sum:=0;
     cont:=0;
     cont2:=0;
     cont3:=0;
     readln(arch,codigo,maletas);
     for i:=1 to maletas do
         begin
         readln(arch,operaciones,tam,peso);

         if tam=1 then
            cont:=cont+1
         else
            if tam=2 then
               cont2:=cont2+1
            else
              if tam=3 then
                 cont3:=cont3+1;


      con:=costo(tam,peso,operaciones);
      writeln(operaciones,'  el costo de cada equipaje es  ',con:2:3);
      sum:=sum+con;
      end;

 writeln('Para el codigo ',codigo,' los tam son');
 writeln('el tam 1 es  ',cont);
 writeln('el tam 2 es  ',cont2);
 writeln('el tam 3 es  ',cont3);


if sum>max then
   begin
   max:=sum;
   maxcodigo:=codigo;
   end;
end;
writeln('el codigo de vuelo con mayor importe cobrado es  ',maxcodigo,' el importe es ',max:2:3);
readln;
end.





