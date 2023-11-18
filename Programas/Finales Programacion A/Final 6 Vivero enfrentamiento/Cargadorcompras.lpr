program Cargadorcompras;
type
   st10=string[10];
   tr=record
      nombre:st10;
      tipo:char;
      precio:real;
      cantidad:byte;
    end;
tarcompras=file of tr;

var{programa principal}
compras:tarcompras;

procedure graba(Var compras:tarcompras);
var
r:tr;
i:byte;
begin
rewrite(compras);
for i:=1 to 7 do
    begin
    with r do
    readln(nombre,tipo,precio,cantidad);
    write(compras,r);
    end;
r.nombre:='zzzzzzzzzz';
write(compras,r);
close(compras);
end;


procedure lista(var  compras:tarcompras);
var
r:tr;
begin
reset(compras);
while not eof (compras) do
     begin
     read(compras,r);
     with r do
     writeln(nombre:4,tipo:3,precio:8:2,cantidad:3);
     end;
close(compras);
end;

begin{programa princiapl}

assign(compras,'compras.dat');
graba(compras);
lista(compras);
readln;
end.
