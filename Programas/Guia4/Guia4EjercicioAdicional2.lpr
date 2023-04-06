{) En un estudio de mercado desea saber cuál de dos productos : A y B , es más aceptado.
Para ello se encuestan N personas y por cada persona se obtienen dos valores
 * el primero para el producto A ( 0 - no acepta ; 1 - acepta )
 * el segundo para el producto B ( 0 - no acepta ; 1 - acepta )
Se pide leer los datos, calcular e imprimir :
 -Porcentaje de consumidores que aceptan el producto A.
 -Porcentaje de consumidores que aceptan el producto B.
 -Porcentaje de consumidores que aceptan el producto A y B.
 -Porcentaje de consumidores que no aceptan el producto A y sí el B.
 -Porcentaje de consumidores que aceptan el producto A y no el B.
 -Porcentaje de consumidores que no aceptan el producto A ni el B.}


program Guia4EjercicioAdicional2;
var
  aceptacionA,aceptacionB,contA,contB,contNB,contNA,n,i:byte;
begin
contA:=0;
contB:=0;
contNB:=0;
contNA:=0;
writeln('ingrese la cantidad de gente encuestada');
readln(n);
for i:=1 to n do
    begin
    writeln('Ingrese aceptacion del primer producto');
    readln(aceptacionA);
    writeln('Ingrese aceptacion del segundo producto');
    readln(aceptacionB);

    if aceptacionA=1 then
       contA:=contA+1;
    if aceptacionA=0 then
       ContNA:=contNA+1;   {No acepta al producto A}
    if aceptacionB=1 then
       contB:=contB+1;
    if aceptacionB=0 then
       ContNB:=ContNB+1;        {No acepta al producto B}
    end;
if contA<>0 then
  writeln('Porcentaje de consumidores que aceptan el producto A' , (n/contA)*100:8:2)
else
  writeln('No hay consumidores que aceptan el producto A');

if contB<>0 then
  writeln('Porcentaje de consumidores que aceptan el producto B' , (n/contB)*100:8:2)
else
  writeln('No hay consumidores que aceptan el producto B');

if (contA+ContB)<>0 then
   writeln('Porcentaje de consumidores que aceptan el producto A y B',(n/(contA+ContB))*100:8:2)
else
  writeln('No hay consumidores que acepten el producto A y B ');

if (contNA+CONTB)<>0 then
   writeln('Porcentaje de consumidores que no aceptan el producto A y sí el B',(n/(contNA+contB)) *100:8:2)
else
   writeln('No hay consumidores que aceptan el producto A y si el B');

if (contA+ContNB)<>0 then
   writeln('Porcentaje de consumidores que aceptan el producto A y no el B',(n/(contA+ContNB)) *100 :8:2)
else
   writeln('No hay consumidores que acepten el producto A y no el B');

if (contNB+ContNA)<>0 then
   writeln('Porcentaje de consumidores que no aceptan el producto A ni el B',(n/(contNB+contNA))*100:8:2)
else
   writeln('No hay porcentaje de consumidores que no acepten el producto A ni el B');
readln;
end.

