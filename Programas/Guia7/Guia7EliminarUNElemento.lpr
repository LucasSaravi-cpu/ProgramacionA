{Eliminar un elemento X recibido como parámetro, informando si fue posible hacerlo}


program Guia7EliminarUNElemento;
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


function buscarElemento(v:tv;n:byte;x:byte):byte;
var
pos,i:byte;
begin
pos:=0;
for i:=1 to n do
   begin
    if v[i]=x then
       begin
       pos:=i;
       end;
   end;

buscareLEMENTO:=pos;
end;

procedure eliminaUNElemento(Var v:tv; var n:byte; num:byte);
var
i:byte;
pos:byte;
begin

pos:=buscarelemento(v,n,num);

if pos<>0 then
  begin
  for i:=pos to n-1 do
      v[i]:=v[i+1];

       n:=n-1;

  end

else
   writeln('NO SE ENCONTRO EL ELEMENTO PEDIDO');
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


  eliminaUNElemento(A,n,num);

writeln('El vector queda');
writeln;
      Escribevector(A,N);

  readln;
end.


