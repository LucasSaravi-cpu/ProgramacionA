{6.- A partir de una matriz de NxN elementos reales, generar un arreglo de registros, cada uno
deberá contener el nro. de fila y el promedio de los elementos mayores al de la diagonal
respectivo, si no hubiera ninguno no generar registro para dicha fila.
Mostrar los resultados obtenidos}

program Guia9Ejercicio6;
Type
  TR = record
    Fila:byte;
    Promedio:Real;
  end;

  TM = Array [1..10,1..10] of Real;
  TV = Array [1..10] of TR;

Procedure LeeMatrXarch(var A:TM;var N:byte);{Lee matriz cuadrada M por archivo}
var
  i,j:byte;
  Arch:text;
begin
  Assign(Arch,'Texto.txt');
  Reset(Arch);
  readln(Arch,N);
  for i:=1 to N do
    begin
         for j:=1 to N do
             read(Arch,A[i,j]);

         readln(arch);
    end;
   Close(Arch);
end;


Procedure GeneraVec(var A:TV;var K:byte;M:TM;N:byte);
var
  i,j,Cont:byte;
  Acum:real;
  Hay:boolean;
begin
  K:=0;
  For i:=1 to N do
    begin
         Acum:=0;
         Cont:=0;
         Hay:=FALSE;
         For j:=1 to N do
           begin
            if M[i,j]>M[i,i] then
                begin
                Hay:=TRUE;
                Cont:=Cont+1;
                Acum:=Acum+M[i,j];
                end;
           end;

         if Hay then
            begin
            K:=K+1;
            A[K].Fila:=i;
            A[K].Promedio:=Acum/Cont;
            end;
    end;
end;


Procedure MuestraVec(A:TV;K:byte);
var
  i:byte;
begin
  For i:=1 to K do
      writeln('El ',i,' promedio es: ',A[i].Promedio:1:2,' de la fila ',A[i].Fila);
end;



var
  M:TM;
  A:TV;
  N,K:byte;

begin
  LeeMatrXarch(M,N);
  GeneraVec(A,K,M,N);
  MuestraVec(A,K);
  readln;
end.


