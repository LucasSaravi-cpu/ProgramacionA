{El ministerio de educación quiere evaluar el nivel de las escuelas de la provincia . Para ello en cada escuela se toma un examen
un examen a todos los alumnos del ciclo inicial (1 a 6 años ) .Se concidera STAFISFACTORIO el nivel de una escuela si en cada uno
de los nueve años resulto  aprobado el 70% o mas del alumnado . Se pide hacer un programa que lea desde un archivo los datos de una escuela , son pares : Año y nota
(desordenados) y determine si el resultado fue SATIFACTORIO)
ADEMAS liste el total de alumnos que rindieron de la siguiente forma

primer año 99
segundo año 99
...
total 999
}





Program Guia7IndiceConSignificado;

const
     anios=6;

type
  st10=String[10];
  TV1=array[1..anios] of word;
  TV2=array[1..anios] of st10;

const
     Cursos:TV2=('primero','segundo','tercer','cuarto','quinto','sexto');



Procedure IniciaVec(var v:TV1);
var
  i:byte;
begin
  for:=1 to anio do
     v[i]:=0;

end;

procedure LeeVectores(var total,aprob:tv1
var
anio,nota:byte;
arch:text;
begin
assign(arch,'');
reset(arch);
while not eof(Arch) do
   begin
   readln(arch,anio,nota);

   total[anio]:=total[anio]+1;

   if nota>=7 then
      aprob[anio]:=aprob[anio]+1;

   end;

close(arch);
end;

Function satisfactorio(total,aprob:TV1):boolean;  { determina si es satisfactorio}
var
i:byte;
begin
i:=1
while (i<=anios) and (aprob[i]/total[i]>=0.7 ) do
   begin
   i:=i+1;
   end;
satisfactorio:=i>anios;
end;


procedure listado(total:tv1);
var
sum:word;
i:byte;
begin
writeln('Anio    cantidad');
sum:=0;
for i:=1 to anios do
   begin
   sum:=sum+total[i];
   writeln(Cursos[i],total[i]);   //uso la constante de vector cursos
   end;
writeln('total',sum);
end;

//¿Que cambiaria si ademas se requiere el nombre del curso con mayor % de aprobados?

 Function aprobado(aprob,total:TV1):byte;
  var
  i:byte;
  por:real;
  begin
  por:=-9;
  for i:=1 to anios to
     if aprob[i]/total[i]*100>por then             {mayor % de aprobados un maximo}
        begin
        aprobado:=i;       //posicion del curso con %
        por:=aprob[i]/total[i]*100;

        end;
  end;



var       {programa principal}
  total.aprob:TV1;
  posicion:byte;

begin     {programa principa}
IniciaVec(total);
iniciavec(aprob);
LeeVectores(total,aprob);

if satisfactorio(total,aprob) then
   writeln('NIVEL SATISFACTORIO')
else
   writeln('NIVEL NO SATISFACTORIO');
posicion:=aprobado(aprb,total);
writeln('El nombre del cruso con mayor % de aprobados es' , curso[posicion];
listado(total);
readln;
end.

