program cargadorylistador;
type
  st8=string[8];
  st3=string[3];
TR=record
   dni:st8;
   codmateria:st3;
   nota:byte;

  end;

 Taralumno=File of TR;


var
alumno:Taralumno;

procedure graba(var alumno:Taralumno);
var
r:tr;
arch:text;
esp:char;
begin
assign(arch,'alumnos.txt');
reset(arch);
rewrite(alumno);
while not eof(arch) do
   begin
   readln(arch,r.dni,esp,r.codmateria,esp,r.nota);
   write(alumno,r);
   end;



close(arch);
close(alumno);
end;



procedure lista(var alumno:Taralumno);
var
r:tr;
begin
reset(alumno);
while not eof(alumno) do
     begin
     read(alumno,r);
     writeln(r.dni,' ',r.codmateria,' ',r.nota);

     end;
close(alumno);
end;

begin{programa principal}
assign(alumno,'alumno.dat');
graba(alumno);
lista(alumno);
readln;
end.

