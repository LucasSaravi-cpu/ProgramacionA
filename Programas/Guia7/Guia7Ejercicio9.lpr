{Verificar si un arreglo de reales almacena todos n£meros positivos  }

program Guia7Ejercicio9;
type
tv=array[1..100] of real;  //vector

var{programa principal}
n:byte;
v:tv;

Procedure leevector(var v:tv; var n:byte);
var
i:byte;
begin
writeln('ingrese la cantidad de numeros');
readln(n);
for i:=1 to n do
    begin
    writeln('ingrese los numeros');
    readln(v[i]);
    end;
end;

function todosposit(v:tv;n:byte):boolean;    //Indica si todos son positivos en caso contrario false
var
i:byte;
begin
i:=1;
while (i<=n) and (v[i]>0) do
    i:=i+1;
    if (i>n) then
      todosposit:=true
    else
      todosposit:=false;
end;


 //otraforma
{function positivos(v:tv;n:byte):boolean;
var
i:byte;
begin
i:=1;
while i<=n and v[i]>0
positivos:= i>n;}



begin{programa princpal}
leevector(v,n);
if todosposit(v,n) then
  writeln('el arreglo tiene numeros positivos')
else
  writeln('el arreglo no tiene todos los numeros positivos');
readln;
end.

