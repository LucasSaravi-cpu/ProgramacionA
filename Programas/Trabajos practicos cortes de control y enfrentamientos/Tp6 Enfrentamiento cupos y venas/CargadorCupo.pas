program cargadorescupos;
type
   st5=string[5];
   tr=record
     codigo:st5;
     CupoExportacion:real;
     montoExpor:real;
   end;

   tarch1=file of tr;

var{programa principal}
cupos:tarch1;

procedure graba(var cupos:tarch1);
var
r:tr;
i:byte;
begin
rewrite(cupos);
 writeln('Introducir los cupos (codigo , cupoexportacion($),montoexportado). Luego ingrese el centinela "zzzzz"');
for i:=1 to 5 do
    begin

    with r do
    readln(codigo,cupoExportacion,montoExpor);
    write(cupos,r);
    end;
r.codigo:='zzzzz';
write(cupos,r);
close(cupos);
end;

procedure lista(var cupos:tarch1);
var
r:tr;
begin
reset(cupos);
while not eof(cupos) do
     begin
     read(cupos,r);
     with r do
     writeln(codigo:6,cupoexportacion:3:2,montoExpor:3:2);
     end;
close(cupos);
end;

begin{programa principal}
assign(cupos,'cupos.dat');
graba(cupos);
lista(cupos);
readln;
end.
