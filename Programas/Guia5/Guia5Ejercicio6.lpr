{Leer de cada linea de un archivo A,B, y C cooeficientes de un polinomio de 2do grado se sabe que todos tienen raices reales. Calcular y mostrar
las raices de cada uno de ellos e informar el % de polinomios con raiz doble (x1=x2) . Implementar y utilizar el procedimiento Raices que reciba los coeficientes A,B y C y devuelva las raices x1 y x2}


program Guia5Ejercicio6;

procedure   polinomio(a,b,c:real ; var x1,x2:real);
begin

  x1:=(-b+sqrt(b*b-4*a*c))/2*a;
  x2:=(-b-sqrt(b*b-4*a*c))/2*a;
end;

var
  a,b,c,z1,z2:real;
  cont,cont2:byte;
  arch:text;
begin
  cont:=0;
  cont2:=0;
  assign(Arch,'Guia5Ejercicio6.txt');
  reset(arch);
  while not eof(arch) do
     begin
     readln(arch,a,b,c);
     polinomio(a,b,c,z1,z2);
     cont:=cont+1;
     writeln('Las raices son x1:',z1:8:2,'  x2:',z2:0:2);
     if z1=z2 then
        cont2:=cont2+1;
     end;
close(arch);

writeln('% de polinimios con raiz doble es ' , (cont2*100)/cont:8:2);

readln;
end.

