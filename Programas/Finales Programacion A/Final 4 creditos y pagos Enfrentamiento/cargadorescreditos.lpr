program cargadorescreditos;
type
   st5=string[5];
   tr=record
     codigo:st5;
     ctotales:byte;
     cpagadas:byte;
   end;

   tarch1=file of tr;

var{programa principal}
creditos:tarch1;

procedure graba(var creditos:tarch1);
var
r:tr;
i:byte;
begin
rewrite(creditos);
for i:=1 to 5 do
    begin
    with r do
    readln(codigo,ctotales,cpagadas);
    write(creditos,r);
    end;
r.codigo:='zzzzz';
write(creditos,r);
close(Creditos);
end;

procedure lista(var creditos:tarch1);
var
r:tr;
begin
reset(creditos);
while not eof(creditos) do
     begin
     read(creditos,r);
     with r do
     write(codigo:6,ctotales:3,cpagadas);
     end;
close(creditos);
end;

begin{programa principal}
assign(creditos,'creditos.dat');
graba(creditos);
lista(creditos);
end.