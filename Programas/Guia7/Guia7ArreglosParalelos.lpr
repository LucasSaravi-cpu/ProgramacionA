{En un archivo se han grabado , en cada linea , el nombre(10 caracteres) y la edad de un conjunto de personas.Se pide ingresar dichos
datos en dos vectores para luego listar los nombres de las personas cual edad este por debajo del promedio}

program Guia7ArreglosParalelos;


type
  st25=string[7];
  TVnom=array[1..50] of st25;
  TVedad=array[1..50] of byte;

procedure LeeParalelo(var Vnom:TVnom; var Vedad:TVedad ; var N:Byte);
var
  arch:text;
begin
  assign(Arch,'Guia7ArreglosParalelos.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
       begin
       n:=n+1;
       readln(arch,Vnom[N],Vedad[N]);

       end;
close(Arch);
end;

function promedio(V:TVedad;N:byte):real;
var
  sum:word;
  i:byte;
begin
sum:=0;
for i:=1 to N do
   sum:=sum+V[i];

promedio:=sum div n;
end;

procedure listado(Vnom:TVnom;Vedad:TVedad;N:byte;prom:real);
var
  i:byte;
begin
for i:=1 to n do
   if Vedad[i]>prom then
      writeln(Vnom[i]:5);
end;

var
  Vnom:Tvnom;
  Vedad:TVedad;
  n:byte;
  prom:real;

begin

LeeParalelo(Vnom,Vedad,N);
prom:=promedio(Vedad,N);
writeln('El listado es');
Listado(Vnom,Vedad,N,prom);
readln;
end.

