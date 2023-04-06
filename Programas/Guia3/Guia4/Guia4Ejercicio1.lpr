{Leer un numero N , y a continuacin N numeros reales , Calcular e informar el promedio de los mismos, descartar los ceros ( si hubiera}

program Guia4Ejercicio1;
var
num,sum:real;
n,cont,i:byte;
begin
writeln('Ingresar la cantidad de numeros');
readln(n);
sum:=0;
cont:=0;
for i:=1 to n do
   begin
   writeln('ingresar los numeros reales');
   readln(num);
   if num<>0 then
      begin
      sum:=sum+num;
      cont:=cont+1;
      end
   end;
if cont<>0 then
  writeln('El promedio es:',sum/cont:8:2)
else
   writeln('son toddos 0');
readln;
end.


