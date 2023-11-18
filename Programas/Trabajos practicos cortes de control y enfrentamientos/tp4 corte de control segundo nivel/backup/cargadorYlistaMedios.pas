program cargadorYlistaMedios;


type
  st4=string[4];
  st8=string[8];
  TRegMedios=record
    MedioTransporte:st4;
    NombreReal:st8;
  end;

  TArchMedios = file of TRegMedios;

Procedure Graba(var medio:TArchMedios);
var
  arch:text;
  esp:char;
  m:TREGMedios;
begin
assign(arch,'medios.txt');
reset(arch);
rewrite(medio);
while not eof(arch) do
  begin
    readln(arch,m.MedioTransporte,esp,m.NombreReal);
    write(medio,m);
  end;
close(arch);
close(medio);
end;

Procedure Lista(var medio:TArchMedios);
var
  m:TRegMedios;
begin
reset(medio);
while not eof(medio) do
  begin
    read(medio,m);
    writeln(m.MedioTransporte,'  ',m.NombreReal);
  end;
close(medio);
end;

var
  medio:TArchMedios;
  medios:tvmedios;
  n:byte;

begin
assign(medio,'medios.dat');
LeerArchivo(medios,n);
EscribeArchivo(medios,n);
graba(medio);
lista(medio);
readln;
end.

