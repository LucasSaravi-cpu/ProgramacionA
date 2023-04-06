
{A partir de los arreglos Nombre y Sexo del ejercicio 7 se pide desarrollar un procedimiento
que ordene alfab‚ticamente los nombres vinculados con el respectivo sexo. Luego en otro
procedimiento mostrar ambos arreglos}


program Guia7Ejercicio14;
Type

  Str=string[10];

  TV=array[1..10] of Str;

Procedure OrdenaNombr(var V:TV;var N:byte;X:Str);
var
  i:byte;
begin
  i:=N;
  While (i>0) and (V[i]>X) Do
        begin
             V[i+1]:=V[i];
             i:=i-1;
        end;
  V[i+1]:= X;
  N:=N+1;
end;


Procedure EscribeVector(A:TV;N:byte);
var
  i:byte;
begin
  for i:=1 to N do
     writeln(A[i]);
end;




var
  M,F:TV;
  ContM,ContF:byte;
  Nombre:Str;
  Sexo:char;
begin
  writeln('Ingrese el primer nombre: ');
  readln(Nombre);
  ContM:=0;
  ContF:=0;
  while Nombre<>'***' do
        begin
             write('Ingrese el sexo(M/F): ');
             readln(Sexo);
             Sexo:=upcase(Sexo);
             IF sexo='M' then
                     OrdenaNombr(M,ContM,Nombre)
             Else
                     OrdenaNombr(F,ContF,Nombre);
             writeln('Ingrese otro nombre: ');
             readln(Nombre);
        end;


  if ContM>0 then
          begin
               Writeln('Los hombres son: ');
               EscribeVector(M,ContM);
          end
  else
      writeln('No hay hombres');


  if ContF>0 then
          begin
               writeln('Las mujeres son: ');
               EscribeVector(F,ContF);
          end
  else
      writeln('No hay mujeres');


readln;
end.


