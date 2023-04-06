{Lee dos matrices matColor y Mat cantidad de enteros , ambas de NxN . Dichas matrices representan
un tablero con fichas rojas ,azules y verdes ('R','A','V').En cada casillero puede haber solamente fichas (1 o mas) de
un solo color, por lo tanto la matriz matcant indica esa cantidad.
Determinar e informar:
a)Cuantas columnas contiene todos los colores
b)Para un color dado(Ingresado por teclado) Generar un arreglo paralelo a las filas con el total
de fichas de dicho color, mostrar dichas cantidades y el % que representan sobre el total del color

A R R V
R V R V
R V A A
V R A R

1 7 4 3
2 2 5 6
2 8 5 20
10 8 10 9                                                  }

program EjercicioAdicionalSegundoCuatri4;

Type
     TMcolor=array[1..50,1..50] of char;
     TMcant=array[1..50,1..50] of byte;
     TV=array[1..50] of byte;


procedure LeeMatcantidad(var matcant:TMcant; var N:byte);
var
i,j:byte;
begin
writeln('Ingrese la dimension de la matriz');
readln(N);
for i:=1 to n do
   begin
   for j:=1 to n do
      begin
      writeln('Ingrese la cantidad para ',i,'x',j);
      read(matcant[i,j]);
      end;
   readln;
   end;
end;

procedure LeeMatcolor(var matcolor:TMcolor; var N:byte);
var
i,j:byte;
begin
writeln('Ingrese la dimension de la matriz');
readln(N);
for i:=1 to n do
   begin
   for j:=1 to n do
      begin
      writeln('Ingrese color ',i,'x',j);
      readln(matcolor[i,j]);
      end;
   end;
end;


Function esta(matcolor:TMcolor; n:byte; j:byte; color:char):boolean;
var
i:byte;
begin
i:=1;
while (i<n) and (matcolor[i,j]<>color) do
i:=i+1;
esta:=matcolor[i,j]=color;
end;


procedure  ResolucionA(matcolor:TMcolor;n:byte);
var
i,j:byte;
cont,cont1,cont2,todos:byte;
begin

for j:=1 to n do
   begin
   cont:=0;
   cont1:=0;
   cont2:=0;
   todos:=0;
   for i:=1 to n do
      begin
      end;

   if esta(matcolor,n,j,'R') then
      cont:=cont+1;
   if esta(matcolor,n,j,'A') then
      cont1:=cont1+1;
   if esta(matcolor,n,j,'V') then
      cont2:=cont2+1;

   if (cont+cont1+cont2)=3 then
       Todos:=todos+1;

   end;
if todos<>0 then
   writeln('La cantidad de columnas encontradas con todos los colores es  ',todos)
else
  writeln('No se encontro columnas con todos los colores ');
end;




procedure generoOtro(matcolor:TMcolor;matcant:TMcant;n:Byte; var vec:tv);
var
sum,i,j:byte;
color:char;

begin
writeln('ingrese color');
readln(color);
sum:=0;
for i:=1 to n do
   begin
   sum:=0;
   for j:=1 to n do
      begin
      if color=matcolor[i,j] then
         sum:=Sum+matcant[i,j]
      end;
  vec[i]:=sum;
  end;

end;

procedure escribecolor(vec:TV;matcolor:TMcolor;n:Byte);
var
i,j:byte;
begin
for i:=1 to n do
   begin
   for j:=1 to n do
      begin
      write(matcolor[i,j]:2);
      end;
   writeln(vec[i]:8);
   end;
end;



var
matcolor:TMcolor;
n:byte;
matcant:TMcant;
vec:tv;
begin
LeeMatcantidad(matcant,n);
leematcolor(matcolor,n);
writeln;
ResolucionA(matcolor,n);
writeln;
generoOtro(matcolor,matcant,n,vec);
writeln;
escribecolor(vec,matcolor,n);
readln;
end.

