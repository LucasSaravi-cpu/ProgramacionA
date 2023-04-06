{1.- Crear un archivo ALUMNOS, con los datos de los alumnos de Programación A. El diseño de
registro es:
# DNI
# APELLIDOyNOMBRE
# NotaTP1, Par1, NotaTP2, Par2
Teniendo en cuenta el cálculo de la nota final:
 NF = 0.30 * Par1 + 0.10 * TP1 + 0.40 * Par2 + 0.20 * TP2
Desarrollar un programa que lea el archivo y muestre los datos de los alumnos que
promocionaron, la cantidad de alumnos que regularizaron y el porcentaje de desaprobados.
A un parcial no rendido o un TP no entregado le corresponde nota cero.
Recordar que:
− Para promocionar la materia deberá tener aprobados los dos Trabajos Prácticos y los dos
parciales, con NF >= 7. Dicha nota será la definitiva
− Para regularizar la materia deberá tener aprobados los dos parciales y al menos un Trabajo
Práctico con 4 <= NF < 7.
− Cualquier otra situación, lleva a desaprobar la cursada
Desarrollar un procedimiento que a partir de las 4 notas devuelva el promedio y la situación del
alumno (P, R ó D)   }


{
Datos
11111111 aaaa aaaa 4 4 4 4
22222222 bbbb bbbb 2 1 0 1
33333333 cccc cccc 7 8 7 9
44444444 dddd dddd 2 2 2 2
55555555 eeee eeee 4 5 4 4
66666666 ffff ffff 1 1 1 1
77777777 gggg gggg 8 8 8 9
}

program Guia10Ejercicio1;

Type
    st20=string[20];

    TR=record
    Dni:integer;
    AyN:St20;
    notaTp1,par1,NotaTp2,par2:real;
    end;

 TArch=File of TR;

Procedure ResuelvePrimero(notaTp1,par1,NotaTp2,par2:real;var situacion:char; var promedio:real);
var
NF:Real;
begin
NF:= (0.30 * NotaTp1) + (0.10 * Par1) + (0.40 * NotaTp2) + (0.20 * par2);
if NF>=7 then
   situacion:='A'
else
     if  (NF>=4) and (NF<7) then
         situacion:='R'
     else
          situacion:='D';

promedio:=(NotaTp1+Par1+NotaTp2+par2)/4
end;

Procedure Resuelve(var alumnos:TArch);
var
R: TR;
situacion:char;
promedio:real;
regularizaron,desaprobados,cantidadDeAlumnos:byte;
{situacion:char;   }
begin
regularizaron:=0;
desaprobados:=0;
reset(alumnos);  {Abre el archivo}
{writeln('LOS ALUMNOS QUE ESTAN APROBADOS SON');      }
while not eof(alumnos) do { mientras que no se termine el archivo}
begin
read(alumnos,R); {lee la componente actual sobre la variable  }

ResuelvePrimero(r.notatp1,r.par1,r.notatp2,r.par2,situacion, promedio);

if situacion='A' then
   Writeln('DNI  ',R.Dni,'  NOMBRE  ',R.AyN,' Y su promedio es  ' ,promedio:8:2)

else
     if  situacion='R' then
         regularizaron:=regularizaron+1

     else
           desaprobados:=desaprobados+1;

cantidadDeAlumnos:=FILESIZE(alumnos);
end;

writeln('La cantidad de alumnos que regularizaron son ',regularizaron);
writeln('El % de desaprobados es  ',desaprobados*100/cantidadDeAlumnos:8:2);
close(alumnos);
end;


var
alumnos:TArch;
begin
Assign(Alumnos, 'Alumnos.dat');
Resuelve(alumnos);
readln;
end.
