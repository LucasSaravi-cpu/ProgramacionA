{REGISTROS MATRICES Y VECTORES

En un juego de apuestas  N personas eligen M digitos con un determinado orden
Luego se sortean M digitos y se calcula quienes son los ganadores de la siguiente forma

Por cada acierto (digito y posision) se paga 1000 , si se acertaron mas de la mitad de los numeros se duplica y de acertar todos
se tripliaca

Ingresar los nombres y las respetivas apuestas de N jugadores y tambien los M dijitos sorteados en estructuras adecuadas

Generar un arreglo de registro ( ordenado desendetemente por la cantidad de ACIERTOS ) con el nombre , la cantidad de aciertos y importe
ganador de cada jugador qie haya obtenido al menos 2 aciertos

Desarrollar y utilizar un procedimiento CoincidenciasJugador que dada una fila de una matriz y un arreglo devuelva la cantidad de
coincidenicas y el monto correspondiente (cero si no hay coincidencias)

Mostrar el arreglo de registro generado e informar porcentaje de perdedores sobre el total de jugadores}


program ParcialSegundoCuatrimestre2;

type
    str6=string[6];
    TR=record
    nombre:str6;
    aciertos:byte;
    monto:real;
    end;

    TM=array[1..50,1..50] of byte;
    TV=array[1..50] of str6;
    TVpremio=array[1..6] of byte;
    TVsolucion=array[1..50] of TR;

const
     Premio:TVpremio=(9,1,5,0,3,4);


procedure LeeMatYvec(var mat:TM; var vec:TV ;var n,m:byte );
var
i,j:byte;
arch:text;
begin
assign(arch,'ParcialSegundoCuatrimestre2.txt');
reset(Arch);
readln(arch,n,m);
for i:=1 to n do
    begin
    read(arch,vec[i]);
    for j:=1 to m do
       begin
       read(arch,mat[i,j]);
       end;
    readln(arch);
    end;

close(arch);
end;


procedure CoincidenciasJugador(mat:tm;i,m:byte;var aciert:byte; var total:real);
var
j:byte;
begin
total:=0;
aciert:=0;
for j:=1 to m do
    begin
    if mat[i,j]=premio[j] then
       begin
       aciert:=aciert+1;
       total:=total+1000;
       end;

    end;

if aciert=6 then
   total:=total*3
else
   if aciert>=3 then
     total:=total*2;


end;




procedure GeneraVector (aciert:byte;total:real;vec:tv;mat:tm;m,n:byte;var vecsolu:TVsolucion; var k:byte );
var
i,perdedores:byte;
begin
k:=0;
perdedores:=0;
for i:=1 to n do
    begin
    coincidenciasjugador(mat,i,m,aciert,total);
    if (aciert<>0) and (total<>0) then
      begin
      k:=k+1;
      vecsolu[k].nombre:=vec[i];
      vecsolu[k].aciertos:=aciert;
      vecsolu[k].monto:=total;
      end
    else
         begin
         perdedores:=perdedores+1;
         end;
     end;
writeln('el % perdedores es ' , perdedores*100/n:8:2);
end;

procedure Ordenado(var v:TVsolucion ; var n:byte);
var
aux:byte;
aux2:str6;
aux3:real;
i,k,tope:byte;
begin
tope:=n;
repeat
k:=0;
for i:=1 to tope-1 do
   begin

      if v[i].aciertos<v[i+1].aciertos then
	    begin

            aux:=v[i].aciertos;
	    v[i].aciertos:=v[i+1].aciertos;
	    v[i+1].aciertos:=aux;


            aux2:=v[i].nombre;
            v[i].nombre:=v[i+1].nombre;
            v[i+1].nombre:=aux2;

            aux3:=v[i].monto;
            v[i].monto:=v[i+1].monto;
            v[i+1].monto:=aux3;

	    k:=i;
	    end;

     end;
   tope:=k;
until k<=1;
end;

procedure escribe(vecsolu:TVsolucion; k:byte);
var
i:byte;
begin
for i:=1 to k do
   begin
   if (vecsolu[i].aciertos>=2) then
       writeln('para el jugador ' , vecsolu[i].nombre , 'los aciertos son', vecsolu[i].aciertos,' y el monto es' , vecsolu[i].monto:8:2);

   end;
end;


var {programa principal}
n,m,k,aciert:byte;
mat:TM;
vec:TV;
vecSolu:TVsolucion;
total:real;
begin
LeeMatYvec(mat,vec,n,m);
GeneraVector (aciert,total,vec,mat,m,n,vecsolu,k);
ordenado(vecsolu,k);
escribe(vecsolu,k);
readln;
end.

