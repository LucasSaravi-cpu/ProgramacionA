{A partir de una archivo de texto que contiene en cada línea seis valores reales desordenados (positivos,
negativos o cero).
Se pide leer cada línea y armar dos puntos en el plano de la siguiente forma:
 Los tres primeros valores forman x1 con el mínimo e y1 con el máximo (descartar el valor medio)
 El 4to , 5to y 6to forman x2 con el mínimo e y2 con el máximo (descartar el valor medio)
Calcular la distancia mínima entre los puntos (x1,y1) y (x2,y2) solo para los puntos que pertenecen al mismo
cuadrante y la distancia máxima solo para los puntos que pertenezcan a cuadrantes diferentes .
Indicar si alguno de los dos resultados no existe.}

program Guia6Ejercicio1;
uses
    varios;
var
max,min,a,b,c,d,e,f,x1,x2,y1,y2,dis:real;
n1,n2:byte;
arch:text;

begin

assign(arch,'.txt');
reset(Arch);
max:=0;
min:=1000;
while not eof(Arch) do
      begin
      readln(arch,a,b,c,d,e,f);
      ordenatres(a,b,c);
      x1:=a;
      y1:=c;
      ordenatres(d,e,f);
      x2:=d;
      y2:=f;
      n1:=cuadrante(x1,y1);
      n2:=cuadrante(x2,y2);
      dis:= sqrt( sqr( X1-X2) + sqr(Y1-Y2) );
      if (n1=0) or (n2=0) then
         writeln('El resultado no existe')
      else
      if n1=n2 then
         if dis<min then
            min:=dis;
      if n1<>n2 then
         if dis>max then
            max:=dis;

      end;

writeln('La distancia minima es ' ,min:2:3);
writeln('la distancia maxima es ' ,max:2:3);

close(arch);
readln;
end.

