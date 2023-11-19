program cargadorylistadorconductores;
 Type
 st10= String[8];
 st20=  string[20];
 tr=record
   dni:st10;
   nombre:st20;
   puntos:byte;
   end;

      TArconductores = file of tr;


var
conductor:TArconductores;

procedure graba(var conductor:TArconductores);
var
r:tr;
arch:text;
esp:char;
begin
assign(arch,'conductores.txt');
reset(arch);
rewrite(conductor);
while not eof(arch) do
   begin
   readln(arch,r.dni,r.nombre,r.puntos);
   write(conductor,r);
   end;



close(arch);
close(conductor);
end;



procedure lista(var conductor:TArconductores);
var
r:tr;
begin
reset(conductor);
while not eof(conductor) do
     begin
     read(conductor,r);

       writeln(r.dni,r.nombre,r.puntos)
     end;
close(conductor);
end;

begin{programa principal}
assign(conductor,'conductores.dat');
graba(conductor);
lista(conductor);
readln;
end.

