{Modularizar la solucion del ejercicio 10 capitulo 4 implementado un procedimiento correctamente
parametrizado a partir del % de perdida de peso y el tiempo .
devuelva el imacto fisico y el nivel   }

program Guia5Ejercicio7;

procedure calculo(porpeso:real;tiempo:byte; var Ifisico:char;nivel:byte);
begin
if porpeso<=5 then
   Ifisico:='1'
else
   if porpeso<=9 then
      Ifisico:='m'
   else
      Ifisico:='a';

case tiempo of
1..10:nivel:=1;
11..20:nivel:=2;
else
nivel:=3;
end;

end;

var
  porce:real;
  m,tiempo,total,sumt,contD,contM,contL,contA,cont1,cont2,cont3:byte;
  f,nombre:char;
begin
contD:=0;
contM:=0;
contL:=0;
contA:=0;
cont1:=0;
cont2:=0;
cont3:=0;
sumt:=0;
writeln('Ingrese el nombre');
readln(nombre);
while nombre<>'***' do
  begin
  writeln('ingrese el % de peso perdido en la competencia');
  readln(porce);
  writeln('Ingrese el tiempo');
  readln(tiempo);
  calculo(porce,tiempo,f,m);

  case f of
  'l':contL:=contL+1;
  'm':begin
      contM:=contM+1;
      sumt:=sumt+tiempo;
      end;
  'a':begin
      contA:=contA+1;
      if porce>10 then
         contD:=contd+1;
      end;
  end;

  if m=1 then
     cont1:=cont1+1
  else
     if m=2 then
        cont2:=cont2+1
      else
        cont3:=cont3+1;

  writeln('ingrese el nuevo nombre');
  readln(nombre);
  end;
total:=contL+contA+contM;

if contM<>0 then
   writeln('Tiempo con IMC FISICO MODERADO', sumt/contM:8:2)
else
  writeln('No hay participantes con IMC FISICO MODERADO');

writeln('Nivel 1',cont1 , 'nivel 2',cont2,'nivel3',cont3);
writeln('% con IFL',(100*contL)/total:8:2);
writeln('Nivel 1',contD);
readln;
end.

