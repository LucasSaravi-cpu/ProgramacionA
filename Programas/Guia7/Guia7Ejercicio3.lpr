{Completa los subprogramas y el programa principal , de manera tal que resulva lo siguiente:

lee dos vectores x e y de n elementos , hallar el vector suma y el maximo valor del mismo . Mostrar el vector generado y el maximo}

program Guia7Ejercicio3;

type
  tv=array[1..20] of integer;

procedure leevec(N:byte;var v:tv);
var
  i:byte;
begin
  for i:=1 to n do
     begin
     writeln('ingresar el valor',i);
     readln(v[i]);
     end;
end;

procedure suma(N:byte;x,y:tv;var v:tv);
var
i:byte;
begin
for i:=1 to n do
   begin
   v[i]:=x[i]+y[i];
   end;
end;

function max(m:byte;w:tv):integer;
var
  aux:integer;
  i:byte;
begin
  aux:=w[1];             {aux=max}
for i:=2 to m do
    if w[i]>aux then
       aux:=w[i];
max:=aux;
end;

procedure muestravec(vec:tv;n:byte);
var
  i:byte;
begin
  for i:=1 to n do
     write(vec[i],' ');
end;

var
  v,x,y:tv;
  n:byte;
  maximo:integer;


begin
  writeln('dimencion del vector');
  readln(n);
  leevec(n,x);
  leevec(n,y);
  suma(n,x,y,v);
  maximo:=max(n,v);
  writeln('El maximo valor del vector suma es ',maximo:5);
  writeln('El nuevo vector es');
  muestravec(v,n);
readln;
end.
