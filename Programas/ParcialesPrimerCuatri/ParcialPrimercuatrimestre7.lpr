program ParcialPrimercuatrimestre7;
function aprueba(promedio:Real;aplazo:byte):byte;
begin

if (promedio>=4) and (aplazo=0) then
   aprueba:=1
else
   if (promedio>=6) and (aplazo=1) then
    aprueba:=2
  else
      if (promedio>=8) and (aplazo>1) then
        aprueba:=3;

end;

var
nombre,maxnombre:string[5];
cont2,sum,max,acum,aplazo,notas,i,n,apro,cont:byte;
porce,promedio:real;
arch:text;
begin

assign(arch,'C:\FPC\2.6.4\bin\i386-win32\notas pascal\notas.txt');

reset(Arch);
max:=0;
cont:=0;
cont2:=0;

while not eof(arch) do
     begin
     acum:=0;
     cont2:=cont2+1;
     aplazo:=0;
     sum:=0;
     read(arch,nombre,n);
     for i:=1 to n do
         begin
          read(arch,notas);
         acum:=acum+notas;
         if notas<4 then
            begin
            aplazo:=aplazo+1;
            sum:=sum+1;
            end
         end;
         readln(Arch);
if sum>max then
   maxnombre:=nombre;
   max:=sum;

promedio:=acum/n;

apro:=aprueba(promedio,aplazo);
if apro<=3 then
   begin
   cont:=cont+1;
   writeln(nombre,'aprueba','condicion',apro);
   end
else
   writeln(nombre,'desaprobado');

end;

porce:=(cont/cont2)*100;

writeln('el porcentaje de alumnos aprobados' , (cont/cont2*100):2:1);
writeln('el alumno con mayor cantidad de aplazos es',maxnombre,' y tiene ',max,'aplazos');
readln;
end.

