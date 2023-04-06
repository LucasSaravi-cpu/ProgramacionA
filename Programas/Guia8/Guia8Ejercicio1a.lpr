{Lee una matriz entera A de NXM}


Program Guia8Ejercicio1a;

Type
TipoMatriz=array[1..10,1..10] of integer;

procedure  LeeMatriz(var mat:Tipomatriz; var n,m:byte);
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
      end
end;

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
n,m:byte;
begin
leematriz(mat,n,m);
escribematriz(mat,n,m);
readln;
end.
