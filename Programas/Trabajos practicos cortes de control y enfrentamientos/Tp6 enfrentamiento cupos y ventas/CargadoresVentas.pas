program cargadoresventas;
Type
    st5=string[5];
    tr=record
       codigo:st5;
       tipo:char;{ A,B o C}
       MontoMercaderia:real;
    end;
   tarch1=file of tr;

var{programa principal}
ventas:tarch1;

procedure graba(var ventas:tarch1);
var
r:tr;
i:byte;
begin
rewrite(ventas);
writeln('Introducir las ventas (Codigo, tipo(A,B,C) y montomercaderia).Luego introdusca el centinela "zzzzz"');
for i:=1 to 7 do
    begin
    with r do
    readln(codigo,tipo,montomercaderia);
    write(ventas,r);
    end;
r.codigo:='zzzzz';
write(ventas,r);
close(ventas);
end;

procedure lista(var ventas:tarch1);
var
r:tr;
begin
reset(ventas);
while not eof(ventas) do
     begin
     read(ventas,r);
     with r do
     writeln(codigo:6,tipo:2,montomercaderia:3:2);
     end;
close(ventas);
end;

begin{programa principal}
assign(ventas,'ventas.dat');
graba(ventas);
lista(ventas);
readln;
end.
