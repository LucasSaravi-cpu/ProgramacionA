program cargadorylistador;

 Type
 st10= String[8];
 tr=record

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
   readln(arch,);
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

       writeln()
     end;
close(archivo);
end;

begin
assign(archivo,'infracciones.dat');
graba(archivo);
lista(archivo);
readln;
end.

