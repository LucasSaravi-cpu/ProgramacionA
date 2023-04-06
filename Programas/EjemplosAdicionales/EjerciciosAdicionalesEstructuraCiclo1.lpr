{En un club se desea categorizar a los socios que practican boxeo , para esto se analizan el PESO y la EDAD de cada uno
Determinar y escribir la categoria que le corresponde a cada uno de N socios , de acuerdo con

21 a 30 a¤os .60 a 90 kilos "mosca"
              91 a 100 kilos  liviano"

31 a 40 a¤os  80 a 95 kilos "liviano"
              96 a 110 kilos " pesados "

al final proceso informar
peso promedio de la categoria liviano
porcentaje de socios en cada categoria
}



program EjerciciosAdicionalesEstructuraCiclo1;

function categoria (peso:real;edad:byte):string;
begin
 if (edad>=21) and (edad<=30) then
      if (peso>=60) and (peso<=90)  then
          categoria:='mosca'
      else
         if (peso>=91) and (peso<=100) then
            categoria:='liviano'
   else
      if (edad>=31) and (edad<=40) then
         if (peso>=80) and (peso<=91) then
            categoria:='liviano'
         else
            if (peso >=96) and (peso<=110) then
               categoria:='pesado';
end;


var
peso,totpeso,acum:real;
edad,i,socios,cont1,cont2,cont3:byte;
arch:text;
cat:string;
begin
assign(arch,'EjerciciosAdicionalesEstructuraCiclo1.txt');
reset(arch);
acum:=0;
totpeso:=0;
cont1:=0;
cont2:=0;
cont3:=0;

while not eof(Arch) do
begin

readln(arch,socios);
for i:=1 to socios do
   begin
   readln(arch,peso,edad);
   TotPeso:=totpeso+peso ;
   cat:=categoria(peso,edad);
   if (cat='liviano') then
      begin
      Acum:=acum+peso;
      cont1:=cont1+1;
      end
   else
      if (cat='mosca') then
        cont2:=cont2+1

      else
        if (cat='pesado') then

            cont3:=cont3+1;

   end;

end;

writeln('el promedio de livianos es de ', (acum/totpeso):8:2);

writeln('El porcentaje de socios en cada categoria es de ');

if cont2<>0 then
   writeln('Mosca  ', (cont2/socios*100):8:2)
else
   writeln('No hay socios en la categoria mosca');

if cont1<>0 then
   writeln('liviano ', (cont1/socios*100):8:2)
else
   writeln('No hay porcentaje de socios en la categoria liviano');

if cont3<>0 then
   writeln('pesado',(cont3/socios*100):8:2)
else
   writeln('No hay porcentaje de socios en la categoria pesado');
close(arch);
readln;
end.
