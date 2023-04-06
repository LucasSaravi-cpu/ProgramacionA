{Una empresa transportista organiza sus envios agrupandolos por codigo de destino y enviando un camion a cada uno.La informacion que tiene es

codigo de destino (no hay dos codigos iguales y *** fin de datos)
capacidad de carga del camion en toneladas
cantidad de paquetes a transportar a este destino y el peso de cada uno en kilos

No se sabe si todos los paquetes especificados pueden ser transportados por el camion al correspondiente destino,
teniendo en cuenta que no peude sobepasarse la capacidad del camion y que los paquetes no se pueden partir , se pide:

a)Ingresar los datos segun la descripcion anterior
b) informar para cada uno de los destinos, cuantos kilos se cargaron en el camion
c)total de kilos que no pudieron ser transportados a los destinos correspondientes
d)informar el codigo de destino cuyo camion registro la menor capacidad ociosa
}

program Guia4Ejercicio13;
var
  codigo,codigomenor:string[3];
  cantidad:word;
  peso,sumpeso,capacidad,capacidadociosa,min,sumNotransportados:real;
  i:byte;
begin
  writeln('Ingrese el nombre del codigo');
  readln(codigo);
  min:=999999;

  while codigo<>'***'  do
     begin
     writeln('ingrese la capacidad en toneladas');
     readln(capacidad);
     capacidad:=capacidad*1000; { la capacidad esta en toneladas, se pasa a kilos}
     writeln('ingrse la cantidad de paquetes');
     readln(cantidad);
     sumpeso:=0;
     SumNotransportados:=0;
     for i:=1 to cantidad do
        begin
        writeln('Ingrese el peso en kilos de cada paquete');
        readln(peso);

        if capacidad>=(sumpeso+peso) then
           sumpeso:=sumpeso+peso
        else
           SumNotransportados:=SumNotransportados+peso;
        end;

        writeln('Transportado a el destino ',codigo,' fueron ', sumpeso:8:2,' kilos',' No pudieron ser transportados ',SumNotransportados:8:2,' kios');

        capacidadociosa:=100-((sumpeso/capacidad)*100); { porcentaje que no se utilizo del camion}


     if capacidadociosa<min then
         begin
         min:=capacidadociosa;
         codigomenor:=codigo;
         end;

     writeln('Ingrese el nombre del codigo');
     readln(codigo);
   end;
writeln('el codigo de destino cuyo camion registro la menor capacidad ociosa es ,',codigomenor,' y registro una capacidad ociosa de ', min:8:2);
readln;
end.

