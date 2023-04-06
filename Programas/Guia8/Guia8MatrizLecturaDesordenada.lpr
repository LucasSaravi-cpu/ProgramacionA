program Guia8MatrizLecturaDesordenada;

type
   TM=array[1..50,1..50] of byte;

procedure InicializaMatriz(var mat:tm; n,m:byte);
var
 i,j:byte;
begin
  for i:=1 to n do
      for j:=1 to m do
          mat[i,j]:=0;
end;


Procedure LeeMatriz(Var A:TM {;var n,m:byte});
Var
i,j: byte;
arch:text;
Begin
assign(Arch,'Guia8MatrizLecturaDesordenada.txt');
reset(arch);
{n:=0;
m:=0;                                                 }
while not eof(Arch) do
    begin
    read(arch,i,j);
    readln(arch,A[i,j]);

    {if i>N  then
       N:=i;
    if j>M  then       // para devolver la dimension logica
       M:=j;     }

     end;

close(Arch);
end;



Procedure EscribeMatriz (A: TM; N,M : Byte);
Var
 i, j: byte;
Begin
For i:= 1 to N do
   Begin
   For j:= 1 to M do
       Write(A[i, j]: 4);
Writeln;
   end
end;

var
 n,m:byte;
 A:TM;
begin

writeln('INGRESE EL VALOR DE N');
readln(n);
writeln('INGRESAR EL VALOR DE M');
readln(m);

Inicializamatriz(A,N,M);

leematriz(A);

EscribeMatriz(A,N,M);

readln;
end.
