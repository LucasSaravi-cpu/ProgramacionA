{Para n personas se registro el peso y la altura , calcula sus IMC y determinar e informar el % de los que tiene un indice normal
18<=IMC<=21 .Implementar y utilizar funcion IMC correctamente parametrizada que devuelva true si el indice es normal y False en caso contrario}


program Guia5Ejercicio3;

Function Normal(p,a:real):boolean;
var
  imc:real;
begin
  imc:=p/(Sqr(a));

  if (imc>=18) and (imc<=21) then
     normal:=true
  else
    normal:=false;
end;

var
  i,n,contn:byte;
  peso,altura:Real;
begin
  contn:=0;
  writeln('Ingrese la cantidad de persona');
  readln(n);
  for i:=1 to n do
    begin
     writeln('ingrese la altura y el peso');
     readln(altura,peso);
     if normal(peso,altura) then
        contn:=Contn+1;          { cuenta los verdaderos}
    end;
 writeln('El % de personas con IMC es' , contN/(n*100):8:2);
 readln;
end.


