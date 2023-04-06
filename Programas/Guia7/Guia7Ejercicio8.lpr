{- Se tiene un archivo de texto DATOS.TXT con datos de alumnos de la universidad, en cada l¡nea
del archivo se tiene: DNI (cadena de 8), Corte (a¤o de ingreso) y Promedio.
Desarrollar un programa que lea la informaci¢n indicada sobre 3 arreglos. A partir de ellos, y
mediante un men£ que permita la repetici¢n de las opciones con diferentes valores dados
(ingresados por teclado), calcule e informe:
a) Para un par de a¤os dados A1 y A2, promedio general de los alumnos pertenecientes a las
cortes de los a¤os A1.. A2.
b) Para una corte dada, el minimo promedio y su DNI (suponer £nico)
c) Para un DNI dado mostrar los datos del alumno (indicar si no se encontr¢) }


program Guia7Ejercicio8;
type
st8=string[8];
tvdni=array[1..50] of st8;
tvcorte=array[1..50] of word;
tvprom=array[1..50] of real;

var{programa principal}
vcor:tvcorte;
vpro:tvprom;
vdni:tvdni;
n:byte;
op:char;
dnib:st8;


procedure leevector(var vdni:tvdni; var vcor:tvcorte; var vpro:tvprom; var n:byte);
var
arch:text;
begin
assign(arch,'Guia7Ejercicio8.txt');
reset(arch);
while not eof (Arch) do
      begin
      n:=n+1;
      readln(arch,vdni[n],vcor[n],vpro[n]);
      end;
close(Arch);
end;

procedure menu(var op:char);
begin
writeln('menu de operaciones');
writeln('1. promedio de alumno por a¤o');
writeln('2.minimo prom y dni');
writeln('3. datos de alumno');
writeln('4. fin de operacion');

repeat
writeln('ingrese su operacion');
readln(op);

until ('1'<=op) and (op<='4');
end;

procedure opc1 ( var vcor:tvcorte; var vpro:tvprom; var n:byte);
var
a1,a2:word;
i,c:byte;
sum,prom:real;

begin
c:=0;
sum:=0;
writeln('ingrese el par de a¤os para mostrar los promedios');
readln(a1,a2);
for i:=1 to n do
   if (a1<=vcor[i] ) and (vcor[i]<a2) then
      begin
      c:=c+1;
      sum:=sum+vpro[i];
      end;
if c>0 then
  begin
  prom:=sum/c;
  writeln('promedio general:' , prom:3:2);
  end
else
  writeln('no hay datos de alumnos en este periodo');
  readln;
  end;

function busca(vdni:tvdni;n:byte;dnib:st8):byte;    //Busca si el DNI ingresado esta dentro del vector y en que parte del vecto esta
var
i:Byte;
begin
i:=1;
while (i<=n) and (dnib<>vdni[i]) do
     i:=i+1;
if i<=n then
  busca:=1
else
  busca:=0;
end;

procedure opc2(var vdni:tvdni;var vcor:tvcorte; var vpro:tvprom; var n:byte);
var
busq:word;
dnimin:st8;
i:byte;
pmin:real;
begin
pmin:=9999;
writeln('ingrese el a¤o a buscar');
readln(busq);
for i:=1 to n do
    if vcor[i]=busq then
       if vpro[i]< pmin then
          begin
          pmin:=vpro[i];
          dnimin:=vdni[i];
          end;
if pmin<9999 then
  writeln('dni  ', dnimin,' promedio ' ,pmin:3:2)
else
  writeln('no hay datos en este periodo');
readln;
end;

procedure opc3(var vdni:tvdni; var vcor:Tvcorte; var vpro:tvprom; var n:byte);
var
dnib:st8;
i:byte;
begin
writeln('ingrese el dni del alumno');           //Se tiene que ingresar el espacio ademas del dni
readln(dnib);
i:=busca(vdni,n,dnib);
if i<>0 then
   writeln('Su dni es  ',vdni[i],'  el año ',vcor[i],' y su promedio ',vpro[i]:8:2)
else
  writeln('no se encuentra');
end;

begin{programa principal}

leevector(vdni,vcor,vpro,n);
repeat
menu(op);
case OP of
'1':opc1(vcor,vpro,n);
'2':opc2(vdni,vcor,vpro,n);
'3':opc3(vdni,vcor,vpro,n);
end;
until op='4';
end.

