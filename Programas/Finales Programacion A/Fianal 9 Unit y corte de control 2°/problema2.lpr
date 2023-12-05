
{Una obra social cuenta con un archivo que contiene las recetas medicas realizadas a sus afiliados . 

codigo especialidad ( string[3] 1° campo de secuencia clave secundaria)
matricula del medico ( entero 2° campo de secuencia clave secuendaria)
importe

Listado

Especialidad AAA

medico   cant recetas importePromedio
1111       9999           9999
2222       9999            9999
3333        999            9999

Total espec AAA : 9998 RECETAS POR UN TOTAL DE 9999

Especialidad BBB

--

ESPECIALIDAD MENOR GASTO AAA CON 9999
MEDICO CON MAYOR CANTIDAD DE RECETAS EMITIDAS 9999 CON 99 RECETAS






}

program problema2;

type
  st3=string[3];
  tr=record
   codEspecialista:St3;
   matricula:word;
   importe:real;



  end;






  Tar=File of TR;

Procedure Resuelve(var vector:Tar);
var
r:TR;

cantidadrecetas,recetas:word;
promedio,totalimporte,totalporespecialidad,min:real;
maxMedico,max:word;
minespecialidad:st3;
vectorAct:st3; 
vectoract2:word; 

begin

Reset(vector);
read(vector,R);
max:=0;
recetasmax:=0;
min:=999;

while not eof(vector) do 
begin




vectorAct:=r.codespecialista  ;

writeln('Especialidad  ',vectorAct);
writeln('medico':10,'cantidadrecetas':10,'importeproemdio':10);
recetas:=0;
totalporespecialidad:=0;
while  (vectorAct=r.codespecialista)  do
          begin


         vectorAct2:=r.matricula;

          cantidadrecetas:=0;
          promedio:=0;
          totalimporte:=0;
          while  (vectorAct=r.codespecialista) and (vectorAct2=r.matricula)   do
                    begin

                     cantidadrecetas:=cantidadrecetas+1;
                     TotalImporte:=TotalImporte+r.importe;
                     recetas:=recetas+1;
                     totalporespecialidad:=totalporespecialidad+r.importe;
                      read(vector,R);

                    end;

                  if (cantidadrecetas<>0) then
                     promedio:=totalimporte/cantidadrecetas;

                  writeln('Medico':10,vectorAct2 :10,'cantrecetas',cantidadrecetas,'importe promedio' , promedio:10);

                if cantidadrecetas>max then
                   begin
                   max:=cantidadrecetas;
                   maxMedico:=vectorAct2;
                   
                   end;



          end;


           if (totalporespecialidad<min) then
              begin
              min:=totalporespecialidad;
               minespecialidad:=vectorAct;
                 end;

writeln(vectorAct,':',recetas,'por un total de ' ,totalporespecialidad);

end;

writeln('el medico con mayor cantidad de recetas emitidas : ' , maxmedico , 'y su recetas son',max);
writeln(' especialidad con menor gastos es : ' , minespecialidad, 'con ' ,min);

close(vector);
end;


var
vector:Tar;
begin
Assign(vector, 'obrasocial.dat');
resuelve(vector);

readln;
end.


