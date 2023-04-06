{Eliminar todas las ocurrencias de X en un vector V de N elementos}


program Guia7EliminarElemento;
const
      max=100;        //Dimencion fisica

TYPE TV=array[1..max] of byte;

procedure LeeVector(Var v:TV ; n:byte);
var
  i:byte;
begin
  for i:=1 to n do        //dimencion logica(utilizado)
     begin
       write('Ingrese el elemento');
       readln(V[i]);
     end;

end;


procedure eliminaElemento(Var v:tv; var n:byte; num:byte);
var
cont,i:byte;
begin
cont:=1;
for i:=1 to n do                //elimina todos los elementos iguales dentro del arreglo
    begin
   if v[i]<>num then
       begin

       v[cont]:=V[i];
       cont:=cont+1;

       end
   else
       n:=n-1;

   end;
end;




procedure Escribevector(v:tv;n:byte);
var
i:byte;
begin
for i:=1 to n do
   write(v[i]);
end;

var
  n:byte;
  A:TV;
  num:byte;

begin
  writeln('Escriba la dimension del arreglo');
  readln(n);
  Leevector(A,N);

  writeln('Escriba el elemento a eliminar');
  readln(num);


  eliminaElemento(A,n,num);

  Escribevector(A,N);
  readln;
end.


