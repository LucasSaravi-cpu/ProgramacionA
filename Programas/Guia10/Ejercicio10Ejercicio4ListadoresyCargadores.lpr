program cargadorylistador;
Type

    st5=String[6];

    TR=record
     codFarm:st5;
    codmedicamento:word;
    cantenvases:word;
    ventalibre:char;
    end;

 Tarfarmacia=File of TR;


var
farmacia:Tarfarmacia;

procedure graba(var farmacia:Tarfarmacia);
var
r:tr;
arch:text;
esp:char;
begin
assign(arch,'farmacia.txt');
reset(arch);
rewrite(farmacia);
while not eof(arch) do
   begin
   readln(arch,r.codfarm,r.codmedicamento,esp,r.cantenvases,esp,r.ventalibre);
   write(farmacia,r);
   end;



close(arch);
close(farmacia);
end;



procedure lista(var farmacia:Tarfarmacia);
var
r:tr;
begin
reset(farmacia);
while not eof(farmacia) do
     begin
     read(farmacia,r);
     writeln(r.codfarm,r.codmedicamento,r.cantenvases,'',r.ventalibre);

     end;
close(farmacia);
end;

begin{programa principal}
assign(farmacia,'farmacia.dat');
graba(farmacia);
lista(farmacia);
readln;
end.

