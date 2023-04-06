program Guia10Ejercicio2cargadorPagos;
Type
    st5=string[5];
    tr=record
       codigo:st5;
    end;
   tarch1=file of tr;

var{programa principal}
pagos:tarch1;

procedure graba(var pagos:tarch1);
var
r:tr;
i:byte;
begin
rewrite(pagos);
for i:=1 to 4 do
    begin
    writeln('Ingese el codigo');
    with r do
    readln(codigo);
    write(pagos,r);
    end;
r.codigo:='zzzzz';
write(pagos,r);
close(pagos);
end;

procedure lista(var pagos:tarch1);
var
r:tr;
begin
reset(pagos);
while not eof(pagos) do
     begin
     read(pagos,r);
     with r do
     write(codigo);
     end;
close(pagos);
end;

begin{programa principal}
assign(pagos,'pagos.dat');
graba(pagos);
lista(pagos);
readln;
end.

