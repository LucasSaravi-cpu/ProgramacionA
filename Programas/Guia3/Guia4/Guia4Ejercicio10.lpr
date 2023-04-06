{Al finalizar untriatlon se registra de cada participante el nombre(*** fin de datos), el tiempo y el % de peso que perdio en la competencia.
Se pide  desarrollar un programa que lea de teclado los datos mencionados , obtenga e informe

a)La cantidad de participantes en cada nivel
b)El porcentaje de participantes con Impacto fisico leve
c)Tiempo promedio de participantes con impacto fisico moderado
d) Cantidad de participantes de nivel 1 con impacto fisico alto

%               Impacto fisico
hasta 5         L leve
entre 6 y 9     M moderado
mas de 10       A alto


Tiempo                nivel
hasta 10hs            1
entre 11 y 20 hs      2
mas de 20 hs          3
}

program Guia4Ejercicio10;
var
  nombre:string[10];
  total,contl,conta,contm,cont1,cont2,cont3,cont,tiempo,sumt,contb:byte;
  porce:Real;
begin
cont1:=0;
cont2:=0;
cont3:=0;
contm:=0;
conta:=0;
contb:=0;
contl:=0;
sumt:=0;
writeln('Ingrrse el nombre de los participantes');
readln(nombre);
while nombre<>'**' do  { Cuando pongo comillas el ciclo se cierra}
  begin
  writeln('Ingrese el % de peso perdido');
  readln(porce);
  writeln('Ingrese el tiempo');
  readln(tiempo);
  if porce<=5 then
     contl:=Contl+1  {Impacto fisico Leve}
  else
     if porce<=9 then
        begin
        contM:=contM+1;  {Impacto fisico moderado}
        sumt:=Sumt+tiempo; { acumula el tiempo}
        end
    else
        contA:=ContA+1; {Impacto fisico Alto}


  case tiempo of

  1..10: begin
         cont1:=Cont1+1;    {nivel 1}
         if porce>10 then
            contB:=contb+1;
         end;
  11..20: cont2:=cont2+1  { nivel 2}

  else
       cont3:=cont3+1; {nivel 3}
  end;                          {end del case}
  writeln('Ingrrse el nombre de los participantes');
  readln(nombre);
  end;

total:=contl+contm+contA;

If contM<>0 then
   writeln('El tiempo promedio con imp fisico moderado es',sumt/contm:8:2)
else
   writeln('No hay participantes con Imp fisico moderado');

writeln('La cantiad de participantes en cada nivel es : nivel 1: ',cont1,'nivel 2: ',cont2,'nivel3: ',cont3);
writeln('Porsentaje promedio de participantes con imp fisico leve ',100*cont1/total:8:2);
writeln('cantidad de participantes de nivel 1 con impf fisico alto ',contb);

readln;
end.

