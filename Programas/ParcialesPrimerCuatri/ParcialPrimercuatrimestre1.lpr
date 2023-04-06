{una biblioteca ,registra los prestamos realizados en el mes , dicha informacion esta grabada en un archivo de texto
y agrupada por codigo de libro .En cada linea del archivo se tiene

codigo(4 caracteres)
cantidad de prestamos efectuados
y a continuacion la cantidad de dias de cada prestamo

Se a decidido reponer los ejemplares mas solicitados considerando  2 niveles de prioridad
prioridad 1 mas de 5 prestamos y mas de 10 dias prestados en total
prioridad 2 mas de 5 prestamos p mas de 10 dias prestados en total

Se pide desarrollar un prgrama que procese la informacion del archivo calculando e informando para cada libro

a)si es o no prioritaria su compra y en caso afirmativo , cual es el nivel de prioridad
b)% de libros que no tienen prioridad de compra , sobre el total de libros prestados
c)Cual fue el libro que registro mas prestamos ( no importan los dias )

Utilizar una funcion prioridad que apartir de la cantidad de pretamos y la cantidad de total de dias , devuelva
la prioridad( 1 o 2) y 3 si no es prioritaria su compra}



program ParcialPrimercuatrimestre1;
function prioridad(dias,prestamo:byte):byte;
begin
if (prestamo>5) and (dias>10) then
   prioridad:=1
else
   if (prestamo>5) or (dias>10) then
      prioridad:=2
   else
      prioridad:=3;
end;

var
max,cont,contl,dia,presta,priori,i,acum:byte;
codigo,maxcodigo:string[4];
porce:real;
arch:text;
begin
assign(arch,'ParcialPrimercuatrimestre1.txt');
reset(arch);
cont:=0;
max:=0;
contl:=0;

while not eof(arch) do
     begin
     acum:=0;
     contl:=contl+1;
     read(arch,codigo,presta);

     for i:=1 to presta do
         begin
         read(arch,dia);
         acum:=acum+dia;
         end;
     readln(arch);
     priori:=prioridad(acum,presta);

     if priori=3 then
        begin
        cont:=cont+1;
        writeln(codigo,'sin prioridad,prioridad ',priori);
        end
     else
        writeln(codigo,'prioridad ',priori);

if presta>max then
   begin
   max:=presta;
   maxcodigo:=codigo;
   end;
end;
porce:=cont/contl*100;
writeln('el porcentaje de libros que no tienen prioridad es',porce:8:2);
writeln('el libro que registro mas prestamos es' , maxcodigo);
readln;
end.




