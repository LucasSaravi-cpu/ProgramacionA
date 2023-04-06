{En un juego para computadora con N escenarios (N <= 10) se registran los ingresos de jugadores a cada uno de ellos
en determinada hora del d¡a.
Los datos de los ingresos se encuentran en un archivo de texto, de manera desordenada, formando la siguiente tripla
por l¡nea:
 Escenario (1..10)
 Hora (1..24)
 Cantidad de accesos
En la primera l¡nea del archivo figura la cantidad de escenarios (N). El archivo de texto est  provisto en la tarea.
Se pide:
a) Organizar estos datos almacen ndolos en una matriz de 10 x 24 enteros positivos.
b) Informar la hora del d¡a con mayor cantidad de ingresos teniendo en cuenta todos los escenarios, y si dicha
hora tuvo alg£n escenario sin ingresos.
c) Generar un arreglo de registros con los escenarios que tengan m s de X ingresos diarios (X es solicitado al
usuario). Cada celda debe contener el n£mero de escenario y la cantidad de accesos. Mostrar el arreglo
generado.
d) A partir del arreglo generado en c) desarrollar una funci¢n que retorne la cantidad de accesos para un
escenario E (E es solicitado al usuario). }
program ParcialSegundoCuatrimestre3;

const
     horas=24;

Type
    TR = record
    NumEsc:byte;   {numero de escenario}
    CantAcc:word;  {cantidad de accesos}
  end;
     TV = Array [1..10] of TR;
     TM=array[1..10,1..horas] of byte;



Procedure IniciaMatriz(Var Mat:TM; N:byte);
Var
 i, j: byte;
begin
For i:= 1 to N do
    For j:= 1 to horas do
        Mat[i, j]:=0;
End;


Procedure LeeMatriz (var Mat:TM;var N:byte);
var
  i,j:byte;
  Arch:Text;
Begin
  Assign(Arch,'ParcialSegundoCuatrimestre3.txt');
  Reset(Arch);
  Readln(Arch,N);
  iniciamatriz(mat,n); {inicializo toda la matriz en 0}
  While not eof (Arch) do
        begin
             read(Arch,i,j);
             readln(Arch,Mat[i,j]);
        end;
  Close(Arch);
end;

procedure escribe(mat:Tm;n:Byte);
var
i,j:byte;
begin
for i:=1 to n do
    begin
   for j:=1 to horas do
       begin
       write(mat[i,j]:4);
       end;
    writeln;
    end;
end;


function TodosIngresos(Mat:TM;Hora,N:byte):boolean;{devuelve true si hubo ingresos en todos los niveles}
var
  i:byte;
begin
  i:=1;
  While (i<=N) and (Mat[i,Hora]<>0) do
        i:=i+1;

  TodosIngresos:=i>N;
end;

procedure Resuelve(mat:tm;n:byte);
var
i,j,maxcolumna:byte;
max,acum:word;
begin
max:=0;
for j:=1 to horas do
    begin
    Acum:=0;
    for i:=1 to n do
        begin
        Acum:=Acum+mat[i,j];
        end;

    if acum>max then
        begin
        max:=acum;
        maxColumna:=j;
        end;
    end;

writeln('La hora con mayor ingreso es ',maxcolumna, ' con ' , max ,' ingresos');

if  not TodosIngresos(mat,maxcolumna,n) then
    writeln('Tuvo esenarios sin ingresos');
end;

Procedure GeneraArreglo(Mat:TM;N:byte;X{ingresos diarios}:word;var Reg:TV;var K:byte);
var
  Acum:word;
  i,j:byte;
begin
  K:=0;
  For i:=1 to N do
    begin
    Acum:=0;
    For j:=1 to Horas do
        begin
        Acum:=Acum+Mat[i,j];
        end;
    If Acum>X then
      begin
      K:=K+1;
      Reg[K].NumEsc:=i;
      Reg[K].CantAcc:=Acum;
      end;

    end;

end;

procedure escribeVector(reg:tv;k:Byte);
var
i:byte;
begin
for i:=1 to k do
    writeln(reg[i].numesc:3,reg[i].cantacc:5);

end;


Function CantDeAccesosParaE(Reg:TV;K,e:byte):word;
var
  i:byte;
begin
  i:=1;
  While  (i<=K) and (Reg[i].NumEsc<>e) do
        I:=i+1;
  if i<=K then
     CantDeAccesosParaE:=Reg[i].CantACC
  else
    CantDeAccesosParaE:=0;
end;

var
mat:TM;
n,k,e:byte;
x,cantidad:word;
reg:tv;
begin
leematriz(mat,n);
escribe(mat,n);
Resuelve(mat,n);
writeln;
writeln('Generar un arreglo de registros con los escenarios que tengan mas de X ingresos diarios ');
readln(x);
generaarreglo(mat,n,x,reg,k);
escribevector(reg,k);

writeln('Ingrese el numero de escenario del cual quiera saber la cantidad de accesos');
readln(e);
cantidad:=CantDeAccesosParaE(reg,k,e);
if cantidad<>0 then
  writeln('La cantidad de accesos para el esenario ',e,'  es  ' , cantidad)
else
  writeln('No hay accesos para este esenario');

readln;
end.

