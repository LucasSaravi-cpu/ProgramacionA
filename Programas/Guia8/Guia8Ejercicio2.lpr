{ En un archivo de texto se ha almacenado una matriz real de PxQ. En la primera l¡nea los
valores P y Q, en las P restantes los valores de cada fila (Q reales en cada una). Se pide:
a) Leer la dimensi¢n y la matriz.
b) Ingresar desde teclado valores enteros C1 y C2, verificar que ambos pertenezcan al
intervalo [1, Q] y permutar las columnas C1 con C2.
c) Ingresar desde teclado valores enteros F1, F2 y F3, verificar que sean diferentes entre s¡ y
que pertenezcan al intervalo [1, P], luego reemplazar los elementos de la fila F3 por la suma
de los elementos correspondientes de las filas F1 y F2.
}


program Guia8Ejercicio2;

type

  TM=array[1..30,1..30] of real;



Procedure LeeMatriz(var A:TM;var N,M:byte);{Lee matriz por archivo}
var
  i,j:byte;
  arch:text;
begin
  assign(arch,'Guia8Ejercicio2.txt');
  reset(arch);
  readln(Arch,N,M);
  for J:=1 to m do         //lo lee por columnas
    begin
         for I:=1 to N do
             read(Arch,A[i,j]);

         readln(arch);
    end;
close(arch);
end;


procedure PermutaColumnas(var A:TM;C1,C2,N:byte);
var
  i:byte;
  Aux:real;
begin
  for i:=1 to N do
    begin
         Aux:=A[c1,i];
         A[c1,i]:=A[c2,i];
         A[c2,i]:=Aux;
    end;
end;

{procedure permutafilas(var A:TM;C1,C2,M:byte);
var
  j:byte;
  Aux:real;
begin
  for j:=1 to M do
    begin
         Aux:=A[J,C1];
         A[J,C1]:=A[J,C2];
         A[J,C2]:=Aux;
    end;
end;
              }

Procedure SumaFilas(var A:TM;F1,F2,F3,M:byte);
var
  J:byte;
begin
  for j:=1 to m do
    A[j,F3]:=A[j,F1]+A[j,F2];
end;



Procedure EscribeMatriz(A:TM;N,M:byte);
var
  i,j:byte;
begin
  for J:=1 to M do
     begin
         for i:=1 to N do
             write(A[i,j]:1:1,'  ');

         writeln;
    end;

end;

var
M:TM;
P,Q,c1,c2,f1,f2,f3:byte;

begin
leematriz(M,P,Q);
writeln('La matriz principal es');
EscribeMatriz(M,P,Q);
writeln;
writeln('Ingresar dos columnas para permutarlas');
repeat
   begin
   writeln('Ingresar la primera columna-');
   Readln(C1);
   writeln('Ingresar la segunda columna-');
   readln(C2);
   end;
 until (C1<=Q) and (C2<=Q) and(C1>0) and (C2>0);
 writeln;
Permutacolumnas(M,c1,c2,Q);
writeln;
writeln('la matriz permutando las columnas queda');
EscribeMatriz(M,P,Q);
writeln;

Repeat
   begin
   Writeln('Ingrese 3 filas (distintas entre si) ');
   writeln('Fila 1');
   Readln(F1);
   writeln('Fila 2');
   Readln(F2);
   writeln('Fila 3 ');
   Readln(F3);
   end;
 until (F1<=p) and (F2<=P) and (F3<=P) and (F1>0) and (F2>0) and (F3>0) and (F1<>F2) and (F2<>F3) and (F1<>F3);

SumaFilas(M,f1,f2,f3,P);
Writeln('La matriz final sera: ');
EscribeMatriz(M,P,Q);
readln;
end.
