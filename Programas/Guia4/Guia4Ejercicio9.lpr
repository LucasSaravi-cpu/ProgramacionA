{Una consultora evalua la aceptacion de un producto en el mercado y ha grabado en un archivo de texto las respuestas
de un conjunto de personas , una linea por cada una
edad  respuesta(c-lo compra - L-le interesa - N-no lo conoce
a)Total de encuestados
b) % de personas que lo compran con edad entre 20 y 45 años
c) % de personas que le interesa sobre el total de encuestados}

program Guia4Ejercicio9;

var
edad,total,contI,contN,contP,contC:byte;
respuesta:char;
arch:text;
begin
contI:=0;
contN:=0;
contP:=0;
contC:=0;

assign(arch,'Guia4Ejercicio9.txt');
reset(arch);
while not eof(arch) do
 begin
 readln(arch,respuesta,edad);
 respuesta :=upcase(respuesta); { convierte a mayuscula lo que esta en minuscula}
 If respuesta='C' then
    begin
    contC:=contC+1;
    if (edad>=20) and (edad<=45) then
       contp:=contp+1
    end
 else
    If respuesta='I' then
       contI:=contI+1
    else
       contN:=contN+1;  {no lo conoce}
 end;
Total:=ContC+contN+contI;
writeln('El total de encuestados es',total);
writeln('El % de personas que lo compran con edad entre 20 y 45 años ', (contP/contc)*100:8:2);
writeln('El  % de personas que le interesa sobre el total de encuestados',(contI/total)*100:8:2);
readln;
end.

