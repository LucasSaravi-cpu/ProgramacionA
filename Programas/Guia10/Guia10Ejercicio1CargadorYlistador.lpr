program Guia10Ejercicio1CargadorYlistador;
Type
    st20=string[20];

    TR=record
    Dni:Integer;
    AyN:St20;
    notaTp1,par1,NotaTp2,par2:real;
    end;

 TarAlumnos=File of TR;


var{programa principal}
Alumnos:TarAlumnos;

procedure graba(var alumnos:TarAlumnos);
var
r:tr;
begin
rewrite(alumnos);
writeln('Ingrese el Dni');
readln(r.dni);
while r.dni<>0 do
   begin
   writeln('ingrese nombre y apellido');
   readln(r.AyN);
   writeln('ingrese las 4 notas ( una al lado de la otra');
   readln(r.notatp1,r.par1,r.notatp2,r.par2);
   write(alumnos,r);
   writeln('Ingrese el Dni');
   readln(r.dni);
   end;
close(alumnos);
end;

procedure lista(var alumnos:TarAlumnos);
var
r:tr;
begin
reset(alumnos);
while not eof(alumnos) do
     begin
     read(alumnos,r);
     writeln(r.dni);
     writeln(r.AyN);
     Writeln(r.notatp1,r.par1,r.notatp2,r.par2);
     end;
close(alumnos);
end;

begin{programa principal}
assign(alumnos,'alumnos.dat');
graba(alumnos);
lista(alumnos);
readln;
end.

