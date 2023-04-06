{Cambiar los siguientes programas pascal para que el ingreso de datos se realice desde archivo de texto}
program Guia4Ejercicio8a;
var
  edad,ant,antiguedad,masviejo:byte;
  max,min:real;
  arch:text;
begin
min:=999999;
max:=-8888;
assign(arch,'guia4ejercicio8a.txt');
reset(arch);
while not eof(arch) do
    begin
    readln(arch,edad,Antiguedad);
    if edad<min then
       begin
       min:=edad;
       ant:=antiguedad;
       end;
    if antiguedad>max then
       begin
       max:=antiguedad;
       masviejo:=edad;
       end
    end;
close(arch);
writeln('La antiguedad del mas joven es de ', ant);
writeln('La edad del mas antiguo es de ',masviejo);
readln;
end.
