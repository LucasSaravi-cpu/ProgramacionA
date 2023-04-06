{La fabrica de cerveza añares vende sus productos en distintas cervecerias de la ciudad . Si bien las cervecerias hacen sus pedidos por internet , la cobranza a cada
serveceria la realizan los repartidores en el momento en que entregan la mercaderia

añares directamente registra la cobranza que N repartidores realizan a una cantidad de servecerias no determinada . Para cada repartidor ( cadena de 4) se registra que cervecerias
visito y cuanto cobro a cada una .Las cervecerias se identiican con un codigo de 4 letras ( con **** se ndica que ya no hay mas cervecerias para dicho repartdor}


program ejercicio13;


function efectividad(promedio:real;visitas:byte):byte;
begin

 if promedio>=1000 then
    efectividad:=1
 else
    if (visitas>=3) and (promedio>500) then
       efectividad:=2
    else
       efectividad:=3;

end;

var
espacio:char;
menorCobro,cerveceria:string[4] ;
promedio:Real;
visitas:byte;
nombre,maxrepartidor:string[4];
repartidores,i,e,totalvisitas:byte;
cobro,total,min,max,totalcobrado:real;
arch:text;
begin

assign(arch,'texto.txt');
reset(arch);
readln(arch,repartidores);
min:=99999;
max:=0;
totalvisitas:=0;
totalcobrado:=0;
while not eof(arch) do

begin
for i:=1 to repartidores do
  begin
  visitas:=0;
  cobro:=0;
  total:=0;

  read(arch,nombre)  ;
  read(arch,cerveceria,espacio);
  while cerveceria<>'****' do
     begin
     read(arch,cobro,espacio);
     visitas:=visitas+1;
     totalcobrado:=totalcobrado+cobro;
     if cobro<min then
        begin
        min:=cobro;
        menorCobro:=cerveceria;
        end;


     Total:=total+cobro;
     read(arch,cerveceria,espacio);

     end;
    readln(arch);
    promedio:=total/visitas;
    e:=efectividad(promedio,visitas);
    totalvisitas:=totalvisitas+ visitas;
    writeln('el repartidor  ' , nombre , ' visito ' , visitas , ' veces' , ' cobro un total de ' , total:8:2 ,  ' y su efectividad es de ', e);

   if visitas>max then
      begin
      max:=visitas;
      maxrepartidor:=nombre;
      end;

  end;

writeln( ' la cerveceria con menor cobro fue ' , menorcobro);
writeln('El repartidor con mas vicitas es ' , maxrepartidor);
writeln('El total cobrado es ', totalcobrado:8:2 , ' y el promedio cobrado es de ', totalcobrado/totalvisitas:8:2);
end;
close(arch);
readln;
end.

