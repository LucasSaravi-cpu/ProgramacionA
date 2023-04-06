program Guia9Ejercicio2_8;
{2.-Programar (adaptando el código existente) los ejercicios 6 ,7, 8 y 14 del Capítulo 7.
Reemplazar arreglos paralelos por arreglos de registros}

{8.- Se tiene un archivo de texto DATOS.TXT con datos de alumnos de la universidad, en cada línea
del archivo se tiene: DNI (cadena de 8), Corte (año de ingreso) y Promedio.
Desarrollar un programa que lea la información indicada sobre 3 arreglos. A partir de ellos, y
mediante un menú que permita la repetición de las opciones con diferentes valores dados
(ingresados por teclado), calcule e informe:
a) Para un par de años dados A1 y A2, promedio general de los alumnos pertenecientes a las
cortes de los años A1.. A2.
b) Para una corte dada, el minimo promedio y su DNI (suponer único)
c) Para un DNI dado mostrar los datos del alumno (indicar si no se encontró)
}

Type
  Str = string[8];
  TR = record
    DNI:str;
    Corte:word;
    Prom:real;
  end;
  TV= Array [1..50] of TR;


Procedure LeeVec(var Vec:TV;Var N:byte);
var
  Arch:text;
begin
   assign(arch,'texto.txt');
   reset(arch);
   N:=0;
   while not eof(arch) do
        begin
             N:=N+1;
             read(arch,Vec[N].DNI,Vec[N].Corte,Vec[N].Prom);
             readln(arch);
        end;
   close(arch);
end;



Procedure A(Vec:TV;N:byte);
var
  i,Cont:byte;
  aux:real;
  A1,A2:word;
  Hay:boolean;
begin
 Aux:=0;Cont:=0;Hay:=FALSE;
 Writeln('Ingrese los anios A1,A2');
 readln(A1,A2);
 For i:=1 to N do
   if (Vec[i].Corte<=A2) and (Vec[i].Corte>=A1) then
     begin
          Aux:=Aux+Vec[i].Prom;
          Cont:=Cont+1;
          Hay:=TRUE;
     end;
 if Hay then
    Writeln('El promedio de todos los alumnos entre esos anios es de: ',(Aux/Cont):1:2)
 else
    Writeln('No hay alumnos entre esos anios');
end;
procedure B(Vec:TV;N:byte);
var
  i:byte;
  X:word;
  Pmin:real;
  DniMin:str;
  Hay:boolean;
begin
 Hay:=FALSE;
 Pmin:=101;
 writeln('Ingrese la corte para analizar: ');
 readln(X);
 For i:=1 to N do
   If X=Vec[i].Corte then
     If Vec[i].Prom<Pmin then
       begin
         DniMin:=Vec[i].DNI;
         Pmin:=Vec[i].Prom;
         Hay:=TRUE;
       end;
 if Hay then
    Writeln('Para ese anio, el Minimo promedio fue: ',Pmin:1:2,' con Dni: ',DniMin)
 else
    writeln('No hay alumnos que hayan ingresado en ese anio');
end;
Procedure C(Vec:TV;N:byte);
var
  i:byte;
  X:str;
begin
 i:=0;
 writeln('Ingrese el Dni del alumno para saber sus datos: ');
 readln(X);
 While (i<=N) and (X<>Vec[i].DNI) do
      i:=i+1;
 if i>N then
   writeln('No hay alumno con ese Dni')
 else
   Writeln('Los datos del alumno con Dni ',X,' son que ingreso en el anio ',Vec[i].Corte,' y tiene promedio ',Vec[i].Prom:1:2);
end;
Procedure ElegirMenu(Vec:TV;N:byte);
var
  Menu,Res:char;
begin
 Res:='S';
 while not (Res='N') do
        begin
             writeln('Ingrese la opcion que desea: A/B/C');
             readln(Menu);
             Menu:=upcase(Menu);
             case Menu of
                  'A':A(Vec,N);
                  'B':B(Vec,N);
                  'C':C(Vec,N);
             end;
             writeln('Desea ingresar otra opcion? S/N');
             readln(Res);
             Res:=upcase(Res);
        end;
end;
{PROGRAMA PRINCIPAL}
var
  Vec:TV;
  N:byte;
begin
  LeeVec(Vec,N);
  ElegirMenu(Vec,N);
  writeln('Fin del programa');
  readln;
end.

