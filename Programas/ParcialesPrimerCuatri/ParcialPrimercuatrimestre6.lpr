program ParcialPrimercuatrimestre6;
function clasifica(z,visitas:real;like:byte):char;
begin
if (visitas>=z) then
   clasifica:='E'
else
   if (like>visitas) then
      clasifica:='D'
   else
      clasifica:='N';
end;

var
arch:text;
temas,maxtemas,nombre:string[8];
cont,cont1,visitas,m,i,max,z,like:byte;
acum:real;
cla:char;
prom:real;
begin
assign(arch,'youtube.txt');
reset(arch);
cont1:=0;
cont:=0;
readln(arch,m,z);
while not eof(arch) do
     begin
     readln(arch,nombre);
     acum:=0;
     max:=0;
     for i:=1 to m do
     begin
     readln(arch,temas,visitas,like);


     if (like>max) then
        begin
        max:=like;
        maxtemas:=temas;
        end;
      acum:=acum+visitas;
     end;
     prom:=acum/m;
     cla:=clasifica(z,prom,like);

     if cla='E' then
        cont:=cont+1
     else
         if cla='D' then
            cont1:=cont1+1;

     writeln('Para ' , nombre,'  el tema con mas like es  ' , maxtemas);
     writeln('el prom de visitas por video es' , prom:3:2);
     end;
writeln('para estrella ', cont,'para destacado ',cont1);
readln;
end.
