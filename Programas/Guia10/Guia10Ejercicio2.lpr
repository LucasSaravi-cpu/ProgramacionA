{Enfrentamiento 2 archivos con el mismo orden (clave primaria o secundaria ) enfrentamiento 1 a 1 ( ambos archivos
clave primaria) resultado es un archivo o listado

- Dado un archivo CREDITOS que contiene información sobre créditos de clientes, cuyo
diseño es:
# Cod Cliente {ANU5, campo de secuencia, clave primaria}
# Cuotas Totales
# Cuotas Pagadas
Y otro archivo PAGOS con información de los clientes que han pagado una cuota el mes en
curso, con el siguiente diseño:
# Cod Cliente {ANU5, campo de secuencia, clave primaria}
Se pide enfrentar ambos archivos para obtener un tercero con los créditos actualizados (cuotas
pagadas), en caso que hayan pagado todas las cuotas eliminarlos del nuevo archivo.
Por fin de proceso informar la cantidad de clientes que completaron el pago del crédito y la
cantidad que no pagaron la cuota el mes en curso.

CREDITOS
AAAAA 5 4
BBBBB 8 1
DDDDD 4 3
FFFFF 8 2
EEEEE 7 5

PAGOS
AAAAA
DDDDD
FFFFF
EEEEE

TEMP
BBBBB 8 1
FFFFF 8 3
EEEEE 7 6

}

program Guia10Ejercicio2;
type
   st5=string[5];
   tr=record
      codigo:st5;
      ctotales:byte;
      cpagadas:byte;
   end;

   tar=file of tr;
   tarb=file of st5;


Procedure Modificaciones(var creditos:tar; var pagos:tarb);
var
temp:tar;
RC:tr;
RP:st5;
contnp,contcp:byte;
begin

contnp:=0;
contcp:=0;
assign(temp,'temp.dat');
rewrite(temp); {se abre el archivo para gravar los datos nuevos}
reset(creditos);
reset(pagos);
read(creditos,RC);
read(pagos,RP);

while not eof(creditos) or not eof(pagos) do
     if RC.codigo<RP then
        begin
        contnp:=contnp+1;
        write(temp,RC);
        read(creditos,RC);
        end
     else
        if RC.codigo=RP then
           begin

           RC.cpagadas:=RC.cpagadas+1;

           if RC.cpagadas=RC.ctotales then
              contcp:=contcp+1       //PAGO DEL CREDITO COMPLETADO
           else
              write(temp,RC);



              read(creditos,RC);
              read(pagos,RP);
           end
         else
            read(pagos,RP);

write(temp,RC);   //Se graba en el nuevo archivo , el centinela
close(creditos);
close(pagos);
close(temp);

writeln('La cantidad de personas que completaron el credito son ',contcp ,' y la cantidad que no paga este mes ' ,contnp);
end;

procedure lista(var te:tar);
var
r:tr;
begin
reset(te);
while not eof(te) do
     begin
     read(te,r);
     with r do
     writeln(codigo:6,ctotales:6,'  ',cpagadas);
     end;
close(te);
end;

var               {programa princiapl}
creditos,te:tar;
pagos:tarb;


begin{programa principal}
assign(creditos,'creditos.dat');
assign(pagos,'pagos.dat');
assign(te,'temp.dat');
modificaciones(creditos,pagos);
lista(te);
readln;

end.


