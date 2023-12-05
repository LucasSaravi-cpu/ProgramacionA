La Secretaría de Transporte de la ciudad de MdP mantiene un archivo con los datos de diferentes medio de 
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

program CorteDeControl;
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



