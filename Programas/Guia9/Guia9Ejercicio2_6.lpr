{2.- Programar (adaptando el código existente) los ejercicios 6, 7, 8 y 14 del Capítulo 7.
Reemplazar arreglos paralelos por arreglos de registros.}


{Un consorcio registra las deudas de N propietarios, por cada uno:
• Apellido
• Cant.de expensas adeudadas
• Monto adeudado
Leer dichos datos en tres arreglos paralelos, luego, para los propietarios que tengan más de M
expensas adeudadas o que adeuden más de $ X, escribir un listado con el siguiente formato:
 Apellido Cantidad Deuda
 xxxxxxx 99 $9999,999
 xxxxxxx 99 $9999,999
M y X ingresan por teclado. }

program Guia9Ejercicio2_6;

type
  VecStr=array [1..50] of String[25];
  VecByte=array [1..50] of byte;
  VecReal=array[1..50] of real;

  TR = record
    CantProp:byte;
    Apellido:VecStr;
    CantExpensas:VecByte;
    MontoAdeud:VecReal;
  end;

procedure LeeReg(var Reg:TR);
  var
    i:byte;
begin
  writeln('Ingrese la cantidad de propietarios');
  readln(Reg.CantProp);

  for i:=1 to Reg.CantProp do
  begin
    writeln('Ingrese apellido,cantidad de expensas adeudadas y monto adeudado del ',i,' propietario: ');
    readln(Reg.Apellido[i],Reg.CantExpensas[i],Reg.MontoAdeud[i]);
  end;
end;



Function Expensas(M,N:byte):boolean;
begin
        if n<m then
           Expensas:=TRUE
        else
           Expensas:=FALSE;
end;

Function Deuda(M,N:real):boolean;
begin
     if N<M then
        deuda:=TRUE
     else
        deuda:=FALSE;
end;



var
   Reg:TR;
   i,M:Byte;
   X:real;
begin
  LeeReg(Reg);
  writeln('Ingrese la cantidad de expensas a comparar');
  readln(M);
  writeln('Ingrese la deuda a comparar');
  readln(X);

  for i:=1 to Reg.CantProp do
     if (Expensas(Reg.CantExpensas[i],M)) or (deuda(Reg.MontoAdeud[i],X)) then
         Writeln(Reg.Apellido[i],'  ',Reg.CantExpensas[i],'  ',Reg.MontoAdeud[i]:1:2);

  readln;
end.

