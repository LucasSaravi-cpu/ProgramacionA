program cargadorYlistadorTransporte;

type
  st4=string[4];
  st5=string[5];
  TRegTransporte = record
    MedioTransporte : st4;
    CiudadDestino : st5;
    HoraSalida,Capacidad:byte;
  end;

  TArchTransporte = file of TRegTransporte;

Procedure Graba(var transporte:TArchTransporte);
var
  t:TRegTransporte;
  arch:text;
  esp:char;
begin
assign(arch,'transporte.txt');
reset(arch);
rewrite(transporte);
while not eof(arch) do
  begin
  readln(arch,t.MedioTransporte,t.CiudadDestino,t.HoraSalida,t.Capacidad);
  write(transporte,t);
  end;
close(arch);
close(transporte);
end;

Procedure Lista(var transporte:TArchTransporte);
var
  t:TRegtransporte;
begin
reset(transporte);
while not eof(transporte) do
  begin
  read(transporte, t);
  writeln(t.MedioTransporte,'  ',t.CiudadDestino,'  ',t.HoraSalida,'  ',t.Capacidad);
  end;
close(transporte);
end;

var
  transporte:TArchTransporte;
begin
assign(transporte,'transporte.dat');
graba(transporte);
lista(transporte);
readln;
end.

