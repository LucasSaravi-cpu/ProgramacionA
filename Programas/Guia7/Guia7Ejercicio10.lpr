{ Verificar si un arreglo de enteros esta ordenado descendentemente.  }


Program Guia7Ejercicio10;
Type
TV=array[1..100] of byte;

var  {program principal}
n:byte;
v:tv;

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

Function ordenados(v:tv;n:byte):byte;
var
i:byte;
begin
i:=1;
while (i<n) and (V[i]>v[i+1]) do       // V[i]>v[i+1] El que le sigue tiene que ser menor al anterior (Desendientemente)
i:=i+1;                                 // V[i]<v[i+1] El que le sigue tiene que ser mayor al anterior (asendendentemente)
if i=n then
  ordenados:=i
else
  ordenados:=0;
end;

{Function OrdenadosDesendente(V:tv;n:byte):boolean;
var
i:byte;
begin
i:=2;
while (i<=n) and (v[i]<v[i-1]) do
i:=i+1;

OrdenadosDesendente:=i>n;
end;                                     }



begin{program principal}
leevector(v,n);
if ordenados(v,n) <> 0 then
   writeln(' El arreglo esta ordenado desendentemente')
else
  writeln('el arreglo no esta ordenado desendentemente');

{writeln('El arreglo ',ordenadosdesendente(v,n));    }

readln;
end.

