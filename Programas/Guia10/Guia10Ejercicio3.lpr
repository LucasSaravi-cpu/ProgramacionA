{Una empresa de servicios médicos, almacena en un archivo AFILIADOS los siguientes
datos:
# DNI { campo de secuencia, clave primaria}
# Plan (1..4)
# Fecha de alta (aaaa/mm/dd)
En otro archivo NOVEDADES se han grabado solicitudes de ingreso o de cambio de plan (solo
el próximo superior o inferior) con el mismo diseño:
# DNI { campo de secuencia, clave primaria}
# Plan (1..4)
# Fecha de alta o cambio (aaaa/mm/dd)

Se pide enfrentar ambos archivos para actualizar AFILIADOS en un nuevo archivo, considerar
que los cambios de plan incorrectos no serán tenidos en cuenta y se generará un listado de los
mismos.
Indicar al final del proceso la cantidad de afiliados que no cambiaron el plan (ya sea que no lo
solicitaron o que no se pudo realizar)

AFILIADOS
11111111 2 3/5/1995
33333333 3 1/8/1998
66666666 4 2/8/1999
77777777 1 1/5/2000
99999999 2 2/5/2021

NOVEDADES
33333333 2 5//5/2021
66666666 1 10/5/2021
77777777 2 15/6/2021
88888888 2 5/6/2021
99999999 1 5/9/2021

TEMP
11111111 2 3/5/1995
33333333 2 5//5/2021
77777777 2 15/6/2021
88888888 2 5/6/2021
99999999 1 5/9/2021

}
program Guia10Ejercicio3;
type
   st5=string[8];
   tr=record
      codigo:st5;
      plan:byte;
      dia,mes:byte;
      anio:Word;
   end;

   tar=file of tr;


Procedure Modificaciones(var afiliados,novedades:tar);
var
temp:tar;
Afi,Nov:tr;
cont:byte;
begin
cont:=0;
assign(temp,'temp.dat');
rewrite(temp); {se abre el archivo para gravar los datos nuevos}
reset(afiliados);
reset(novedades);
read(afiliados,afi);
read(novedades,nov);

while not eof(afiliados) or not eof(novedades) do
     if Afi.codigo<Nov.codigo then
        begin
        write(temp,Afi);            {no se producen modificaciones}
        read(afiliados,Afi);
        end
     else
        if Afi.codigo=Nov.codigo then
           begin

           if (nov.plan=Afi.plan+1)  or  (nov.plan=Afi.plan-1) then
              write(temp,Nov)
           else
              begin
              cont:=cont+1;      // Es un error y lo tengo que contar
              writeln('PLAN INCORRECTO',nov.codigo:9,nov.plan:6,'  ',nov.dia,'/',nov.mes,'/',nov.anio);
              end;


              read(novedades,nov);
              read(afiliados,afi);
           end
         else
            begin
            write(temp,nov);      {nuevo cliente}
            read(novedades,nov);
            end;


write(temp,nov);   //Se graba en el nuevo archivo , el centinela
close(afiliados);
close(novedades);
close(temp);

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
     writeln(codigo:9,plan:6,'  ',dia,'/',mes,'/',anio);
     end;
close(te);
end;

var               {programa princiapl}
afiliados,novedades,te:tar;

begin{programa principal}
assign(afiliados,'afiliados.dat');
assign(novedades,'novedades.dat');
assign(te,'temp.dat');
modificaciones(afiliados,novedades);
lista(te);
readln;

end.

