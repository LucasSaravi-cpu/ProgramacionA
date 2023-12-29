{Una empresa de turismo registra las reservas de los pasajeros para sus tours en un archivo binario reservas . Al momento de la partida se registran en presentes
tiene la misma estructura que reservas los pasajeros que estan presentes para iniciar el viaje ambos archivos tienen el siguiente registro

dni pasajero campo de secuencia clave primaria cadena de 8
cod destino entero 1..40
edad    entero positivo

solamente pueden viaar los pasajeros que tengan reservas previas , se pide generar el archibo binario viajeros misma estrctura que reservas con los pasajeros que iniciaran
el viaje . Mostrar el archivo generado . previamente a partir del proceso de generacion emitir un listado con

cantidad de pasajeros
con reservas que no se presentaron
que se presentaron sin reservas previas
edad proedio de los viajeros
destino con mayor cantidad de viajeros}


program problema2;
type
   st8=string[8];

   tr=record

   dni:st8;
   destino:byte;
   edad:byte;
   end;

   tar=file of tr;
   tarb=file of tr;






var
// archibo a es presentes y el archibo b es reservas
 archivoa:tar;
 archivob:tarb;

Procedure Modificaciones(var archivoa:tar; var archivob:tarb );
var
temp:tar;
a:tr;
b:tr;
pasajeros.nosepresentaron,sepresentaronsinreservas:byte;
edadprom:byte;
max,maxdestino:byte;

begin
assign(temp,'temp.dat');
rewrite(temp); 
reset(archivoa);
reset(archivob);
read(archivoa,a);
read(archivob,b);
edadprom:=0;
pasajeros :=0;
nosepresentaron:=0;
sepresentaronsinreservas:=0;
max:=0;
while not eof(archivoa) or not eof(archivob) do
   begin
     if a.dni<b.dni then  //Esta en presentes pero no en reservas
        begin
        sepresentaronsinreservas:=sepresentaronsinreservas+1;

        read(archivoa,a);  //bajo el archibo presentes
        end
     else
        if a.dni= b.dni then    // viajan por que estan en reservas y estan presentes
           begin                //solo viajan los que tiene reservas previas

              edadprom:=edadprom+a.edad;
              pasajeros:=pasajeros+1;

              write(temp,a);   //se graba el archibo , seria el archibo de viajeros
              read(archivob,b);
              read(archivoa,a);
           end
         else
             begin
             read(archivob,b);   //bajo el archibo reervas por que no esta presente
             nosepresentaron:=nosepresentaron+1;
             end;

    { if max>pasajerospordestino then
        begin
        max:=pasajerospordestino;
        maxdestino:=a.destino;
        end; }




   end;

writeln('cantidad de pasajeros');
writeln('con reservas que no se presentaron ',nosepresentaron  );
writeln('que se presentaron sin reservas previas ',sepresentaronsinreservas);

if pasajeros<> 0 then
   writeln('edad promedo de los viajeros', edadprom/pasajeros:8:2)
else
  writeln(' no existe una edad promedio de los viajeros , ya que no hay viajeros');


 write(temp,a);     //Se graba el sentinela
close(archivoa);
close(archivob);
close(temp);
end;

begin{programa principal}
assign(archivoa,'archivoa.dat');    // archivo presentes
assign(archivob,'archivob.dat');    //archivo reservas
modificaciones(archivoa,archivob);
readln;
end.

