program Guia8MatrizLectura;

type
   TM=array[1..50,1..50] of byte;


Procedure LeeMatriz(Var Mat:TM; Var N, M :byte);
Var
i,j: byte;  //arch:text;                                      //assing(arch,'');
Begin                                                        //reset(Arch);
Write ('Ingrese cantidad de filas');
Readln(N);              //readln(arch,N,M)
Write ('Ingrese cantidad de columnas');
Readln(M);
For i:= 1 to N do                                  //Para leer por columna se intercambia los FOR
  For J:= 1 to M do
   Begin
   Write('fila, columna ', i:3, j:3);
   Readln(Mat[i, j]);                                        //readln(Arch,mat[i,j])
   end
end;

Procedure EscribeMatriz (Mat: TM; N,M : Byte);
Var
 i, j: byte;
Begin
For i:= 1 to N do
   Begin
   For j:= 1 to M do
       Write(Mat[i, j]: 4);
Writeln;
end
end;

var
 n,m:byte;
 A:TM;
begin
leematriz(A,N,M);
EscribeMatriz(A,N,M);
readln;
end.
