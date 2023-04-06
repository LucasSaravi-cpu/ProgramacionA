{Una empresa fumigadora, cobra a los productores distintos aranceles según el tipo de fumigación
y la cantidad de hectareas.
 Tipo 1 y 2 : 20 $/ha.
 Tipo 3 : 30 $/ha.
 Tipo 4 : 40 $/ha.
 Además :
 Si el área a fumigar es mayor que 100 has. se aplica un 5% de descuento.
 Si el importe total supera los $1.500 se aplica un 10% de descuento, sobre la cantidad
 que excede los $1.500.
Desarrollar un programa que ingrese por cada productor:
• NOMBRE
• TIPO (1-4)
• CANTIDAD (has.)
calcule e imprima el costo del trabajo y el nombre del productor con menor importe. }


program Ejercicio2;

Function Monto(tipo,has:Byte):real;
var
des:real;

begin

if (tipo=1) or (tipo=2) then
   monto:=20*has
else
   if tipo=3 then
      monto:=30*has
   else
      monto:=40*has;

if has>100 then
   monto:=monto*0.95;
if monto>1500 then
   begin
   des:=(monto-1500)*0.9;
   monto:=monto+des;
   end;



end;

var{programa principal}
has,tipo,n,i:byte;
nombre,minnombre:string[4];
M,min:real;
begin {programa principal}
min:=99999;
writeln('la cantidad de productos');
readln(n);
for i:=1 to n do
    begin
    writeln(' ingrese el nombre del producto');
    readln(nombre);
    writeln('ingrese el tipo del producto');
    readln(tipo);
    writeln('ingrese las has ');
    readln(has);
    m:=monto(has,tipo);
    if M<min then
       begin
       min:=M;
       minnombre:=nombre;
       end;
    end;
writeln('el costo del trabajo y el nombre del productor con menor importe es  ',minnombre ,'  y el costo minimo es ' , min:8:2);
readln;
end.

