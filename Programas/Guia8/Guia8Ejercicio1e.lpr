{Generar un vector v con los elementos de A que sean positivos}

Program Guia8Ejercicio1e;

Type
TipoMatriz=array[1..10,1..10] of integer;
Tipovector=array[1..10] of byte;


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




procedure vectorpositivos(mat:tipomatriz; n,m:byte; var vec:tipovector;var k:byte);
var
i,j:byte;
begin
k:=0;
for i:=1 to N do
   begin
   for j:=1 to m do
      begin
      if mat[i,j]>=0 then
         begin
         k:=k+1;
         vec[k]:= mat[i,j];
          end;

      end;
   end;

end;

procedure esevector(vec:tipovector;l:Byte);
var
i:byte;
begin
for i:=1 to l do
  write(vec[i]:5);
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
n,m,k:byte;
vec:tipovector;
begin
leematriz(mat,n,m);
escribematriz(mat,n,m);
vectorpositivos(mat,n,m,vec,k);
esevector(vec,k);

readln;
end.


