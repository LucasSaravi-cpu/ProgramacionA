{Desarrollar un programa Pascal, claro, eficaz, eficiente y modularizado que implemente la siguiente consigna:
En un juego de apuestas, N personas eligen M d¡gitos con un determinado orden.
Luego se sortean M d¡gitos y se calcula quien es /son los ganadores de la siguiente
forma:
Por cada acierto (digito y posici¢n) se paga $1000, si se acertaron m s de la mitad
de los n£meros se duplica y de acertar todos se triplica.
Ingresar los nombres y las respectivas apuestas de N jugadores, y tambi‚n los M
d¡gitos sorteados en estructuras adecuadas.
Generar un arreglo de registros (ordenado descendentemente por la cantidad de
aciertos) con el nombre, la cantidad de aciertos y el importe ganado de cada jugador
que haya obtenido al menos 2 aciertos.
Desarrollar y utilizar un procedimiento CoincidenciasJugador que dada una fila de
una matriz y un arreglo devuelva la cantidad de coincidencias y el monto
correspondiente (cero si no hay coincidencias)
Mostrar el arreglo de registros generado e informar el porcentaje de perdedores
sobre el total de jugadores.       }

Program ejemploSegundoParcial;

Type
St6=string[6];
TR=Record
Nombre:St6;
end;

type
TS=record
nombre:st6;
coincidencias:byte;
monto:real
end;


TM=array [1..10,1..10] of byte;
tv=array[1..10] of tr;
tv2=array[1..6] of  byte;
tv3=array[1..10] of ts;
const
Premios:tv2=(9,1,5,0,3,4);

var{programa principal}
apuestas:tm;
nom:tv;
n,m,a:byte;
monto:real;
coincidencias:byte;
resultado:tv3;
nombre:st6;

Procedure lee(var apuestas:TM;var nom:tv; var n,m:byte);

var
arch:text;
i,j:byte;
begin
assign(arch,'apuestas.txt');
reset(Arch);
read(arch,n,m);
for i:=1 to n do
    begin

   for j:=1 to m do
       begin
       read(Arch,apuestas[i,j]);
       end;
       read(arch,nom[i].nombre)
   end;
close(Arch);
end;

Procedure coincidenciasJugador(var apuestas:tm; var n,m:byte;var monto:real;var coincidencias:byte;var resultado:tv3);
var
cont,i,j:byte;

begin
for i:=1 to n do
   begin
   coincidencias:=0;
   for j:=1 to m do
       begin
      if  (premios[j]=apuestas[i,j]) then
          coincidencias:=coincidencias+1; {si no hay coincidencias como el contador es 0 , coincidencias=0}

       end;
    if (coincidencias=m) then
       monto:=(coincidencias*1000)*3
    else
       if (coincidencias>=(m/2)) then
          monto:=(coincidencias*1000)*2
       else
          monto:=coincidencias*1000;
      resultado[i].coincidencias:=coincidencias;
      resultado[i].monto:=monto;
    end;
end;

function perdedores(apuestas:tm;n,m:byte):real;
var
i,j:byte;
cont1,cont:byte;
begin
cont1:=0;
for i:=1 to n do
   begin
   cont:=0;
   for j:=1 to m do
      begin
      if premios[j]<> apuestas[i,j] then
        cont:=cont+1;
      end;

   if cont=m then
     cont1:=cont1+1;
   end;

perdedores:=(cont1*100/n);
end;

{
procedure InserteOrdenado (  var resultado:tv3;var n:byte;var coincidencias:byte);
var
j:Byte;
begin
j:=n;
while (j>0) and (resultado[j].coincidencias>resultado[j-1].coincidencias) do
begin
resultado[j+1].coincidencias:=resultado[j-1].coincidencias;
j:=j-1;
end;
resultado[j+1].coincidencias:=resultado[j].coincidencias;
n:=n+1;
end;

                                                         }
Procedure esevector(var resultado:tv3;var n:byte;var coincidencias:byte;var monto:real;var nom:tv);
var
i:byte;
begin
for i:=1 to n do
   if resultado[i].coincidencias>=2 then

      writeln(nom[i].nombre,'  ' ,resultado[i].coincidencias,'  ' ,resultado[i].monto:3:2);
end;

begin{programa principal}
lee(apuestas,nom,n,m);
coincidenciasjugador(apuestas,n,m,monto,coincidencias,resultado);
{InserteOrdenado(resultado,n,coincidencias);   }
esevector(resultado,n,coincidencias,monto,nom);
writeln('El % de perdedores son', perdedores(apuestas,n,m):2:3);
readln;
end.
