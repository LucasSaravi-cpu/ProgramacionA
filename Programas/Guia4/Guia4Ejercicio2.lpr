{Para n personas se registro el peso y la altura , calcular sus IMC y determinar e informar
el % de los que tienen un indice normal (18<=IMC>=21) }

program Guia4Ejercicio2;
var
peso,altura,imc,sum:real;
i,n,cont:byte;
begin
writeln('Ingresar la cantidad de personas');
readln(n);
cont:=0;
sum:=0;
for i:=1 to n do
   begin
   writeln('ingrese el peso ');
   readln(peso);
   writeln('ingrese la altura');
   readln(altura);
   imc:=peso/(sqr(altura));

   if (imc>=18) and (imc<=21) then
      begin
      sum:=sum+imc;
      cont:=cont+1;
      end;

   end;
if sum<>0 then
   writeln('El porcentaje de imc normal es ' , ((cont/sum)*100):8:2)
else
   writeln('no hay personas que tengan imc normal');
readln;
end.

