{Ingresar K caracteres(letras) y almacenar en un arreglo y luego
a) contar e informar cuantos elementos son consonantes , cuantos son letras mayusculas y cuantas letras minusculas
b)remplazar por '*' las volcales . Mostrar el vector modificado
}

program Guia7Ejercicio1;

const
     max=20;
TYPE
  tv=array[1..max] of char;

procedure  leevector(var v:tv;var k:byte);
var
  i:byte;
begin
writeln('Ingresa la cantidad de "k" letras');
readln(k);

for i:=1 to k do
    begin
    writeln('Ingrese el elemento',i);
    readln(V[i]);
    end;
end;

procedure calcula(v:tv;k:byte; var consonantes,minusculas,mayusculas:byte);
var
  i:byte;
begin
mayusculas:=0;
minusculas:=0;
consonantes:=0;

for i:=1 to k do
    begin
    if v[i] in ['A'..'Z'] then
       mayusculas:=mayusculas+1
   else
       minusculas:=minusculas+1;

    if not (upcase(V[i]) in ['A','E','I','O','U'] ) then  {up case convierte las mayusculas en minusculas}
       consonantes:=consonantes+1;
    end;
end;

procedure escvector(v:tv;L:byte);
var
  i:byte;
begin
for i:=1 to L do
    if upcase(v[i]) in ['A','E','I','O','U']  then
       begin
       v[i]:='*';
       write(v[i]:5);
       end
    else
        write(v[i]:5);

end;

var
  k:byte;
  consonantes,minusculas,mayusculas:byte;
  V:tv;
begin
Leevector(v,k);
calcula(v,k,consonantes,minusculas,mayusculas);
writeln('mayusculas ',mayusculas:5,' minusculas ',minusculas:5, 'consonantes ' ,consonantes:5);
escvector(v,k);
readln;
end.

