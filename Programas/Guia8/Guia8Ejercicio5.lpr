
{.- En un juego se utiliza un tablero de N x N casillas. En cada una de ellas hay fichas Verdes,
Azules o Rojas (en distintas cantidades por casilla y de un solo color). Los datos se almacenan
en dos matrices, una contiene la distribución de los colores y otra las cantidades. Se desea
saber si el color que tiene más fichas es el más extendido en todo el tablero.


Ejemplo: N:4

R A A V 7 1 8 3
V A A A 0 7 4 1
R R R V 9 6 7 5
A V V A 3 3 1 2  }


program Guia8Ejercicio5;

type
   TM1=array[1..50,1..50] of byte;
   TM2=array[1..30,1..30] of char;


Procedure LeeMatriz(Var Mat:TM1; Var N:byte);
Var
i,j: byte;
Begin
writeln('Ingrese la cantidad de filas y columnas');
readln(n);
For i:= 1 to N do
  begin
  For J:= 1 to N do
   Begin
   writeln('Ingrese ',i,'x',j);
   readln(mat[i,j])
   end;
  end;
end;



Procedure EscribeMatriz (Mat: TM1; N: Byte);
Var
 i, j: byte;
Begin
For i:= 1 to N do
   Begin
   For j:= 1 to N do
       Write(Mat[i, j]: 4);
Writeln;
end
end;



Procedure LeeMatrizColor(Var Mat:TM2; Var C:byte);
Var
i,j: byte;
Begin
writeln('Ingrese la cantidad de filas y columnas de la matriz color ');
readln(C);
For i:= 1 to C do
  begin
  For J:= 1 to C do
   Begin
   writeln('Ingrese ',i,'x',j);
   readln(mat[i,j])
   end;
  end;
end;
Procedure EscribeMatrizColor (Mat: TM2; N: Byte);
Var
 i, j: byte;
Begin
For i:= 1 to N do
   Begin
   For j:= 1 to N do
       Write(Mat[i, j]: 4);
Writeln;
end
end;


Function Resolucion(mat1:tm1;mat2:tm2;N:byte):boolean;
var
i,j:byte;
sumrojo,rojo,sumazul,azul,sumverde,verde:byte;
colorFicha,ColorExtendido:char;
begin
  Rojo:=0;
  azul:=0;
  verde:=0;
  sumazul:=0;
  sumrojo:=0;
  sumverde:=0;
  for i:= 1 to N do
    begin
        for j:=1 to N do
         begin

         case mat2[i,j] of
                  'R':begin
                       SumRojo:=SumRojo+mat1[i,j];
                       rojo:=rojo+1;
                      end;
                  'A':begin
                       sumazul:=sumAzul+mat1[i,j];
                       azul:=azul+1;
                      end;
                  'V':begin
                       sumVerde:=Sumverde+mat1[i,j];
                       verde:=verde+1;
                      end;
         end;
         end;



    end;

  if (sumRojo>sumAzul) and (sumrojo>sumverde) then
     ColorFicha:='R'
  else
     if (sumazul>sumrojo) and (sumazul>sumverde) then
        ColorFicha:='A'
     else
        colorFicha:='V';

  if (rojo>azul) and (rojo>verde) then
     ColorExtendido:='R'
  else
     if (azul>rojo) and (azul>verde) then
        ColorExtendido:='A'
     else
         ColorExtendido:='V';


  if ColorFicha=ColorExtendido then
     Resolucion:=TRUE
  else
     Resolucion:=FALSE;
end;



var
 N:byte;
 Mat:TM1;
 color:TM2;
begin
leematriz(mat,N);
EscribeMatriz(mat,N);
writeln;
leematrizcolor(color,N);
EscribeMatrizColor(color,N);


if Resolucion(mat,color,N) then
      writeln('el color que tiene mas fichas es el mas extendido en todo el tablero')
   else
      writeln('el color que tiene mas fichas NO es el mas extendido en todo el tablero');
readln;
end.

