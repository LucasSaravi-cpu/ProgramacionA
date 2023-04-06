program Guia7Ejercicio16;
type
  TV=array[1..100] of integer;
{16.- Sea A un arreglo de N elementos enteros que contiene n£meros primos en las posiciones
impares y no primos en las posiciones pares. Determinar e informar el n£mero primo que tiene m s
m£ltiplos almacenados en el arreglo (suponer que es £nico y no realizar evaluaciones in£tiles)
Ejemplo N= 12 A= ( 7, 15, 13, 21, 5, 30, 11, 25, 2, 22, 3, 27)  resultado = 3   (if par mod primo = 0)
}
Procedure LeeVector(var A:TV;var N:byte);
var
  i:byte;
begin
  writeln('Ingrese la cantidad de elementos del vector');
  readln(N);
  for i:=1 to N do
  readln(A[i]);
end;
Function MultiplosAlmacenados (A:TV;N:byte;k:integer): Byte;
var
  i,Aux:byte;
begin
  i:=2;Aux:=0;
  while i<=N do
        begin
             if A[i] mod K = 0 then
                Aux:=Aux+1;
             i:=i+2;
        end;
  MultiplosAlmacenados:=Aux;
end;
var
  A:TV;
  N,i,MayorMult,MultActual:byte;
  NumPBusc:Integer;

begin
  LeeVector(A,N);
  i:=1;MayorMult:=0;
  while (i<=N) do
        begin
             MultActual:=MultiplosAlmacenados(A,N,A[i]);
             if MultActual>MayorMult then
                begin
                     MayorMult:=MultActual;
                     NumPBusc:=A[i];
                end;
             i:=i+2;
        end;
  if MayorMult<>0 then
  write('el numero primo que tiene mas multiplos almacenados en el arreglo es ',NumPBusc,' con ',MayorMult,' multiplos en el arreglo.')
  else
  write('No hay numeros primos con multiplos en el arreglo');
  readln;
end.


