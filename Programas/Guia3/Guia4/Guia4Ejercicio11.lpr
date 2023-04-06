{En un hospital se hace un control diario sobre los pacientes internados , registrados su temperatura cada hora. De cada paciente se tiene el nombre
('ZZZZ' fin de datos) y luego las 24 mediciones . Se pide ingresar dicha informacion para calcular y mostrar de cada paciente su nombre , su temperatura media y menima . Indicar ademas, el nombre del paciente
que registro la maxima temperatura promedio}

program Guia4Ejercicio11;

var
  i:byte;
  temperatura,min,max,max2,sumtemp,temperaturamedia,temperaturapromedio:Real;
  nombre,nombremax:string[10];
begin
  max2:=0;
  writeln('Ingrese el nombre del paciente');
  readln(nombre);
  while nombre<>'ZZZZZ' do
    begin
    sumtemp:=0;
    max:=0;
    min:=0; {0 por que las temperaturas van hacer positivas , se pone abajo del while por que es para cada pasiente}
    for i:=1 to 24 do { Las 24 mediciones diarias 1 por hora}
      begin
      writeln('Ingrese las 24 mediciones');
      readln(Temperatura);
      sumTemp:=sumtemp+temperatura;
      if temperatura<min then
         min:=temperatura;
      if temperatura>max then
         max:=temperatura;
      end;
    TemperaturaMedia:=sumtemp/24;
    writeln('Para el paciente ',nombre,' su temperatura minima es' ,min:8:2,' y su temperatura media',temperaturamedia:8:2);
    Temperaturapromedio:=sumtemp/24;
    if Temperaturapromedio>max2 then
       begin
       max2:=temperaturapromedio;
       nombremax:=nombre;
       end;
    writeln('Ingrese el nombre del paciente');
    readln(nombre);
    end;
writeln('El nombre del paciente que registro la maxima temperatura promedio',nombremax,'y dio una temperatura promedio de',temperaturapromedio:8:2);
readln;
end.

