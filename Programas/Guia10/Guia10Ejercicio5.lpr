{En el archivo NOTAS cada alumno de la universidad registra los resultados de examenes en diferentes materias
DNI ANU8        1 CAMPO DE SECUENCIA
COD MATERIA ANU3                    2 CAMPO DE SECUENCIA
NOTA

considerando que un alumno aprueba si obtiene promedio mayor a 5 y no mas de un examen desaprobado (nota4) emitir el siguiente listado

docuento : xxxxxxxxx
materia cantidad de examenes nota promedio aprobado(s/n)
xxxx       99                     99             x

aprobo 99 materias

documento : xxxxxxxxxx
materia cantidad de examenes nota promedio aprobado(s/n)
xxxx       99                     99             x
aprobo 99 materias


    }


program project1;

type
  st8=string[8];
  st3=string[3];
TRalumno=record
   dni:st8;
   codmateria:st3;
   nota:byte;

  end;

Taralumno = file of TRalumno;

procedure ListadoAlumnos(var arch:Taralumno);
var
alu:TRalumno;
aluAct:st8;
codmatAct:st3;
examenes,totalnota,desaprobado:byte;
promedio:real;
resultado:char;
begin

  Reset(arch);
  writeln('Resultados de los alumnos');
  writeln('materia' :10, 'cantidad de examenes' :40, 'nota promedio':40,'aprobado(S/N)':20);

  read(Arch,alu);


  while not Eof(arch) do

    begin

    aluAct:= alu.dni;



    while  (aluAct=alu.dni)  do
         begin
         codmatAct:=alu.codmateria;
         examenes:=0;
         totalnota:=0;
         desaprobado:=0;
         while (aluAct=alu.dni) and  (codmatAct=alu.codmateria) do
         begin

           examenes:=examenes+1;
           totalNota:=totalNota+alu.nota;

           if alu.nota<4 then
              desaprobado:=desaprobado+1;

              read(Arch,alu);

         end;

         promedio:=totalnota/examenes;

         if (promedio>5) and  (desaprobado<=1) then
            resultado:='S'
         else
            resultado:='N';


           writeln(codmatAct:10, examenes:40, promedio:40,Resultado:20);



    end;


end;
  close(Arch);
end;


var
  arch:Taralumno  ;
begin
  Assign(arch,'alumno.dat');
  ListadoAlumnos(arch);
  readln;
end.

