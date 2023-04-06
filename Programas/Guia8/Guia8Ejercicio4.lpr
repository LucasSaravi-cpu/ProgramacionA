{Se han registrado los mm. de lluvia diaria (puede ser cero) caída en el mes de junio durante
N años. Dicha información debe leerse y almacenar en una matriz de Nx30, se pide calcular e
informar:
a) Cuantos años registraron lluvias todos los días de junio.
b) Cuál fue el año (orden 1..N) con menos días de lluvia
c) Cual fue el día (1..31) con mayor promedio diario (cantidad de mm.).}

program Guia8MatrizLectura;

type
   TM=array[1..50,1..50] of byte;


Procedure LeeMatriz(Var Mat:TM; Var N, M :byte);
Var
i,j: byte;
arch:text;
Begin
assign(arch,'Guia8Ejercicio4.txt');
reset(Arch);
readln(arch,N,M);

For i:= 1 to N do
  begin
  For J:= 1 to M do
   Begin
   read(Arch,mat[i,j])
   end;
  readln(arch);
  end;
close(arch);
end;



Function CuantosCoinciden(Mat:TM; N,M:byte):byte;
var
cont,i,j:byte;
begin
cont:=0;
for i:=1 to n do  
   begin
   j:=1;
   while (j<M) and (Mat[i,j]=0) do
       j:=j+1;
   if Mat[i,j]<>0 then
      cont:=cont+1;
   end;

CuantosCoinciden:=cont;
end;


function MenosDiasDelluvia(mat:tm;n,m:byte):byte;
var
i,j:byte;
minimoanio,min,cont:byte;
begin
min:=99;
for i:=1 to n do
   begin
   cont:=0;
   for j:=1 to m do
       begin
       if mat[i,j]=0 then
          cont:=cont+1;
       end;

    if cont<min then
       begin
       min:=cont;
       minimoanio:=i;
       end;
   end;

MenosDiasDeLluvia:=minimoanio;
end;

Function Dia(mat:tm;n,m:byte):byte;
var
i,j:byte;
maxdia,sum,cont:byte;
prom,max:real;
begin
max:=0;
for j:=1 to m do
   begin
   cont:=0;
   sum:=0;
   for i:=1 to n do
      begin
      sum:=sum+mat[i,j];
      cont:=cont+1;
      end;

   prom:=sum/cont;

   if prom>max then
      begin
      max:=prom;
      maxdia:=j;
      end;

   end;
dia:=maxdia;
end;

Procedure EscribeMatriz (Mat: TM; N,M : Byte);
Var
 i, j: byte;
Begin
For i:= 1 to N do
   Begin
   For j:= 1 to M do
       Write(Mat[i, j]: 4);
Writeln;
end
end;

var
 n,m:byte;
 A:TM;
begin
leematriz(A,N,M);
EscribeMatriz(A,N,M);
writeln('  Cuantos anios registraron lluvias todos los días de junio.: ' , cuantoscoinciden(A,n,m));

writeln('El anio con menos dias de llvuia : ',MenosDiasDelluvia(A,N,M));
writeln('El dia con mayor promedio diario es el dia ' , dia(A,n,m) );


readln;
end.


