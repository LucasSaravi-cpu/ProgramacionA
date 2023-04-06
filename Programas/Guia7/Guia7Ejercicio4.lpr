{A partir de un arreglo de N reales , construir y mostrar uno nuevo que contenga solo los valores menores al promediio}

program Guia7Ejercicio4;
const
     max=10;
TYPE
  TV=array[1..max] of real;

procedure Leevector(var v:tv ; var n:byte);
var
i:byte;
begin
write('Ingrese la cantidad de reales');
readln(n);
for i:=1 to n do
   begin
   writeln('Ingrese los reales');
   readln(V[i]);
   end;
end;

function promedio(v:tv;n:byte):real;
var
sum:real;
i:byte;
begin
sum:=0;
for i:=1 to n do
   sum:=sum+v[i];
promedio:=sum/n;
end;

procedure   generaotro (v:tv;n:byte;var ve:tv;var m:byte);
var
i:byte;
prom:real;
begin
m:=0;
prom:=promedio(v,n);
for i:=1 to n do
   if v[i]<prom then
     begin
     m:=m+1;
     ve[m]:=v[i];
     end;
end;

procedure escvector(ve:tv;m:byte);
var
i:byte;
begin
for i:=1 to m do
    writeln(ve[i]:5:2);
end;


var
n,m:byte;
v,ve:tv;   //dos arreglos


begin

leevector(v,n);
generaotro(v,n,ve,m);
escvector(ve,m);
readln;
end.

