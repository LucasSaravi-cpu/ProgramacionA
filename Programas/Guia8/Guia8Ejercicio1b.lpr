{Calcular el maximo de los elementos de la columna C ( 1<=f<=m)}



Program Guia8Ejercicio1b;

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
for j:=1 to m do
   begin
   for i:=1 to n do
      begin
      write('fila , columna',i:3,j:3);
      writeln('Escribe el numero que deseas poner ');
      readln(mat[i,j]);
      end;
end;
end;


Function Maxcolumna(Mat:TipoMatriz; j,n:Byte):integer;
Var
    i:Byte;
    Max: integer;
Begin
Max:= Mat[1,j];
For i:= 2 to N do
    If Max <Mat[i,j] then
       max:=Mat[i,j];
maxcolumna:= max
End;

procedure escribematriz(mat:TipoMatriz; n,m:byte);
var
i,j:byte;
begin
for i:=1 to n do
    begin
      for j:=1 to n do
          write(mat[i,j]:4);
          writeln;
    end
end;


var            {programa principal}
mat:tipomatriz;

j,n,m:byte;
begin
leematriz(mat,n,m);
escribematriz(mat,n,m);
writeln('Ingrese la columna en la cual quiere sacar el maximo');
readln(j);
writeln('El maximo para la columna ' , j,' es ',maxcolumna(mat,j,N));
 readln;
end.

