{A partir de un arreglo A de N enteros , construir otro B con la misma secuencia pero ignorando los valores dupicados que se encuentren en A
Considere
A ordenado
A desordenado  }


Program Guia7Ejercicio11;
Type
TV=array[1..100] of byte;

var  {program principal}
n,cantB:byte;
A,B:tv;

procedure leevector(var v:tv;var n:byte);
var
i:byte;
begin
writeln('ingrese la cantidad de numeros');
readln(n);
for i:=1 to n do
   begin
   writeln('ingrese los numeros',i);
   readln(v[i]);
   end;
end;

Function Esta (V:tv; N:byte ; x:real):boolean;
var
i:byte;
begin
i:=0;
while (i<n) and (x<> V[i]) do
   i:=i+1;

Esta:=V[i]=x;

end;

procedure SinDuplicados (A :TV; var B:tv ; n:byte ; var cantB:byte);
var
i:byte;
begin
cantB:=0;
for i:=1 to n do
   begin
   if not esta(B,cantB,A[i]) then
     begin
     cantB:=cantB+1;
     B[cantB]:=A[i];
     end;
   end;
end;

procedure escvector(v:tv;L:byte);
var
  i:byte;
begin
for i:=1 to L do
   write(v[i]:5);

end;



begin{program principal}
leevector(A,n);
sinduplicados(A,B,N,cantB);
escvector(B,cantB);
readln;
end.

