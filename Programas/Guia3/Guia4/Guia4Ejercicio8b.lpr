{Se tienen pares de numeros reales que corresponden a largo y ancho de rectangulo , se pide ingresarlos confeccionado un listado que informe
el largo , el ancho y el area de aquellos rectangulos cuyo perimetro resulte mayor que un K (leido previamente),Indica ademas que porcentaje
de los rectangulos cumplieron lo pedido . Detener el proceso cuando ingrese el par (0 , 0)

cargarlo por arhivo de texto }

program Guia4Ejercicio8b;
var
 ancho,largo,K,area,perimetro:Real;
 contre,contper:Byte;
 arch:text;
begin
contre:=0;
contper:=0;
assign(arch,'Guia4Ejercicio8b.txt');
reset(arch);
readln(arch,K);
while not eof(arch) do
   begin
   readln(arch,largo,ancho);
   contre:=contre+1;
   area:=largo*ancho;
   perimetro:=2*(largo+ancho);
   If perimetro>k then
      begin
      contper:=contper+1;
      writeln('El area del rectangulo es: ',area:8:2);
      end;
   end;

writeln('El porecentaje de rectangulos que cumplieron lo pedido es',((contper/contre)*100):8:2);
close(arch);
readln;
end.
