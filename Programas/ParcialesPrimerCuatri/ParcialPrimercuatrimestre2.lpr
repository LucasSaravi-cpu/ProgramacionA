{Una aerolinea canjea millas de pasajeros frecuentes a diferentes destinos y clases
Se tienen grabados en un archivo de texto un conjunto de pedidos , una lnea por cada uno:
NroSocio(4 caracteres)
millas acumuladas
millas requeridas

Se dara el beneficio siempre que las millas acumuladas sean mayores o iguales a las requeridas
Ademas:
Si las millas acumuladas sobrepasan en hasta un 20% las requeridas se canjea en clase turista
Si las millas acumuladas sobrepasan en mas de 20% las requeridas y hasta un 80% las canhea en clase bussines
Si las millas acumuladas sobrepasan el 80% las requeridas se canjea en la primera clase pero se descuenta un 10% mas

Se pide informar
a)Por cada solicitud si se rechazo o se pudo realizar el canje , detallar el nro de socio , junto con las millas actualizadas y la clase asignada (T B o P)
b)Promedio de millas canjeadas en clase B ( puede no existir)
c)Nro de socio con maximo millaje canjeado

Utiliza el procedimiento canje que con los parametros que considere necesarios devuelva el millaje actualizado y la clase asignada
}



program   ParcialPrimercuatrimestre2;

procedure canje(MillasAcum,millasreq:longint; var clase:char ; var millasact:longint);
var
n1,n2:real;
dif:longint;
begin
dif:=millasAcum-millasreq;
n2:=millasreq*0.2;
n1:=millasreq*0.8;
if (dif<=n2) and (dif>=0) then
   clase:='T'
else
  if (dif>n2) and (dif<=n1) then
     clase:='B'
  else
     if dif>n1 then
        clase:='P';

 millasact:=dif;

end;

var
contb:word;
millasact,millasacum,millasreq,acumb,sum,max:longint;
clase:char;
arch:text;
nrosocio,maxmillas:string[4];
begin

assign(arch,'ParcialPrimercuatrimestre2.txt');
reset(Arch);
contb:=0;
max:=0;
acumb:=0;

while not eof(Arch) do
     begin
     sum:=0;
     readln(arch,nrosocio,millasacum,millasreq);

     if (millasacum>=millasreq) then
        begin
        canje(millasacum,millasreq,clase,millasact);

        case clase of
        'T': writeln('socio',nrosocio,'usted viajo en clase',clase,'sus millas',millasact);
        'B':begin
            writeln('socio',nrosocio,'usted viajo en clase',clase,'sus millas',millasact);
            Acumb:=acumb+millasreq;
            contb:=contb+1;
            end;
        'P':writeln('socio',nrosocio,'usted viajo en clase',clase,'susmillas',(millasact*0.9):0:3);
        end;

        end
     else
        writeln('rechazo');

     sum:=sum+millasreq;
     if sum>max then
        begin
        max:=sum;
        maxmillas:=nrosocio;

      end;
end;

close(Arch);
writeln(acumb/contb:8:2,'promedio de millas');
writeln(maxmillas,'socio con mas millas');
readln;
end.

