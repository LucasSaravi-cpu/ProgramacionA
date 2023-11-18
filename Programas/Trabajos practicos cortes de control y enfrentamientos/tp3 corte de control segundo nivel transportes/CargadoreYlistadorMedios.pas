program cargadorMEDIOS;
type
    st6=string[6];
    tr=record
    nom:st6;
    end;
TarMedios=file of tr;

var{programa principal}
medios:Tarmedios;

procedure graba(var medios:Tarmedios);
var
r:tr;
i:byte;
begin
rewrite(medios);

for i:=1 to 3 do
   begin
   with r do
   readln(nom);
   write(medios,r);
   end;
r.nom:='zzzzzzzz';
write(medios,r);
close(medios);
end;

procedure lista(var medios:tarmedios);
var
r:tr;
begin
reset(medios);
while not eof(medios) do
     begin
     read(medios,r);
     with r do
     writeln(nom);
     end;
close(medios);
end;

begin{programa principal}
assign(medios,'medios.dat');
graba(medios);
lista(medios);
readln;
end.
