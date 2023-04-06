{Para cada uno de N vendedores ,se conoce el nombre , la cantidad de ventas y los respectivos importes

Ademas se sabe el monto de venta fijado como objetivo para que un vendedor obtenga una recompenza (la suma de todas sus ventas alcanza o supera dicho
monto)

El orden de los datos es N , Monto objetvo y luego por cada vendedor su nombre cantidad de ventas y los importes

Se pide leer los datos descriptos para calcular e informar

a)Nombre e monto total vendido del "mejor vendedor" (mayor acumulacion de importes)
b)Los nombres de los vendedores que merecen una recompensa
c)nombre del vendedor que registro la venta promedio minima

}

program Guia4Ejercicio12;
var
  n,i,v,j:byte;
  nombre,maxnombre,minnombre:string[10];
  max,monto,promedio,min,objetivo,sum:real;

begin
max:=0;         {son positivos por que no hay valores negativos de montos}
min:=9999; {valor imposible}
writeln('Escriba el monto objetivo');        // constante (?
readln(objetivo);
writeln('Escriba la cantidad de vendedores ');
readln(n);
for i:=1 to n do
  begin
  sum:=0;
  writeln('Escriba el nombre del vendedor');
  readln(nombre);
  writeln('Escriba la cantidad de ventas');
  readln(v);
  for j:=1 to v do
     begin
     writeln('Escriba los montos');
     readln(monto);
     sum:=sum+monto;
     end;
  promedio:=sum/v;
  if promedio<min then
     begin
     min:=promedio;
     minnombre:=nombre;
     end;
  if sum>objetivo then
     writeln('el vendedor ',nombre,' merece una recompenza');
  if sum>max then
     begin
     max:=sum;
     maxnombre:=nombre;
     end;

  end;
writeln('El nombre con mayor acumulacion de montos es : ' ,maxnombre,'y tiene un monto acumulado de ', max:8:2);
writeln('El nombre del vendedor que realizo el promedio minimo de ventas es, ',minnombre,'y realizo un promedio de ',min:8:2);
readln;
end.

