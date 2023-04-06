{Se tiene un tablero T de NxN enteros en el rango de 1 a 100 (N<=10) que corresponde a un
juego en el que intervienen N jugadores.
Tambien como parte del juego se cnocen N duplas cada una
nombre
numero
Esta infrmacion asocia el nombre de cada jugador con una fila del tablero T y un numero .Se pide desarrollar un programa pascal modularizad eficaz eficiete
y claro que ingrese la matriz T y el arreglo jug paralelo a filas . Luego determinar el nombre del ganador y cuanto cobrara
Ganara quien obtuvo el maximo puntaje que para cada jugador se calcula sumando los numeros de su fila de la siguiente forma
Si T[i,j]=numero se triplica el valor a sumar ( T[i.j]*3)
Si T[i,j] es multiplo de Numero se duplica el valor a sumar
Si numero es multiplo de T[i,j] se parte el valor a sumar ( T[i,j] div 2)
de otra forma se suma T[i,j]
El monto ganador se determina en base a pariedad de los numeros en la fila del ganador
Por cada valor impar $1000 por cada valor par 5000}


program EjercicioAdicionalSegundoCuatri5;

Type
    st5=string[6];
    TR=record
    nom:st5;
    valor:byte;
    end;

Type
    TM=array[1..10,1..10] of integer;
    TV=array[1..10] of TR;


procedure Lee(var jugador:TV ; var T:TM ; var N:byte);
var
i,j:byte;
arch:text;
begin
assign(arch,'EjercicioAdicionalSegundoCuatri5.txt');
reset(arch);
readln(arch,n);
for i:=1 to n do
    begin
    read(arch,jugador[i].nom, jugador[i].valor);
    for j:=1 to n do
        begin
        read(arch,T[i,j]);
        end;
    readln(arch);

    end;
close(arch);
end;


Function juego(jugador:tv;t:tm;n:byte):byte;
var
i,j:byte;
imax:byte;
max,sum:word;
begin
max:=0;
for i:=1 to n do
    begin
    sum:=0;
for j:=1 to n do
    begin
    if T[i,j]=jugador[i].valor then
       sum:=sum+T[i,j]*3
    else
       if T[i,j] mod jugador[i].valor =0 then
          sum:=sum+T[i,j]*2
       else
           if jugador[i].valor mod T[i,j] = 0 then
              sum:=sum+ T[i,j]div 2
           else
              sum:=sum+t[i,j];
    end;

    if max<sum then
       begin
       max:=sum;
       imax:=i;
       end;
    end;
juego:=imax;
end;

function suma(t:tm;n,i:byte):Real;
var
j:byte;
sum:real;
begin
for j:=1 to n do
    begin
    if not odd(t[i,j]) then
       sum:=sum+5000
    else
       sum:=sum+1000;
    end;
suma:=sum;
end;


procedure escribe(jugador:tv;t:tm;n:byte);
var
i,j:byte;
begin
for i:=1 to n do
    begin
    write(jugador[i].nom:5,jugador[i].valor:5);
    for j:=1 to n do
        begin
        write(T[i,j]:5);
        end;
    writeln;
    end;
end;

var
T:TM;
n,gana:byte;
jugador:TV;
begin
lee(jugador,t,n);
escribe(jugador,t,n);
gana:=juego(jugador,t,n);
writeln('La ganadora o ganador es ',Jugador[gana].nom,'  y gana $',suma(t,n,gana):8:2);
readln;
end.

