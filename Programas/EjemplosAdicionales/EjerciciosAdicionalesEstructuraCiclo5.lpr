{Ingresar un conjunto de numeros primos y por cada uno de ellos N numeros no primos

a) indicar para cada primo el numero minimo multiplo
b) por fin de proceso el % de promos sin multiplos
}


program EjerciciosAdicionalesEstructuraCiclo5;

var
primo,noprimo,total,i,min,cont,n:longint;

arch:text;
begin
assign(arch,'EjerciciosAdicionalesEstructuraCiclo5.txt');
reset(arch);
cont:=0;
total:=0;
while not eof(arch) do
  begin
  read(arch,primo,n);
  total:=total+1;
  min:=9999;
  for i:=1 to n do
      begin
      read(arch,noprimo);


     if (noprimo mod primo=0) then
         if noprimo< min then
             begin
             min:=noprimo;

             end;

      end;

    if min<>9999 then
      writeln('Para ',primo, ' el minimo multiplo es ',min)
    else
      begin
      writeln('Para el primo  ',primo,' NO TIENE MULTIPLOS');
      cont:=cont+1;
      end;
      readln(arch);
end;
writeln('El % de primos sin multiplos es ' , (cont/4)*100:8:2);
close(arch);
readln;
end.

