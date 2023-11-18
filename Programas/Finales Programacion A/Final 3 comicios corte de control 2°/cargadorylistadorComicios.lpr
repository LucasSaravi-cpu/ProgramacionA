program cargadorylistadorComicios;
Type
    st4=string[4];

    TR=record
    Circuito:st4;
    Mesa:st4;
    cantidaddeVotos:word;
    Cargo:char;
    end;

 TarComicios=File of TR;



procedure graba(var comicios:TarComicios);
var
r:tr;
arch:text;
esp:char;
begin
assign(arch,'comicios.txt');
reset(arch);
rewrite(comicios);
while not eof(arch) do
   begin
   readln(arch,r.circuito, esp, r.mesa,r.cantidaddevotos,esp,r.cargo);
   write(comicios,r)
   end;
close(arch);
close(comicios);
end;

procedure lista(var comicios:Tarcomicios);
var
r:tr;
begin
reset(comicios);
while not eof(comicios) do
     begin
     read(comicios,r);
     writeln(r.circuito,'   ', r.mesa,'  ',r.cantidaddevotos,'  ',r.cargo);
     end;

close(comicios);
end;

var{programa principal}
Comicios:TarComicios;

begin{programa principal}
assign(comicios,'comicios.dat');
graba(comicios);
lista(comicios);
readln;
end.
