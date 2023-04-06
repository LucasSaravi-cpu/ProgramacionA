{Ingresar un arreglo de M numeros enteros , generar dos arreglos Vpar y Vimp que contendran los numeros pares e impares respectivamente ,
ignorar los ceros . Informar la cantdad de ceros y mostrar ambos arreglos}

program Guia7Ejercicio5;

const
     max=100;

type
  TV=array[1..max] of byte;


procedure leevector(var v:tv ; var n:byte);
var
  i:byte;
begin
  writeln('Ingrese cantidad de numeros');
  readln(n);

  for i:=1 to n do
      begin
      writeln('ingrese los numeros del vector',i);
      readln(v[i]);
      end;

end;

procedure generarotro(v:tv;n:byte; var vpar,vimp:tv; var m,k,cont:byte);
var
  i:byte;
begin
m:=0;
k:=0;
cont:=0;
for i:=1 to n do
  begin
  if v[i]=0 then
     cont:=cont+1
  else
     if not odd(v[i]) then //pares
       begin
       m:=m+1;
       vpar[m]:=v[i];  //En la posicion m va a poner el valor de v[i] encontrado que en este caso es par
       end
     else
        begin
        k:=k+1;
        vimp[k]:=v[i]; //en la posicion k va a poner el valor v[i] encontrado que en este caso es impar
        end;
  end;
end;


procedure EscribeVector(v:tv;L:byte);
var
i:byte;
begin
for i:=1 to l do
   begin
   write(v[i],' ');
   end;
end;

var   //principal
  n,m,k,cont:byte;
  v,vpar,vimp:tv;


begin //principal
leevector(v,n);
generarotro(v,n,vpar,vimp,m,k,cont);

writeln('Vector par');
Escribevector(vpar,m);
writeln;
writeln('Vector impar');
EscribeVector(vimp,k);
writeln;

writeln('cantidad de 0 ', cont:5);
readln;

end.

