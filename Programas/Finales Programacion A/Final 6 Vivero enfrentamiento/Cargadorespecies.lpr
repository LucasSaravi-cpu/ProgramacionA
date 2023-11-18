program Cargadorespecies;
type
   st10=string[10];
   tr=record
      nombre:st10;
      tipo:char;
      precio:real;
      cantidad:byte;
    end;
tarespecies=file of tr;

var{programa principal}
especies:tarespecies;

procedure graba(Var especies:tarespecies);
var
r:tr;
i:byte;
begin
rewrite(especies);
for i:=1 to 9 do
    begin
    with r do
    readln(nombre,tipo,precio,cantidad);
    write(especies,r);
    end;
r.nombre:='zzzzzzzzzz';
write(especies,r);
close(especies);
end;


procedure lista(var  especies:tarespecies);
var
r:tr;
begin
reset(especies);
while not eof (especies) do
     begin
     read(especies,r);
     with r do
     writeln(nombre:4,tipo:3,precio:8:2,cantidad:3);
     end;
close(especies);
end;

begin{programa princiapl}

assign(especies,'especies.dat');
graba(especies);
lista(especies);
readln;
end.

