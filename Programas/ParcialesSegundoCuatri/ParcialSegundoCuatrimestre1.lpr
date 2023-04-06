{N aerolineas Vuelan a M destinos, cada una se identifiac con un codigo de 4 caracteres
y realiza una cantidad de escalas variable.Dicha
informacion se organiza de la siguiente forma:

codAer(cadena de 4 caracteres)
y a continuación para cada uno de los M destinos , las escalas que realizan de 1..4

Se pide leer de teclado o archivo y almacenar dicha informacion mediante estricturas
adecuadas para luego calcular e informar para cada uno
de los siguientes requerimientos.

a)Para un destino D (1<=D<=M) calcular el codigo de la erolinea que realia
el vuelo con menos escaladas (Seleccionar el primero si hay mas de uno)
b)Para una aerolinea determinada , lo recaudado por la venta de k pasajes a diferentes destinos (1..M)
informacion que ingresa por teclado a un costo de 3000 el tramo
c)Cantidad de aerolineas que realizan mas de 1 escala en todos los destinos
}



program ParcialSegundoCuatrimestre1;

Type
    st4=String[4];
    TR=record
    CodAer:st4;
    end;

Type
    TM=array[1..50,1..50] of byte;
    TV=array[1..50] of TR;
    TVaero=array[1..50] of st4;


procedure lee(var mat:tm; var vec:tv ; var n,m:byte);
var
i,j:byte;
arch:text;
begin
assign(arch,'ParcialSegundoCuatrimestre1.txt');
reset(Arch);
readln(arch,n,m);
for i:=1 to n do
   begin
   read(arch,vec[i].CodAer);
   for j:=1 to m do
      begin
      read(arch,mat[i,j]);

      end;
      readln(arch);

   end;
close(Arch);
end;


procedure ResuelveB(mat:tm;vec:tv;n:byte);
var
i,j,k,des:byte;
codigo:st4;
sum:real;
begin
sum:=0;
writeln('Ingrese el Codigo ');
readln(codigo);
writeln('Ingrese la cantidad de pasajes');
readln(k);

for i:=1 to n do
   begin
   if (codigo=vec[i].CodAer) then
      begin
      for j:=1 to k do
         begin
         writeln('ingrese el destino');
         readln(des);
         sum:=sum+(mat[i,des]*3000);
         end;
      end;
   end;

writeln('El total para los ' ,k,' pasajes ' , 'a',codigo ,' sera' ,sum:5:2);
end;

procedure escribe(mat:tm;vec:tv;n,m:byte);
var
i,j:byte;
begin
for i:=1 to n do
   begin
   write(vec[i].CodAer:5);
   for j:=1 to m do
      begin
      write(mat[i,j]:5);
      end;
   writeln;
   end;
end;

function menor(mat:tm;n:byte;j:byte):byte;
var
min,imin,i:byte;

begin
min:=mat[1,j];
for i:=2 to n do
   begin

   if mat[i,j]<min then
      begin
      min:=mat[i,j];
      imin:=i;
      end;

   end;

menor:=imin;
end;

function esta(mat:tm;i:byte;m:byte):boolean;
var
j:byte;
begin
j:=1;
while (j<m) and (mat[i,j]>1) do
    j:=j+1;

esta:=mat[i,j]>1;
end;

procedure GeneraOtro(vec:tv;mat:tm;n,m:byte;var vecAero:TVaero; var k:byte);
var
i,j:byte;
begin
k:=0;
for i:=1 to n do
   begin
   for j:=1 to m do
      begin

      end;
   if esta(mat,i,m) then
      begin
      k:=k+1;
      vecAero[k]:=vec[k].codaer;
      end;
   end;
end;

procedure escribe(vecAero:TVaero;L:byte);
var
i:byte;
begin
for i:=1 to L do
   write(vecAero[i]:5);
end;

var
k,n,m,destino:byte;
Mat:TM;
vec:TV;
vecAero:TVaero;

begin
lee(mat,vec,n,m);
escribe(mat,vec,n,m);

resuelveB(mat,vec,n);
writeln;
writeln('Ingrese el destino de 1 a 6');
readln(destino);
writeln('Para el destino',destino,' la menor escalada es ',vec[menor(mat,n,destino)].codaer);
generaotro(vec,mat,n,m,vecaero,k);
writeln('Las aerolineas que realizaron mas de 1 escalada en todo los destinos es ');
escribe(vecAero,k);
readln;
end.


