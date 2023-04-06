{Un consorcio registra las deudas de N propietarios por cada uno:
apellido
cantidad de expresas adeudadas
monto adeudado

Leer dichos datos en tres arreglos paralelos , luego para los propietarios que tengan mas de "M" expensas adeudadas o que adeuden mas de $x
escribir un listado con el siguiente formato:

apellidos cantidad deuda
xxxxxxx   99        999999

M y x ingresan por teclado}

program Guia7Ejercicio6;
type
  st8=string[8];

  TVape=array[1..50] of st8;
  TVcant=array[1..50] of byte;
  TVdeu=array[1..50] of real;


Procedure LeeParalelos(var Vape:TVape; var Vdeu:TVdeu; var Vcant:TVcant; var n:byte);
var
arch:text;
begin
assign(Arch,'Guia7Ejercicio6.txt');
reset(arch);

n:=0;
while not eof(arch) do
   begin
   n:=n+1;
   readln(arch,Vape[n],Vcant[n],Vdeu[n]);
   end;
close(Arch);

end;

Procedure Listado(Vape:TVape; Vdeu:TVdeu; Vcant:TVcant; n:byte);
var
i:byte;
x:real;
m:byte;
begin
writeln('Escriba expensas adeudadas');
readln(m);
writeln('Escriba la plata que adeudan');
readln(x);

for i:=1 to n do
   begin
   if (Vdeu[i]>x) or (Vcant[i]>m) then
      writeln(Vape[i]:15,'   ' , vcant[i]:6 ,'  ', Vdeu[i]:8:2);
   end;

end;

var//principal
Vape:TVape;
Vdeu:Tvdeu;
Vcant:TVcant;
n:byte;
begin //principal
Leeparalelos(Vape,Vdeu,Vcant,n);
Listado(Vape,Vdeu,Vcant,n);
readln;
end.

