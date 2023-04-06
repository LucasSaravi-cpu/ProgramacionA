{Desarrollar un programa que lea un arreglo leneal vec de k elementos reales y una variable real z, y escriba
la cantidad de elementos iguales a Z o en caso de no existir ninguno el cartel "NO ESTA"}

program Guia7Ejercicio2;

const
     max=10;

TYPE
  tv=Array[1..max] of real;


procedure leevector(var v:tv; var k:byte);
var
  i:byte;
begin
  writeln('Ingrese la cantidad de k elementos reales');
  readln(k);

  for i:=1 to k do
      begin
      writeln('Ingrese los k reales');
      readln(v[i]);
      end;
end;

function calcula(v:tv;k:byte;z:real):Byte;
var
  cont,i:byte;
begin
cont:=0;
for i:=1 to k do
    begin
    if v[i]=z then
       cont:=cont+1;
    end;

calcula:=cont;
end;


var  {programa principa}
  v:tv;
  k,repes:byte;
  z:real;
begin {programa principal}
leevector(v,k);
writeln('ingrese la variable real z');
readln(z);
repes:=calcula(v,k,z);
if repes>0 then
   writeln('La cantidad de elementos iguales a z es ',repes:5)
else
  writeln('NO ESTA');
readln;
end.
