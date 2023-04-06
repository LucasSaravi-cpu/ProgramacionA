{Calcular el promedio de los elementos de la fila F 1<=c<=m) }



Program Guia8Ejercicio1c;

Type
TipoMatriz=array[1..10,1..10] of integer;



procedure  LeeMatriz(var mat:Tipomatriz; var n,m:byte);    { leee por columnas primero}
var
i,j:byte;
begin
write('INGRESE LA CANTIDAD DE FILAS');
readln(n);
write('ingrese la cantidad de columnas');
readln(m);
for i:=1 to n do
   for j:=1 to m do
      begin
      write('fila , columna',i:3,j:3);
      writeln('Escribe el numero que deseas poner ');
      readln(mat[i,j]);
      end;
end;


Function prom(Mat:TipoMatriz; i,M:Byte):real;
Var
j:byte;
sum:real;
begin
sum:=0;
for j:=1 to m do
   sum:=sum+mat[i,j];

prom:=sum/m;
end;


var            {programa principal}
mat:tipomatriz;
n,m:byte;
i:byte;

begin
leematriz(mat,n,m);

writeln('ingresar la fila ');
readln(i);
writeln('El promedio para la fila  ' ,i, ' es ' , prom(mat,i,m):3:2);
readln;
end.

