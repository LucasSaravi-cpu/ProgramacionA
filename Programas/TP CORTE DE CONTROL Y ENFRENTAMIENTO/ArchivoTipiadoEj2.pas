{Enfrentamiento 2 archivos con el mismo orden (clave primaria o secundaria ) enfrentamiento 1 a 1 ( ambos archivos
clave primaria) resultado es un archivo o listado }

program credit;
type
   st5=string[5];
   tr=record
      codigo:st5;
      ctotales:byte;
      cpagadas:byte;
   end;

   tar=file of tr;
   tarb=file of st5;

var
  creditos:tar;
  pagos:tarb;

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
              contcp:=contcp+1
           else
              write(temp,RC);
              read(creditos,RC);
              read(pagos,RP);
              end
         else
            read(pagos,RP);
write(temp,RC);
close(creditos);
close(pagos);
close(temp);
end;

begin{programa principal}
assign(creditos,'creditos.dat');
assign(pagos,'pagos.dat');
modificaciones(creditos,pagos);

end.

