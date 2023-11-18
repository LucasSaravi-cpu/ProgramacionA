program TPTransporte;

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
//writeln('Ingrese codigo = x');
//readln(MedioTransporte);
//writeln(Busca(medios,n,MedioTransporte));

readln;
end.
