{La Secretaría de Transporte de la ciudad de MdP mantiene un archivo con los datos de diferentes medio de 
transportes diarios, con origen en la ciudad hacia otras ciudades de la Pcia de BsAs, con el siguiente diseño en cada 
registro:
ARCHIVO TRANSPORTE 
o Ciudad Destino (1er campo de secuencia clave secundaria) 
o Medio Transporte (1..20, 2do campo de secuencia clave secundaria) 
o Hora Salida (0..23) 
o Capacidad (cantidad de asientos) 
Además se tiene el archivo Medios que contiene los nombres de las empresas de transporte y se accede en forma 
directa por el MedioTransporte. Se pide: 
a) Definir los tipos de los archivos anteriores. 
b) Desarrollar un procedimiento que obtenga el siguiente listado por ciudad y medio de transporte: 
Listado de Transportes Disponibles 
 Ciudad XXXXXXXX 
 Medio Transporte Frecuencia Diaria Capacidad promedio 
 xxxxxxx 99 99 
 xxxxxxx 99 99 
 Ciudad XXXXXXXX 
 Medio Transporte Frecuencia Diaria Capacidad promedio 
 xxxxxxx 99 99 
 xxxxxxx 99 99 
 ........... 
Ciudad Destino con mayor cantidad de Medios de Transporte diferentes: XXXXXXX }

program CorteDeControlTransporte;
type
st3=string[3];
st6=string[6];
tr=record
   ciudad:st3;
   Mediodetransporte:byte;
   frecuencia:byte;
   capacidad:byte;
   end;

TarTransporte=file of tr; {los componentes son registros}
TarMedios=file of st6; { no son registros}

var{programa princiapl}
transporte:TarTransporte;
medios:TarMedios;

procedure listado(var transporte:TarTransporte;var medios:Tarmedios);
var
r:tr;
maxciudad,ciudadAct:st3;
nom:st6;
transporteact,max,cont1,cont:byte;
promcap:real;
sumcapacidad,sumfrecuencia:word;

begin
reset(transporte);
read(transporte,r);
reset(medios);

max:=0;
while not eof(transporte) do
   begin
   writeln('ciudad   ',r.ciudad);
   writeln('medio de transporte');
   cont:=0;
   CiudadAct:=r.ciudad;         {comienza el bloque ciudades}
  while ciudadAct=r.ciudad do
       begin
        TransporteAct:=r.mediodetransporte;      {comienza el bloque transporte}
        sumfrecuencia:=0;
        sumcapacidad:=0;
        cont1:=0;
        cont:=cont+1; {contador de medio de transporte diferentes}
        while (ciudadAct=r.ciudad) and (transporteAct=r.Mediodetransporte) do  {procesa bloque ciudad}
             begin
             cont1:=cont1+1;    {cantidad de medios de transporte iguales}
             sumfrecuencia:=sumfrecuencia+r.frecuencia;
             sumcapacidad:=sumcapacidad+r.capacidad;
             end;
             seek(medios,transporteact);
             read(medios,nom);
             promcap:=sumcapacidad/cont1;  {promedio de capacidad por la cantidad de medios de transporte iguales}
             writeln(nom:8,sumfrecuencia:3,promcap:3:2);

            if max<cont then
               begin
               max:=cont;
               maxciudad:=CiudadAct;
               end;
        end;
  writeln('Ciudad con mayor cantidad de medio de transporte diferente',maxciudad); {finaliza bloque de ciudad}
  end;
close(transporte);
close(medios);
end;


begin{programa principal}
assign(transporte,'transporte.dat');
assign(medios,'medios.dat');
listado(transporte,medios);
readln;
end.

{program TPTransporte;

const
  Max=100;

type
  st4=string[4];
  st5=string[5];
  st8=string[8];
  TRegTransporte = record
    MedioTransporte : st4;
    CiudadDestino : st5;
    HoraSalida:byte;
    Capacidad:byte;
  end;

  TRegMedios = record
   MedioTransporte:st4;
   NombreReal:st8;
  end;

  TvMedios = array [1..Max] of TRegMedios;
  TArchTransporte = file of TRegTransporte;
  TArchMedios = file of TvMedios;

Procedure LeerArchivo(var medios:TvMedios; var n:byte);
var
  arch:text;
  esp:char;
begin
assign(arch,'medios.txt');
reset(arch);
n:=0;
while not eof(arch) do
  begin
  n:=n+1;
  readln(arch,medios[n].MedioTransporte,esp,medios[n].NombreReal);
  end;
close(arch);
end;

Function Busca(medios:TvMedios; MedioTransporte:st4):byte;
var
  i:byte;
begin
i:=1;
while  ((MedioTransporte) <> medios[i].MedioTransporte) do
  i:=i+1;

if (MedioTransporte = medios[i].MedioTransporte) then
  Busca:=i
else
  Busca:=0;
end;

Procedure Lista(var transporte:TArchTransporte; var medios:TvMedios);
var
  t:TRegTransporte;
  m:TRegMedios;
  MedioTransporteAct,MaxMedioTransporte,MedioTransporte:st4;
  CiudadDestinoAct:st5;
  ContFrecuencia,AcumCapacidad,Max,ContCiudades:word;
  n,Busqueda:byte;
begin
Max:=0;
reset(transporte);
read(transporte,t);
writeln('Listado de Transporte Disponibles');
while not eof(transporte) do
  begin
  ContCiudades:=0;
  MedioTransporteAct:=t.MedioTransporte;

  Busqueda:=Busca(medios,MedioTransporteAct);


  writeln('Medio de Transporte ',Medios[Busqueda].NombreReal);
  writeln('Ciudad       Frecuencia Diaria    Capacidad Total');
  while MedioTransporteAct = t.MedioTransporte do
    begin
    ContCiudades:=ContCiudades+1;
    ContFrecuencia:=0;
    AcumCapacidad:=0;
    CiudadDestinoAct:=t.CiudadDestino;
    while (MedioTransporteAct = t.MedioTransporte) and (CiudadDestinoAct = t.CiudadDestino) do
      begin
      ContFrecuencia:=ContFrecuencia+1;
      AcumCapacidad:=AcumCapacidad+t.Capacidad;
      read(transporte,t);
      end;
    writeln(CiudadDestinoAct,ContFrecuencia:9,AcumCapacidad:23);
    end;
    if Max < ContCiudades then
    begin
      Max:=ContCiudades;
      MaxMedioTransporte:=MedioTransporteAct;
    end
  end;
writeln('Medio de transporte con mayor cantidad de Ciudades Destino: ',MaxMedioTransporte,' con ',Max,' destinos');
close(transporte);
end;
var
  transporte:TArchTransporte;
  medios:TvMedios;
  medio:TArchMedios;
  n:byte;
  MedioTransporte:st4;
begin
LeerArchivo(medios,n);
assign(transporte,'transporte.dat');
assign(medio,'medios.dat');
Lista(transporte,medios);


readln;
end.}
