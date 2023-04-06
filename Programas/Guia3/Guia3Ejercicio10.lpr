{Ingrese tres letras y escribirlas ordenadas alfabeticamente.Resolver este problema de dos formas diferentes utilizando :Estructuras de decision
independientes y estructuras de decision anidadas}

program Guia3Ejercicio10;
var
l1,l2,l3:char;
begin
writeln('Ingrese primera letra');
readln(l1);
writeln('Ingrese segunda letra');
readln(l2);
writeln('Ingrese tercera letra');
readln(l3);
if (l1<l2) and (l2<l3) then
   writeln('Ordenado es:',l1,l2,l3)
else
   if (l2<l1) and (l1<l3) then
      writeln('Ordenado:',l2,l1,l3)
   else                                                       {anidado}
      if (l1<l3) and (l3<l2) then
         writeln('ordenado:',l1,l3,l2)
      else
         if (l2<l3) and (l3<l1) then
            writeln('ordenado es:',l2,l3,l1)
         else
             if (l3<l1) and (l1<l2) then
                writeln('ordenado es:',l3,l1,l2)
             else
                writeln('ordenado es:',l3,l2,l1);

{        if (l1<l2) and (l2<l3) then
           writeln('Ordenado es:',l1,l2,l3);
         if (l1<l2) and (l1<l3) then
           writeln('Ordenado:',l2,l1,l3) ;
         if (l1<l3) and (l3<l2) then                  secuencial
         writeln('ordenado:',l1,l3,l2);
         if (l2<l3) and (l3<l1) then
            writeln('ordenado es:',l2,l3,l1);
         if (l3<l1) and (l1<l2) then
            writeln('ordenado es:',l3,l1,l2)
         if (l3<l2) and (l2<l1) then
            writeln('ordenado es:',l3,l2,l1);      }
readln;
end.

