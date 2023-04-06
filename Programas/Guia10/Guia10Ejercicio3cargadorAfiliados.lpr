program Guia10Ejercicio3cargadorAfiliados;
type
   st5=string[8];
   tr=record
     codigo:st5;
     plan:byte;
     dia,mes:byte;
     anio:word;
   end;

   tarch1=file of tr;

var{programa principal}
afiliados:tarch1;

procedure graba(var afiliados:tarch1);
var
r:tr;
i:byte;
begin
rewrite(afiliados);
for i:=1 to 5 do
    begin
    writeln('ingesar codigo plan dia mes anio');
    with r do
    readln(codigo,plan,dia,mes,anio);
    write(afiliados,r);
    end;
r.codigo:='99999999';
r.plan:=0;
r.dia:=0;
r.mes:=0;
r.anio:=0;
write(afiliados,r);
close(afiliados);
end;

procedure lista(var afiliados:tarch1);
var
r:tr;
begin
reset(afiliados);
while not eof(afiliados) do
     begin
     read(afiliados,r);
     with r do
     writeln(codigo:6,plan:3,dia,'/',mes,'/',anio);
     end;
close(afiliados);
end;

begin{programa principal}
assign(afiliados,'afiliados.dat');
graba(afiliados);
lista(afiliados);
readln;
end.

