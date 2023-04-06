{En una partida de dados interviene una cantidad desconocida de jugadores , cada uno realiza 5 tiros con 2 dados.Dicha informacion, Se agrupa
Nombre(cadena 10 , xxx fin de datos)
y a continuacion 5 pares de nuumeros (entre 1 a 6)
Se pide ingresar la informacion ( desde archivo o teclado) para informar
a)de cada jugador el puntaje obtenido
y por fin de proceso
b)el nombre del ganador(maximo puntaje)
c)% de jugadores obtuieron en algun tiro el 1

El puntaje de un tiro se calcula de la siguiente forma suma de los dos dados
triplica si son iguales
dublica si son consecutivos (abs(d1-d2)=1)

Desarrollar y utilizar la funcion PUNTAJE que apartir de los valores de los dados devuelva el puntaje.
}






program ParcialPrimercuatrimestre5;
function puntaje(d1,d2:byte):byte;
begin
if d1=d2 then
  puntaje:=(d1*3+d2*3)
else
  if abs(d1-d2)=1 then
     puntaje:=(d1+d2)*2
  else
     puntaje:=d1+d2;
end;

var
arch:text;
max,i,sum,cont,cont1,d1,d2,valor:byte;
nombre,maxnombre:string[5];
uno:boolean;
begin
assign(arch,'ParcialPrimercuatrimestre5.txt');
reset(arch);
max:=0;
cont:=0;
cont1:=0;

while not eof(arch) do
      begin
      sum:=0;
      cont:=cont+1;
      readln(arch,nombre);
      uno:=false;
      for i:=1 to 5 do
          begin
          readln(arch,d1,d2);
          if (d1=1) or (d2=1) then
             uno:=true;
          valor:=puntaje(d1,d2);
          sum:=sum+valor;
          end;
      writeln(nombre,'  obtuvo un puntaje de ' ,sum);
      if uno then
        cont1:=cont1+1;
      if sum>max then
         begin
         max:=sum;
         maxnombre:=nombre;
         end;
      end;
writeln('el nombre del ganadr es  ' , maxnombre,' y obtuvo  ',max,' puntos');
writeln('los jugadores que obtuvieron un 1 en alguna jugada ', cont1*100/cont:8:2);
readln;
end.

