program enfrentamiento;
type
   st5=string[5];
   tr=record

   end;

   tar=file of tr;
   tarb=file of ;

var
 archivoa:tar;
  archivob:tarb;

Procedure Modificaciones(var archivoa:tar; var archivob:tarb );
var
temp:tar;
a:tr;
b:st5;

begin

assign(temp,'temp.dat');
rewrite(temp); {se abre el archivo para gravar los datos nuevos}
reset(archivoa);
reset(archivob);
read(archivoa,a);
read(archivob,b);
while not eof(archivoa) or not eof(archivob) do
     if a.<b then
        begin
        contnp:=contnp+1;
        write(temp,a);
        read(archivob,b);
        end
     else
        if a.= b then
           begin

              write(temp,RC);
                read(archivob,b);
              read(archivoa,a);
              end
         else
            read(archivoa,a);
write(temp,RC);
close(archivoa);
close(archivob);
close(temp);
end;

begin{programa principal}
assign(archivoa,'archivoa.dat');
assign(archivob,'archivob.dat');
modificaciones(archivoa,archivob);
readln;
end.
