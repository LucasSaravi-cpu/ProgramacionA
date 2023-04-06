program ejercicio13;
var
  codigo,maxcodigo:string[4];
  n,i:byte;    //siendo n la cantidad de paquetes
  arch:text;
  max,capacidad,peso,maxcapacidad,sum,sum1:real;


begin
  assign(arch,'text.txt');
  reset(arch);
  max:=9999;
  readln(arch,capacidad);
  while not eof(arch) do //Este while corresponde al codigo de destino
       begin
       readln(arch,codigo,n);
       sum:=0;
       sum1:=0;
       maxcapacidad:=9999;
       for i:=1 to  n do             // cantidad de paquetes
            begin
            readln(arch,peso);
            peso:=peso/1000;       // 1 tonelada son 1000kilos.En este paso el peso se convierte en toneladas
            if peso<=maxcapacidad then
               begin
               sum:=sum+peso;
               maxcapacidad:=capacidad-peso;
               end
            else
               sum1:=sum1+peso;
            end;

          writeln('Se cargaron en el camion ', sum:3:4,' TONELADAS' ,'y no se pudieron transportar  ',(sum1*1000):3:4,' KILOS ','Para el destino  ' ,codigo);

         if sum<max then
           begin
           max:=Sum;
           maxcodigo:=Codigo;
           end;
        end;

writeln('El destino cuyo camion registro la menor capacidad es  ' ,maxcodigo);
close(Arch);
readln;
end.

