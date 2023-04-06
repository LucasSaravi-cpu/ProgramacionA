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
calcule e imprima el costo del trabajo y el nombre del productor con menor importe          }

program Guia4EjercicioAdicional1;
var
  nombre,minnombre:string[10];
  i,n,tipo:byte;
  hectarias,min,importe:real;
begin
min:=999999;
writeln('Ingrese la cantidad de productores');
readln(n);
for i:=1 to n do
 begin
 writeln('ingrese el nombre del productor');
 readln(nombre);
 writeln('ingrese el tipo');
 readln(tipo);
 writeln('ingrese las hectarias');
 readln(hectarias);


 if (tipo=1) or (tipo=2) then
    Importe:=20*Hectarias
 else
   if tipo=3 then
      Importe:=30*hectarias
   else
     Importe:=40*hectarias;

 if hectarias>100 then
    importe:=importe*0.95;

 if importe>1500 then
    importe:=((importe-1500)*0.90)+1500;


 if importe<min then
    begin
    min:=importe;
    minNombre:=nombre;
    end;

 end;

writeln('El nombre del productor con menos importe es , ',minnombre,'y el importe minimo es ',min:8:2);
readln;
end.
