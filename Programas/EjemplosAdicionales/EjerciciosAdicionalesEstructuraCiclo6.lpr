{Para una estadistica hospitalaria, se han rescabado para cada una de las salas , los siguientes datos

nombre de la sala ( cadena de 3 caracteres)
cantidad de pacientes

y para cada una de ellos

cantidad de dias a la fecha
estado ( c-critico , E -estable , R-recuperado)

Se pide ingresar dicha informacion con el fin de calcular e informar

a)para cada sala el promedio de dias de internacion  de los pacientes
en estado critico
b)Nombres de las salas en las cuales todos los pacientes esten internados hace mas de 7 dias
c) cantidad de salas que tieen solo pacientes estables}



program EjerciciosAdicionalesEstructuraCiclo6;

var
  sala:string[3];
  salasestables,cont,i,estables,criticos,pacientes,dias,sumDias:byte;
  estado:char;
  arch:text;
begin
assign(arch,'EjerciciosAdicionalesEstructuraCiclo6.txt');
reset(arch);

salasestables:=0;
while not eof(Arch) do
 begin
 readln(arch,sala,pacientes);
 sumDias:=0;
 criticos:=0;
 estables:=0;
 cont:=0;
 for i:=1 to pacientes do
    begin
    readln(arch,dias,estado,estado);
    estado:=upcase(estado);

    if estado='C' then
       begin
       sumDias:=sumDias+dias;
       criticos:=criticos+1;
       end;

    if dias>=7 then
       cont:=cont+1;
    if estado='E' then
       estables:=estables+1;


    end;

 if (estables=pacientes) then
    SalasEstables:=SalasEstables+1;


 if sumDias<>0 then
    writeln('El promedio en la sala',sala,' es ',sumdias/criticos:8:2)
 else
    writeln('No hay pacientes en estado critico en la sala ', sala);

 if (pacientes=cont) then
    writeln('La sala',sala, 'tiene todos pacientes internados hace mas de 7 dias');
 end;
writeln('Las salas estables son ',salasestables);
close(Arch);
readln;
end.

