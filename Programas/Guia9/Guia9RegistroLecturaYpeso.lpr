

program Guia9RegistroLecturaYpeso;

type
    st5=String[5];
    TregP=record
      nombre:st5;
      edad:byte;
      peso,altura:real;

    end;


const
      maxelem=10;

Type
    TV=array[1..maxelem] of TregP;


procedure LeeVector(var v:tv;var n:Byte);
var
res:char;
begin
n:=0;
write('Ingrese datos(S/n) ');
readln(res);

while (res='s') and (N<maxelem) do
  begin
  n:=n+1;
  with V[n] do
     begin
     readln(nombre);
     readln(peso);
     readln(edad);
     readln(altura);
     end;
  write('ingrese datos(s/n)');
  readln(res);
  end;
end;

procedure EscribeVector(v:tv;L:byte);
var
i:byte;
begin
for i:=1 to l do
    writeln(V[i].nombre,'  ' , V[i].peso:5:2,'  ' , v[i].edad,'  ' , v[i].altura:5:2);

end;

//Consulta el peso a partir del nombre
procedure  consultaPeso(v:tv; n:byte; nom:st5 ; var peso :real);
var
j:byte;
begin
j:=1;

while (j<=N) and (v[j].nombre<> nom) do
     j:=j+1;
if j<=n then
   peso:=v[j].peso
else
  peso:=0;

end;



function edad(v:tv;n:byte):string;
var
i:byte;
min:byte;
minnombre:st5;
begin
min:=9999;
for i:=1 to n do
    begin
    if v[i].edad<min then
       begin
       min:=V[i].edad;
       minnombre:=v[i].nombre;
       end;
    end;

edad:=minnombre;
end;


function promedioAltura(v:tv;n:byte):Real;
var
i:byte;
sum:real;
begin
sum:=0;
for i:=1 to n do
   begin
   sum:=sum+v[i].altura;
   end;

promedioAltura:=sum/n;

end;

var
v:tv;
nom:st5;
peso:Real;
n:byte;

begin
leevector(v,n);
escribevector(v,n);
writeln;
writeln('Ingrese el nombre de la persona de la cual quiere saber el peso');
readln(nom);
writeln;
consultaPeso(v,n,nom,peso);

if peso<>0 then
   writeln('El peso de la persona es  ', peso:5:2)
else
   writeln('No se encontro ningun peso para ese nombre  ');


writeln('El nombre de la persona mas joven es  ', edad(v,n) );


writeln( 'El promedio de altura es' , promedioaltura(v,n):8:2);
readln;
end.

