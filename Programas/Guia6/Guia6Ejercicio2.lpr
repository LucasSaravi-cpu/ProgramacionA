{Utilize la Unit Varios resolver el siguiente problema
Ingresar M secuencias de N numeros determinar e informar
Cuantas Se cuencias Tienen al menos un numero primo
Al final del proceso calcular el factorial de numero primo minimo ( puede no existir si ninguna secuencia tuvo primos
Ejemplo M=4 y N=5
4 7 12 11 8
12 6 32 9 10
25 2 23 11 6
5 8 14 15 16}


program Guia6Ejercicio2;

Uses varios;

var
  num,cont,cont2,min,n,m,i,j:word;
  pri:boolean;
  fac:longint;
begin
min:=9999;
cont2:=0;
writeln('ingrese la cantidad de secuencias');
readln(M);
writeln('ingrese la cantidad de numeros de cada secuenccias');
readln(n);
for i:=1 to M do
    begin
    cont:=0;
    for j :=1 to N do
        begin
        writeln('Escribe los numeros');
        readln(num);
        pri:=primo(num);

        if pri=true then
           begin
           cont:=cont+1;
           if num<min then
              begin
              min:=num;
              end;
           end;
        end;

    if cont<>0 then
       cont2:=cont2+1;
    end;
writeln('Al menos ',cont2,' tiene al menos un numero primo');
writeln('El minimo numero es ' ,min);
if min<>9999 then
   writeln('el factorial del minimo numero es',Factorial(num))
else
   writeln('No existe ya que no hay secuncias con numeros primos');
readln;
end.

