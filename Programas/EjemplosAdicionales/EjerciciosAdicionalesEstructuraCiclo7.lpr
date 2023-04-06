{Se tiene informacion de los pesos del equipaje de un conjunto de vuelos( no se conoce cuantos son)
y se desea evaluar el sobrepeso de equipajes de cada pasajero , de cada vuelo y en general
Para ello se registra de cada vuelo
codigo (*** fin de vuelos)
cantidad de pasajeros
y a continuacion por cada pasajero
categoria(A,B,C)
peso(en kilogramos de equipaje)

Los pesos permitidos son

categoria PESOS
A         40
B         30
C         23

Se pide leer la informacion descripta . Calcular e informar
a)de cada pasajero , kilos exedidos(puede ser 0)
b)De cada vuelo total de sobe peso en cada categoria
c)de todos los vuelos, el codigo de mayor sobre peso total

}


program EjerciciosAdicionalesEstructuraCiclo7;


var
  arch:text;
  categoria:char;
  peso,exeso,sumA,sumB,sumC,max,total:real;
  codigo,maxcodigo:string[3];
  cantidad,i:byte;
begin
assign(arch,'EjerciciosAdicionalesEstructuraCiclo7.txt');
reset(arch);
max:=0;
while not eof(Arch) do
begin
readln(arch,codigo,cantidad);
sumA:=0;
sumB:=0;
sumc:=0;
total:=0;
writeln('Para el codigo  ' ,codigo,'  los exesos son:');
for i:=1 to cantidad do
    begin
    readln(arch,categoria,peso);
    categoria:=upcase(categoria);
    case categoria of
     'A': if peso>=40 then
             begin
             exeso:=peso-40;
             sumA:=sumA+exeso;


             end
           else
             exeso:=0;
     'B': if peso>=30 then
             begin
             exeso:=peso-30;
             sumB:=sumB+exeso;
             end
          else
             exeso:=0;

     'C': if peso>=23 then
             begin
             exeso:=peso-23;
             sumC:=sumc+exeso;
             end
         else
              exeso:=0;

     end;
    Total:=total+exeso;
    writeln('Exeso ',exeso:0:2)
    end;

if  total>max then
   begin
   max:=total;
   maxcodigo:=codigo;
   end;
writeln('Para el codigo ',codigo,' el total de sobrepeso es ' ,'A= ',sumA:0:3,' B=0 ',sumB:0:3,'  C=  ',sumC:0:3);
end;
writeln('El codigo con mayor sobrepeso es ', maxcodigo ,'con ',max:0:3);
close(Arch);
readln;
end.

