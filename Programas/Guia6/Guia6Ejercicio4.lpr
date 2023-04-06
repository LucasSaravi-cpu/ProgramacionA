{- A partir de un archivo de texto que contiene en cada línea dos reales que representan un punto en el
plano, Calcular para dichos puntos la distancia promedio, además cual registra la distancia máxima y la
mínima al centro, indicando a que cuadrante pertenece.
}


program Guia6Ejercicio4;

Uses
     varios;

var
y1,x1,min1,max1,min2,max2,min3,max3,min4,max4,d,SumDistancias:real ;
arch:text;
n,CantidadDePuntos:byte;
begin
CantidadDePuntos:=0;
sumDistancias:=0;
max1:=0;        {ya que no hay distancias negativas }
min1:=1000;
max2:=0;
min2:=1000;
max3:=0;
min3:=1000;
max4:=0;
min4:=1000;
assign(arch,'tp1.txt');
reset(arch);
while not eof(arch) do
    begin
    readln(arch,x1,y1); { Los leeo de archivo}
    n:=cuadrante(x1,y1);
    d:=sqrt(sqr(x1)+sqr(y1)) ;  {Distancia al centro ya que x2=0 e y2=0) IDEA: Poner x1 y x2 como constantes iguales a 0 y usar la distancia de unit }

    CantidadDePuntos:=CantidadDePuntos+1;    {Cuento la cantidad de puntos}
    SumDistancias:=SumDistancias+d;          {Sumo todas las distancias}

    case n of { Voy a tener una distancia maxima y una minima para cada uno de los cuadrantes }
    1:begin { Cuadrante 1}
      if d>max1 then
         max1:=d;
      if d<min1 then
         min1:=d;                                                        {El promedio general de hacer la distancia del primero con el segundo, }
      end;

    2:begin       {cuadtante 2}
      if d>max2 then
         max2:=d;
      if d<min2 then
         min2:=d;
      end;

    3:begin     {cuadrante 3}
      if d>max3 then
         max3:=d;
      if d<min3 then
         min3:=d;
      end;

    4:begin      {cuadrante 4}
      if d>max4 then
         max4:=d;
      if d<min4 then
         min4:=d;
      end;

    else
         writeln('Los puntos',x1:2:3 ,' y ',y1:2:3,' No pertenecen a ningun cuadrante');  {Puede pertenecer al origen(x1 y x2 son 0 ) o pueden estar sobre el eje x o el eje y }
   end;


end;

close(arch);

if (max1<>0) or (min1<>1000) then                 { significa que va a ver un punto solo por lo cual no hay maximo ni minimo}
  writeln('Para el cuadrante uno la distancia maxima es:',max1:2:3,' y la minima es ', min1:2:3)
else
  writeln('Para el cuadrante uno no existen distancias maximas o minimas');

if (max2<>0) or (min2<>1000) then
  writeln('Para el cuadrante dos la distancia maxima es:',max2:2:3,' y la minima es ',min2:2:3)
else
  writeln('Para el cuadrante dos no existen distancias maximas o minimas');

if (max3<>0) or (min3<>1000) then
   writeln('Para el cuadrante tres la distancia maxima es:',max3:2:3,' y la minima es ',min3:2:3)
else
  writeln('Para el cuadrante tres no existen distancias maximas o minimas');

if (max4<>0) or (min4<>1000) then
   writeln('Para el cuadrante cuatro la distancia maxima es ',max4:2:3,' y la minima es ',min4:2:3)
else
   writeln('Para el cuadrante cuatro no existen distancias maximas o minimas');

writeln('');
writeln('La distancia prmedio para los puntos utilizados es',SumDistancias/CantidadDePuntos:8:2);
readln;
end.



