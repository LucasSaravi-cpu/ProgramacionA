{A partir de un archivo de texto que contiene en cada l¡nea tres reales formar un punto en el plano, tal que
X sea el valor m ximo e y el m¡nimo, determinar e informar la distancia al centro de cada punto, por fin de
proceso la distancia media en cada uno de los 4 cuadrantes}

Program Guia6Ejercicio5;

Uses
    varios;

var
a,b,c,x,y,dis,sum4,sum1,sum2,sum3:real;
cont4,cont1,cont2,cont3,n:byte;
arch:text;
begin
assign(arch,'num.txt');
reset(Arch);

cont1:=0;
cont2:=0;
cont3:=0;
cont4:=0;
sum1:=0;
sum2:=0;
sum3:=0;
sum4:=0;

while not eof(arch)  do
   begin
   readln(arch,a,b,c);
   ordenatres(a,b,c);
      x:=c; {valor maximo}
      y:=a; {valor minimo}
  dis:=sqrt(sqr(x)+sqr(y)); { calculo la distancia}
  n:=cuadrante(x,y);     { se calcula el cuadrante}

  case n of
  1: begin
     cont1:=cont1+1;
     sum1:=sum1+dis;
     end;
  2:begin
    cont2:=cont2+1;
    sum2:=sum2+dis;
    end;
  3:begin
    cont3:=cont3+1;
    sum3:=sum3+dis;
    end;
  4:begin
    cont4:=cont4+1;
    sum4:=sum4+dis;
    end;
  end;

  if (n<=4) and (n<>0) then
     Writeln('Para los puntos x=',x:3:2,' e y=',y:3:2,' la distancia al centro es ', dis:3:2,' y pertence al cuadrante ',n)
  else
      writeln('Los puntos x=',x:3:2 ,' e y=',y:3:2, 'no pertencen a ninguno de los 4 cuadrantes , sino que pertenecen al cuadrante',n);      { Si n=0 pertenece al origen, Si n=5 el punto esta sobre el eje x, si n=6 el punto esta sobre el eje y}
  end;
close(Arch);

if (cont1<>0) then
  Writeln('La distancia media para el cuadrante 1 es ' , (sum1/cont1):3:2)
else
  writeln('no existe distancia media para el cuadrante 1');

if (cont2<>0) then                                                                            {los cont deben ser diferentes de 0}
   writeln('La distancia media para el cuadrante 2 es ' , (sum2/cont2):3:2)
else
  writeln('no existe distancia media para el cuadrante 2');               {en el cuadrante 2  el maximo debe ser negativo y el minimo positivo cosa que no es posible}

if (cont3<>0) then
   writeln('La distancia media para el cuadrante 3 es ' , (sum3/cont3):3:2)
else
   writeln('no existe la distancia media para el cuadrante 3');

if (cont4<>0) then
   writeln('La distancia media para el cuadrante 4 es ' , (sum4/cont4):3:2)
else
   writeln('no existe la distancia media para el cuadrante 4');
readln;
end.

