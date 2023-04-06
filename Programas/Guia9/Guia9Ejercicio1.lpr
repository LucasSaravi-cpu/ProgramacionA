{Escribir las sentencias para:
 Leer REG (en C1 se almacenará la dimensión lógica de C2)
 Escribir REGI1
 Asignar todos los campos de REG a REGI.
 Asignar el campo C3 de REG al campo C3 de REGI.
 Asignar el campo C11 de REG1 al campo C11 de REGI1.
 Almacenar el promedio del campo C2 de REG al campo C13 de Reg1
No desarrollar un programa, solo las sentencias correspondientes a cada ítem. }

{ Considerando las siguientes declaraciones: }
program Guia9Ejercicio1;
type
 TV=array[[1..20] of real;
 St5= string[5];
 TR1 = record
 C1 : byte;
 C2 : TV;
 C3 : St5
 end;
 TR2 = record
 C11 : TR1;
 C12 : char;
 C13 : real;
 end;


procedure LeeTR1(var Reg:TR1);
var
i:byte;
begin
  writeln('Ingrese la dimension logica de C2');
  readln(Reg.C1);
  writeln('Ingrese C2')
  For i:=1 to Reg.c1 do
      begin
      readln(Reg.C2[i]);
      end;
  writeln('Ingrese C3');
  readln(Reg.C3);
end;


Procedure EscribeTR2(Regi1:TR2);
var
i:byte;
begin
write('La dimension logica de C2 sera: ',Regi1.C11.C1);
writeln('C2 sera: ')
  For i:=1 to Regi1.C11.c1 do
      begin
      write(Regi1.C11.C2[i]:1:4);
      end;
  writeln('C3 sera: ',Regi1.C11.C3);
  writeln('El C12 es: ',RegI1.C12);
  writeln('El C13 es: ',RegI1.C13);
end;


Procedure AsignaTR1(var RegI:TR1;Reg:TR1);
var
   i:byte;
begin
  RegI.C1:=Reg.C1;
  For i:=1 to Reg.C1 do
      RegI.C2[i]:=Reg.C2[i];

  RegI.C3:=Reg.C3;

end;



var
Reg, RegI : TR1;
Reg1,RegI1 : TR2;

Reg1.C3:=Reg.C3;
Regi1.C11:=Reg1.C11;{se permite asignación entre registros si son del mismo tipo}


Function Prom(A:TV;N:byte):real;
var
   i:byte;
   Aux:Real;
begin
  Aux:=0;
  for i:=1 to N do
      Aux:=Aux+A[i];
Prom:=Aux/n;
end;

Reg1.C13:=Prom(Reg.C2,Reg.C1);



