program Guia10Ejercicio3cargadorNovedades;
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
novedades:tarch1;

procedure graba(var novedades:tarch1);
var
r:tr;
i:byte;
begin
rewrite(novedades);
for i:=1 to 5 do
    begin
    writeln('ingesar codigo plan dia mes anio');
    with r do
    readln(codigo,plan,dia,mes,anio);
    write(novedades,r);
    end;
r.codigo:='99999999';
r.plan:=0;
r.dia:=0;
r.mes:=0;
r.anio:=0;
write(novedades,r);
close(novedades);
end;

procedure lista(var novedades:tarch1);
var
r:tr;
begin
reset(novedades);
while not eof(novedades) do
     begin
     read(novedades,r);
     with r do
     writeln(codigo:6,plan:3,dia,'/',mes,'/',anio);
     end;
close(novedades);
end;

begin{programa principal}
assign(novedades,'novedades.dat');
graba(novedades);
lista(novedades);
readln;
end.
