{Un Hospital desea controlar la ocupación de sus habitaciones en internación y los importes a cobrar a los
pacientes internados. El Hospital está organizado por Sectores (“ADULTOS”, “PEDIATRIA”, “CARDIOLOGIA”,
etc.). Cada Sector dispone de un conjunto de Camas.
La información se almacena en un archivo de texto con la siguiente estructura:
• Nombre del Sector
Y a continuación, se guarda información de cada una de las Camas que tiene el Sector:
• Código de la Cama (ej. HAB101_CAMA01, HAB101_CAMA02…)
o “ES_FINALIZADO” indica que no hay más camas en el sector
• Si es una Cama de categoría superior (S/N)
• Cantidad de días que hace que la cama está ocupada por el paciente en ella internado (si la cama
no está siendo ocupada por ningún paciente, este campo tiene CERO)
El costo de la Cama se determina de acuerdo al siguiente criterio:
• Hasta el 3er. día inclusive -> $1000 por cada día
• Del 4to. Al 6to. día inclusive -> $800 por cada día
• A partir del 7mo. día -> $500 por cada día
• Si la cama es de categoría superior, se incrementa un 20% el valor total de la estadía
Se desea obtener:
a) El valor de la internación de cada paciente internado
b) Para cada Sector, porcentaje de camas ocupadas
c) Cama que hace más tiempo que está ocupada y valor a pagar por el paciente en ella internado
d) Sector con mayor cantidad de camas que no son de categoría Superior }


program ParcialPrimercuatrimestre9 ;


function costo(cama:char;dias:byte):Real;
var
precio:real;
begin

if dias>0 then
   begin
   if dias<=3 then
      precio:=dias*1000
   else
      if (dias<=6) then
         precio:=3000+((dias-3)*800)
      else
          precio:=3000+2400+((dias-6)*500)
   end
else
  precio:=0;

if cama='S' then
   precio:=precio*1.2;

costo:=precio;

end;

var {programa principal}
  arch:text;
  nombre,maxcamasector:string[11];
  codigo, camaMaxTiempoocupada:string[13];
  cama:char;
  dias,contcamas,totalcamas,tiempoOcupada,maxCantidaDeCamas,maxTiempoOcupada:byte;
  valorinternacion,ValorMaxtiempoOcupada:Real;
begin {programa principal}

assign(arch,'ParcialPrimercuatrimestre9.txt');
reset(Arch);

maxCantidaDeCamas:=0;
maxTiempoOcupada:=0;
while not eof(arch) do
begin
contcamas:=0;
tiempoOcupada:=0;
TotalCamas:=0;
ValorInternacion:=0;
readln(arch,nombre);
read(arch,codigo);
while codigo<>'ES_FINALIZADO' do
    begin
    readln(arch,cama,cama,dias);
    TotalCamas:=TotalCamas+1;
    valorInternacion:=costo(cama,dias);

    writeln('Para el paciente',codigo, 'El valor de la internacion es',ValorInternacion:8:2);
    if dias<>0 then
       ContCamas:=ContCamas+1;


    if cama='N' then
      TiempoOcupada:=TiempoOcupada+1;

    if dias>MaxTiempoOcupada then
       begin
       maxTiempoOcupada:=dias;
       ValorMaxTiempoOcupada:=ValorInternacion;
       camaMaxTiempoocupada:=codigo;
       end;
    read(arch,codigo);
    end;
readln(arch);
if totalcamas<>0 then
   writeln('El porcentaje de camas para ',nombre,' es',contcamas/totalCamas*100:8:2)
else
   writeln('No hay porcentaje de camas en este sector');

if tiempoOcupada>maxCantidaDeCamas then
   begin
   maxCantidaDeCamas:=tiempoOcupada;
   maxCamaSector:=nombre;
   end;

end;
writeln('Sector con mayor cantidad de camas',MaxCamaSector,'con',maxCantidaDeCamas);
writeln( 'Cama que hace más tiempo que está ocupada', camaMaxTiempoocupada,'y valor a pagar',ValorMaxTiempoOcupada:8:2);
close(arch);
readln;
end.

