{2.-Programar (adaptando el código existente) los ejercicios 6 ,7, 8 y 14 del Capítulo 7.
Reemplazar arreglos paralelos por arreglos de registros}



{7.-Sean NOMBRE y SEXO dos arreglos de N elementos que contienen el nombre (en mayúsculas)
y el respectivo sexo ('M' y 'F'). Escribir un procedimiento para generar dos nuevos vectores,
llamados VARONES Y MUJERES de tal forma que uno contenga el nombre de todos los varones y
el otro el de las mujeres. Mostrar ambos arreglos. }


program Guia9Ejercicio2_7;
Type
  TVStr=array[1..50] of string[25];
  TVChar=array[1..50] of char;

  TR = record
    CantPers:byte;
    Nombre:TVStr;
    Sexo:TVChar;
  end;

  TRes = record   {Registro respuesta}
    CantPers:byte;      {Cantidad de personas de un mismo sexo(H/M)}
    Pers:TVStr;         {Personas de ese mismo sexo(H/M)}
  end;
Procedure EscribeVector(A:TVStr;N:byte);
var
  i:byte;
begin
  for i:=1 to N do
  writeln(A[i]);
end;
  procedure LeeReg(var Reg:TR);
  var
    i:byte;
begin
  writeln('Ingrese la cantidad de personas');
  readln(Reg.CantPers);
  for i:=1 to Reg.CantPers do
  begin
    writeln('Ingrese el ',i,' nombre: ');
    readln(Reg.Nombre[i]);
    writeln('Ahora su sexo (M/F): ');
    readln(Reg.Sexo[i]);
    Reg.Sexo[i]:=upcase(Reg.Sexo[i]);
  end;
end;
var
  Reg:TR;
  Hombr,Muj:TRes;
  i:byte;
begin
  Hombr.CantPers:=0;Muj.CantPers:=0;
  LeeReg(Reg);
  For i:=1 to Reg.CantPers do
      begin
           If Reg.Sexo[i]='M' then
              begin
                   Hombr.CantPers:=Hombr.CantPers+1;
                   Hombr.Pers[Hombr.CantPers]:=Reg.Nombre[i];
              end
           else
               begin
                   Muj.CantPers:=Muj.CantPers+1;
                   Muj.Pers[Muj.CantPers]:=Reg.Nombre[i];
               end;
      end;
  if Hombr.CantPers>=1 then
     begin
          writeln('Los hombres son: ');
          EscribeVector(Hombr.Pers,Hombr.CantPers);
     end
  else
          writeln('No hay varones');
  if Muj.CantPers>=1 then
     begin
          writeln('Las mujeres son: ');
          EscribeVector(Muj.Pers,Muj.CantPers);
     end
  else
          writeln('No hay mujeres');
 readln();
end.

