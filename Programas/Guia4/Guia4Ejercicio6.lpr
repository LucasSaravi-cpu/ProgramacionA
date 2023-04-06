{Se tienen pares de numeros reales que corresponden a largo y ancho de rectangulo , se pide ingresarlos confeccionado un listado que informe
el largo , el ancho y el area de aquellos rectangulos cuyo perimetro resulte mayor que un K (leido previamente),Indica ademas que porcentaje
de los rectangulos cumplieron lo pedido . Detener el proceso cuando ingrese el par (0 , 0)        }

program Guia4Ejercicio6;
var
 ancho,largo,K,area,perimetro:Real;
 contre,contper:Byte;
begin
contre:=0;
contper:=0;
writeln('Ingrese un perimetro');
readln(K);
writeln('Ingrrese el largo');
readln(largo);
writeln('Ingrese el ancho');
readln(Ancho);
while (largo<>0) and (ancho<>0) do  {condicion para seguir}
   begin
   contre:=contre+1;
   area:=largo*ancho;
   perimetro:=2*(largo+ancho);
   If perimetro>k then
      begin
      contper:=contper+1;
      writeln('El area del rectangulo es: ',area:8:2);
      end;
   writeln('Ingrese el largo');
   readln(largo);
   writeln('ingrese el ancho');
   readln(ancho);
   end;
writeln('El porecentaje de rectangulos que cumplieron lo pedido es',((contper/contre)*100):8:2);
readln;
end.

