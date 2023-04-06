{Una empresa petrolera controla un gasoducto instalado en N tramos de la tuberia , indistrial
para medir la presion del gas. Al final de la semana se cuentan con el registro diario en cada uno de los N puntos de control
Se pide
Leer la matriz
generar un arreglo que contenga para cada tramo la diferencia entre la maxima y la minima presion registrada en la semana.
y apartir del mismo calcular cuantos tramos obtuvieron su diferencia por encia del promedio
indicar ademas cuantos tamos registraron presion asendente durante toda la semana}

program EjercicioAdicionalSegundoCuatri3;

const
      Dias=7;
      Semanas=4;

type
     TM=array[1..semanas,1..dias] of real;
     TV=array[1..semanas] of real;


procedure leematriz(var mat:tm);
var
i,j:byte;
arch:text;
begin
assign(arch,'EjercicioAdicionalSegundoCuatri3.txt');
reset(Arch);
for i:=1 to semanas do
    begin
    for j:=1 to  dias do
        begin
        read(Arch,mat[i,j]);
        end;

    readln(arch);
    end;

close(Arch);
end;

function minfila(mat:TM;i:byte):real;
var
j:byte;
min:real;
begin
min:=mat[i,1];
for j:=2 to dias do
    begin
    if min> mat[i,j] then
       min:=mat[i,j];
    end;
minfila:=min;
end;


function maxFila(mat:TM;i:byte):real;
var
j:byte;
max:real;
begin
max:=mat[i,1];
for j:=2 to dias do
    begin
    if max<mat[i,j] then
       max:=mat[i,j];
    end;
maxfila:=max;
end;

function ordenado(mat:TM;i:byte):byte;
var
j:byte;
begin
j:=1;
while (j<dias) and (mat[i,j]<mat[i,j+1]) do
j:=j+1;

if j=dias then
   ordenado:=i
else
  ordenado:=0;
end;

Procedure GeneraOtro  (mat:TM;var vec:TV);
var
i,j,cont,ord:byte;
minimo,maximo,diferencia:real;

begin
cont:=0;
for i:=1 to semanas do
    begin
    for j:=1 to dias do
        begin
        end;
    minimo:=minfila(mat,i);
    maximo:=maxfila(mat,i);


    diferencia:=maximo-minimo;
    vec[i]:=diferencia;
    Ord:=ordenado(mat,i);
    if ord<>0 then
        cont:=cont+1;

    end;

if cont<>0 then
   writeln('La cantidad de tramos con presion asendente son  ' , cont)
else
   writeln('no hay tramo con presion asendente');

end;


function promedio(vec:tv):real;
var
i:byte;
sum:real;
begin
sum:=0;
for i:=1 to semanas do
    begin
    sum:=sum+vec[i];
    end;

promedio:=sum/semanas;
end;


function cuantos(vec:tv):byte;
var
i,cont:byte;
begin

cont:=0;

for i:=1 to semanas do
    begin
    if vec[i]>promedio(vec) then
       cont:=cont+1;
    end;

cuantos:=cont;
end;

{procedure escribeMat(mat:tm);
var
i,j:byte;
begin
for i:=1 to semanas do
    begin
    for j:=1 to dias do
        begin
        write(mat[i,j]:3:2);
        end;
    writeln;
    end;
end;                  }

procedure escribe(vec:tv);
var
i:byte;
begin
for i:=1 to semanas do
    begin
    writeln(vec[i]:3:2);
    end;
end;

var
mat:TM;
vec:TV;
k:byte;
begin
leematriz(mat);
{escribemat(mat);       }
generaotro(mat,vec);
writeln('los tramos que obtuvieron su diferencia por encima del promedio son ', cuantos(vec));
writeln;
writeln('El vector ');
escribe(vec);
readln;
end.

