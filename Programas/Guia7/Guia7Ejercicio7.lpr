{Sean NOMBRE y SEXO dos arreglos de N elementos que contienen el nombre(en mayusculas) y el respectivo sexo "F" y "M"
Escribir un procedimiento que genere dos nuevos vectores , llamados varon y mujer de tal forma que uno contenga el nombre de todos los varones y el otro el de las mujeres
mostrar ambos arreglos}




program Guia7Ejercicio7;

type
   st8=string[8];

   TVnom=array[1..50] of st8;
   TVsex=array[1..50] of char;

Procedure Leevector (var M:TVnom; var S:TVsex; var n:byte);
var
arch:text;
begin
assign(Arch,'Guia7Ejercicio7.txt');
reset(arch);

n:=0;
while not eof(arch) do
   begin
   n:=n+1;
   readln(arch,M[n],S[n]);
   end;
close(Arch);

end;


Procedure GeneraOtro(m:TVnom;S:TVsex;N:byte; var varones,mujeres:TVnom; var l,k:byte);
var
i:byte;
begin
l:=0;
k:=0;

for i:=1 to n do
   if S[i]='F' then
      begin
      L:=l+1;
      mujeres[L]:=M[i];
      end
  else
      begin
      K:=K+1;
      varones[k]:=M[i];
      end;
end;

Procedure EscribeVector(V:TVnom;A:byte);
var
i:byte;
begin
for i:=1 to a do
    writeln(V[i]);
end;


var //principal
n,l,k:byte;
M,varones,mujeres:TVnom;
s:TVsex;
begin //principal
Leevector (M,S,n);
GeneraOtro(m,S,N,varones,mujeres,l,k);

writeln('Vector mujeres');
EscribeVector(mujeres,l);
writeln;
writeln('Vector varones');
EscribeVector(varones,k);
readln;
end.

