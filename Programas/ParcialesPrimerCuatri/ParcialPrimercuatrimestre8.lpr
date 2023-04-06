Una inmobiliaria dispone de numerosas propiedades para alquiler a turistas y desea conocer, a fin de
mes, información de cada una de ellas con el objeto de tomar decisiones acerca de cuáles propiedades
conviene promover, cuáles dejar de ofrecer, cuáles aumentarlas de precio, etc.
{Para ello, se cuenta con información en un archivo de texto dónde, en cada línea, se guarda:
• Código de la propiedad (8 caracteres)
• Ingresos totales del mes
• Cantidad de veces que se alquiló la propiedad en el mes
• Duración (en días) de cada uno de los alquileres
Se ha solicitado clasificar las propiedades en 4 categorías, dadas en orden de prioridad (si la propiedad
cumpliese más de una condición, por ejemplo, PREMIUM y POPULAR, debe considerarse como
PREMIUM):
Categoría Característica Criterio
1 PREMIUM: Alto
valor de alquiler por
día
Promedio diario del alquiler superior a $4.000
2 POPULAR: Muy
demandadas,
estadías cortas
Alquiladas al menos 5 veces, por al menos 22 días en
total
3 RELEGADA: Poco
elegida
Alquilados menos de 3 veces o con ingresos menores
a $10.000
4 REGULAR: Otras Cualquiera que no entre dentro de las clasificaciones
anteriores
Se pide desarrollar un programa Pascal, eficaz, eficiente, robusto y claro que procese la información
del archivo calculando e informando:
a) Categoría de cada propiedad.
b) % de propiedades con categoría 1 (POPULAR).
c) Propiedad que más ingresos totales generó, categoría a la que pertenece y porcentaje que
representa ese valor respecto del total recaudado
Desarrollar y utilizar una función Categoria, que, a partir de la cantidad de veces que fue alquilada la
propiedad en el mes, los días totales de ocupación y el valor recaudado, devuelva la prioridad (1, 2, 3,
4).


            }


program ParcialPrimercuatrimestre8;


function prioridad(ingresoTotal:real;Sumdias,sealquilo:byte):byte;

var
  promedio:Real;
begin
if Sumdias<>0 then
   promedio:=ingresototal/sumdias;

if  promedio>4000  then
    prioridad:=1
else
   if (sealquilo>=5) and  (Sumdias>= 22) then
      prioridad:=2
   else
      if (sealquilo<=3) or (ingresoTotal<=10000) then
          prioridad:=3
      else
          prioridad:=4;
end;


var {programa principal}
  arch:text;
  codigo,maxcodigo:string[8];
  max,ingresoTotal,sum:Real;
  SumDias,SeAlquilo,dias,priori,popular,total,maxcategoria,i:byte;

begin {programa principal}

assign(arch,'ParcialPrimercuatrimestre8.txt');
reset(Arch);
popular:=0;
total:=0;
max:=0;
sum:=0;
while not eof(arch) do
begin
read(arch,codigo,ingresoTotal,sealquilo);
Total:=total+1;
sumdias:=0;
for  i:=1 to sealquilo do
begin
read(arch,dias);

Sumdias:=Sumdias+dias;
end;
readln(arch);
sum:=sum+ingresototal;
priori:=prioridad(ingresoTotal,Sumdias,sealquilo) ;

writeln('La prioridad para ', codigo ,' es  ' ,priori);

if priori=2 then
   popular:=popular+1;

if ingresoTotal>max then
   begin
   max:=ingresoTotal;
   maxCodigo:=codigo;
   maxcategoria:=priori;
   end;

end;

writeln('% de propiedades con categoria 2 (popular) ' ,(popular/total)*100:8:2,'%');
writeln('propiedad con mas ingresos totales  ',maxcodigo,' categoria a la que pertenece ',Maxcategoria,' y porcentaje que representa ese valor respecto del total recaudado'  ,(max/sum)*100:8:2 ,'%');


close(Arch);
readln;
end.

