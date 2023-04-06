{Leer de un archivo dos fracciones por linea(n1,d1,n2,d2) , obtener y mostrar el producto de ambas como fraccion, Implementar y utilizar
el procedimiento producto que reciba las dos fracciones y devuelva la fraccion producto (n3,d3)}


program Guia5Ejercicio5;

procedure producto(n1,d1,n2,d2:real ; var n3 ,d3:real);
begin
n3:=n1*n2;
d3:=d1*d2;
end;

var
n1,n2,n3,d1,d2,d3:real;
arch:text;
begin
assign(arch,'Guia5Ejercicio5.txt');
reset(Arch);
while not eof(Arch) do
   begin
   readln(arch,n1,d1,n2,d2);
   producto(n1,d1,n2,d2,n3,d3);
   writeln('La fraccion es: ',n3:0:0 ,'/',d3:0:0);
   end;
close(arch);
readln;
end.

