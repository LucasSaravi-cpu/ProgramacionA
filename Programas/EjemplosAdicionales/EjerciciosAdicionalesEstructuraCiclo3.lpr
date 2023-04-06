{Un local de comidas rapidas vende empanadas o pizza y ofrece las siguientes promociones :

Cada 18 empanadas , se agregan 2 gratis (obteniendo 20 en total)
cada 3 pizzas se otrga 1 gratis ( obteniendo 4 en total)

La entrega puede ser a domicilio (D) o en el local (L)

leer N pedidos , cada no

Producto (E -empandas  o p -pizza)
cantidad
Entrega(D o L)

Calcular e informar
a)Cantidad de pedidos de empanadas entregadas a domiciolio
b) % de empanadas gratis sobre el total de empanadas entregadas
c)cantidad de pizzas del pedido maximo (incluye las gratis)

}


program EjerciciosAdicionalesEstructuraCiclo3;



var
  arch:text;
  sumpizza,gratisE,gratisP,sumEmpanada,sumgratis,pedidos,cantidad,cont,i,max:byte;
  producto,entrega:char;


begin

assign(arch,'EjerciciosAdicionalesEstructuraCiclo3.txt');
reset(arch);
cont:=0;
max:=0;
sumEmpanada:=0;
sumgratis:=0;

while not eof(arch) do
begin
readln(arch,pedidos);
for i:=1 to pedidos do
     begin
     readln(arch,producto,cantidad,entrega,entrega);
     producto:=upcase(producto);
     entrega:=upcase(entrega);
     SumPizza:=0;
     case producto of
     'E':begin
         if entrega='D' then
            cont:=cont+1;

         gratisE:=(cantidad div 18)*2;
         sumgratis:=sumgratis+gratisE;
         sumEmpanada:=sumEmpanada+(cantidad+gratisE);
         end;
     'P':begin
         gratisP:=(cantidad div 3)*1;
         sumpizza:=sumpizza+(cantidad+gratisP);
         end;

     end;
     if sumpizza>max then
        max:=sumpizza
     end;

end;
writeln('Cantidad de pendidos de empadas entregadas a domicilio  ', cont);
writeln('% de empandas gratis sobte el total de empanadas entregadas ',(sumgratis/sumEmpanada)*100:0:2);
writeln('Cantidad de pizzas del pedido maximo incluyendo gratis ',max);
close(Arch);
readln;
end.

