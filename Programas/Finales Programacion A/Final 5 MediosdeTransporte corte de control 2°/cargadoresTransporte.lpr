program cargadoresTransporte;
type
   st3=string[3];
   tr=record
      ciudad:st3;
      mediosdetransporte:byte;
      frecuencia:byte;
      capacidad:byte;
    end;
tartransporte=file of tr;

var{programa principal}
transporte:tartransporte;

procedure graba(Var transporte:tartransporte);
var
r:tr;
i:byte;
begin
rewrite(transporte);
for i:=1 to 3 do
    begin
    with r do
    readln(ciudad,mediosdetransporte,frecuencia,capacidad);
    write(transporte,r);
    end;
r.ciudad:='zzzzzzzz';
write(transporte,r);
close(transporte);
end;


procedure lista(var transporte:tartransporte);
var
r:tr;
begin
reset(transporte);
while not eof(transporte) do
     begin
     read(transporte,r);
     with r do
     writeln(ciudad:4,mediosdetransporte:3,frecuencia:3,capacidad:3);
     end;
close(transporte);
end;

begin{programa princiapl}

assign(transporte,'transporte.dat');
graba(transporte);
lista(transporte);
readln;
end.