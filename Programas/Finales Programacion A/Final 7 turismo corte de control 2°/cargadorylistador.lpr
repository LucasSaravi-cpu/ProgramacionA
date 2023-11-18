program cargadorylistador;

 Type
 st20= String[20];
 st30=  String[30];
 st10=  string[10];
 tr=record
   provincia:st20;
   ciudad:st30;
   dni:st10;
   importe:real;
   end;

      TArprovincia = file of tr;


var
prov:TArprovincia;

procedure graba(var prov:TArprovincia);
var
r:tr;
arch:text;
esp:char;
begin
assign(arch,'transporte.txt');
reset(arch);
rewrite(prov);
while not eof(arch) do
   begin
   readln(arch,r.provincia,r.ciudad,r.dni,r.importe);
   write(prov,r);
   end;



close(arch);
close(prov);
end;



procedure lista(var prov:TArprovincia);
var
r:tr;
begin
reset(prov);
while not eof(prov) do
     begin
     read(prov,r);
    ;
       writeln(r.provincia,r.ciudad,r.dni,r.importe)
     end;
close(prov);
end;

begin{programa principal}
assign(prov,'transporte.dat');
graba(prov);
lista(prov);
readln;
end.

