program cargadorylistador;

 Type
 st10= String[10];
 tr=record
    ciudad:st10;
    categoria:byte;
    hotel:st10;
    plazas:byte;
    precio:real;

   end;

      TAr = file of tr;


var
archivo:TAr;

procedure graba(var archivo:TAr);
var
r:tr;
arch:text;
esp:char;
begin
assign(arch,'archivo.txt');
reset(arch);
rewrite(archivo);
while not eof(arch) do
   begin
   readln(arch,r.ciudad,r.categoria,esp,r.hotel,r.plazas,r.precio);
   write(archivo,r);
   end;



close(arch);
close(archivo);
end;



procedure lista(var archivo:TAr);
var
r:tr;
begin
reset(archivo);
while not eof(archivo) do
     begin
     read(archivo,r);

       writeln(r.ciudad,'',r.categoria,'',r.hotel,'',r.plazas,'',r.precio);
     end;
close(archivo);
end;

begin
assign(archivo,'archivo.dat');
graba(archivo);
lista(archivo);
readln;
end.


