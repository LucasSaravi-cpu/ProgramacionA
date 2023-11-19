program cargadorylistadorinfracciones;

 Type
 st10= String[8];
 tr=record
   dni:st10;
   puntos:byte;
   end;

      TArinfracciones = file of tr;


var
infracciones:TArinfracciones;

procedure graba(var conductor:TArinfracciones);
var
r:tr;
arch:text;
esp:char;
begin
assign(arch,'infracciones.txt');
reset(arch);
rewrite(infracciones);
while not eof(arch) do
   begin
   readln(arch,r.dni,r.puntos);
   write(infracciones,r);
   end;



close(arch);
close(infracciones);
end;



procedure lista(var infracciones:TArinfracciones);
var
r:tr;
begin
reset(infracciones);
while not eof(infracciones) do
     begin
     read(infracciones,r);

       writeln(r.dni,r.puntos)
     end;
close(infracciones);
end;

begin{programa principal}
assign(infracciones,'infracciones.dat');
graba(infracciones);
lista(infracciones);
readln;
end.

