{6.-Dada una matriz A de NxM elementos enteros, se desea generar un arreglo lineal B con los
elementos de la matriz A que cumplan:
 A[i, j] es par y A[i, j] > A[i, 1] รณ
 A[i, j] es impar y A[i, j] < A[i, 1] }

program Guia8Ejercicio6;

type
   TM=array[1..50,1..50] of integer;
   TV=array[1..30] of integer;


Procedure LeeMatriz(Var Mat:TM; Var N,M:byte);
Var
i,j: byte;
arch:text;
Begin
assign(arch,'Guia8Ejercicio6.txt');
reset(Arch);
readln(arch,N,M);

For i:= 1 to N do
  begin
  For J:= 1 to M do
   Begin
   read(arch,mat[i,j])
   end;
  readln(arch);
  end;
end;


procedure GeneraArreglo(mat:tm;N,M:byte;var V:tv;var k:byte);
var
i,j:byte;
begin
k:=0;
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        if (mat[i,j] mod 2 = 0 ) and  (mat[i,j]>mat[i,1]) then
           begin
           k:=k+1;
           V[k]:=mat[i,j];
           end
        else
            if  (not mat[i,j] mod 2 = 0 ) and (mat[i,j]<mat[i,1]) then
                begin
                k:=k+1;
                V[k]:=mat[i,j];
                end;
        end;

    end;
end;

Procedure EscribeVector(V:TV;k:byte);
var
  i:byte;
begin
  for i:=1 to k do
      write(V[i]:4);
end;


Procedure EscribeMatriz (Mat: TM; N,M: Byte);
Var
 i, j: byte;
Begin
For i:= 1 to N do
   Begin
   For j:= 1 to M do
       Write(Mat[i, j]: 4);
Writeln;
   end;
end;




var
 N,M,k:byte;
 Mat:TM;
 B:TV;

begin
leematriz(mat,N,M);
EscribeMatriz(mat,N,m);
writeln;
GeneraArreglo(mat,N,M,B,K);
writeln('El vector generado es');
writeln;
EscribeVector(B,k);
readln;
end.
