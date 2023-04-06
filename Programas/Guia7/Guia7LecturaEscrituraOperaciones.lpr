{ a)Leer un arreglo de enteros
  b)calcula la suma de sus elementos
  c)cuenta la cantidad de componentes pares
  d)imprime las componentes que se encuentran en ubicaciones pares
  e)imprime el minimo
  f)permite elegir por medio de un menu el/los procesos descriptos     }

program Guia7LecturaEscrituraOperaciones;

const
      max=100;        //Dimencion fisica

TYPE TV=array[1..max] of integer;


procedure LeeVector(Var v:TV ; n:byte);
var
  i:byte;
begin
  for i:=1 to n do        //dimencion logica(utilizado)
     begin
       write('Ingrese el elemento');
       readln(V[i]);
     end;

end;


function suma(V:tv ; N:Byte ):integer;
var
  sum:integer;
  i:byte;
begin

  sum:=0;
  for i:=1 to n do
     sum:=sum+V[i];

  suma:=sum;

end;

Function cuentapares(v:tv;n:byte):byte;
var
  i,cont:byte;
begin
cont:=0;
for i:=1 to n do
   if v[i] mod 2 = 0 then      { not odd(V[i]) alternativa}
     cont:=cont+1;

cuentapares:=cont;
end;



function minimo(v:tv;n:byte):byte;
var
min:integer;
i:byte;
begin
min:=V[1];
for i:=2 to N do
   if V[i]<min then
      min:=V[i];
minimo:=min;
end;


procedure burbujeo(var v:tv ; n:byte; asendente:boolean);
var
aux:byte;
i,k,tope:byte;
begin
tope:=n;
repeat
k:=0;
for i:=1 to tope-1 do
   begin
   if asendente then
      begin
     if v[i]>v[i+1] then
        begin
	aux:=v[i];
	v[i]:=v[i+1];
	v[i+1]:=aux;
	k:=i;
	end
       end
    else
      if v[i]<v[i+1] then
	    begin
	    aux:=v[i];
	    v[i]:=v[i+1];
	    v[i+1]:=aux;
	    k:=i;
	    end;

     end;
   tope:=k;
until k<=1;
end;

procedure EscPosPares(v:tv;n:byte);
var
i:integer;
begin
i:=2;
while I<=N DO
  begin
  write(V[i]:5);
  i:=i+2;
  end;
end;

procedure Escribevector(v:tv;n:byte);
var
i:byte;
begin
for i:=1 to n do
   write(v[i]);
end;

var   {principal}
  n:byte;
  A:TV;
begin   {principal}
   writeln('Escriba la dimension del arreglo');
  readln(n);
  Leevector(A,N);
   writeln;
  writeln('Escribe los elementos de las posiciones pares del arreglo');
  writeln;
  EscPosPares(A,N);
  writeln;
  writeln('Vector asendente');
  burbujeo(A,N,true);
  escribevector(A,n);
  writeln;
  writeln('Vector desendente');
  burbujeo(A,N,false);
  escribevector(A,n);
 { Leevector(B,M); leer otro vector de enteros en caso de que no sea enteros ,se hace otro procedure  }
  writeln;
  writeln('La suma de los elementos del arreglo es',suma(A,N));
  writeln;
  writeln('la cantidad de numeros pares son ',cuentapares(A,N));
  writeln;
  writeln('El minimo numero del arreglo es',minimo(A,n));


readln;
end.

