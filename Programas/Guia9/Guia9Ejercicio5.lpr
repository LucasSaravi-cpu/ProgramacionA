
{5.- A partir de una matriz de NxM elementos enteros, generar un arreglo de registros que
contenga los elementos distintos de 0 y su posición dentro de la matriz (fila y columna). Luego, a
partir del arreglo:
a.- Determinar el porcentaje de elementos nulos de cada fila, sobre el total de nulos
b.- Reproducir en pantalla la matriz completa.
}

program Guia9Ejercicio5;

Type
  TR = record
    Elemento:integer;
    Fila,Col:byte;
  end;

  TM = Array[1..20,1..20] of integer;
  TV = Array[1..400] of TR;


Procedure LeeMatrXarch(var A:TM;var N,M:byte);{Lee matriz por archivo}
var
  i,j:byte;
  Arch:text;
begin
  Assign(Arch,'Texto.txt');Reset(Arch);
  readln(Arch,N,M);
  for i:=1 to N do
    begin
         for j:=1 to M do
             read(Arch,A[i,j]);
         readln(arch);
    end;
  Close(Arch);
end;



Procedure GeneraArreglo(var B:TV;var K:byte;A:TM;N,M:byte);
var
  i,j:byte;
begin
  K:=0;
  For i:=1 to N do
    For j:=1 to M do
      if A[i,j]<>0 then
         begin
            K:=K+1;
            B[K].Elemento:=A[i,j];
            B[K].Fila:=i;
            B[K].Col:=j;
         end;
end;



Procedure PorcXfila(A:TV;K,Ceros,N,M:byte);{Donde K es la dimension logica de A, ceros es la cantidad total de ceros y N es la cantidad de filas de la matriz}
var
  i,H,ElementosXfila:byte;
begin
  H:=1;
  For i:=1 to N do
    begin
         ElementosXfila:=0;
         while (A[H].Fila=i) and (H<=K)do
               begin
                    H:=H+1;
                    ElementosXfila:=ElementosXfila+1;
               end;
         writeln('El promedio de ceros de la fila ',i,' es ',(((M-ElementosXfila)/Ceros)*100):1:2);
    end;
end;


Procedure EscribeMatriz(A:TV;N,M:byte);
var
  i,j,H:byte;
begin
  H:=1;
  for i:=1 to N do
    begin
      For j:=1 to M do
               begin
                    if A[H].Col=J then
                       begin
                          Write(A[H].Elemento:4);
                          H:=H+1;
                       end
                    else
                       Write(0:4);
               end;
      writeln;
    end;
end;



{PROGRAMA PRINCIPAL}
var
  A:TM;
  K,N,M,Ceros:byte;
  B:TV;
begin
  LeeMatrXarch(A,N,M);
  GeneraArreglo(B,K,A,N,M);
  Ceros:=(M*N)-K;
  PorcXfila(B,K,Ceros,N,M);
  writeln('La matriz final sera: ');
  EscribeMatriz(B,N,M);
  readln;
end.
