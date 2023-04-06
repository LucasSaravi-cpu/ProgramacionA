program Guia7InsertarOrdenado;
const
      max=100;        //Dimencion fisica

TYPE TV=array[1..max] of byte;



procedure LeeVector(Var v:TV ; var n:byte);
var
  i:byte;
  x:byte;
begin
  for i:=1 to n do
     begin
       write('Ingrese el elemento');
       readln(v[i]);

     end;

end;


procedure InsertarOrdenado(var V:tv; var n:byte ; x:byte);
var
i:byte;
begin
i:=N;
while (i>0) and (V[i]>x) do
  begin
  v[i+1]:=v[i];
  i:=i-1
  end;
v[i+1]:=x;
n:=n+1;

end;

procedure Escribevector(v:tv;n:byte);
var
i:byte;
begin
for i:=1 to n do
   write(v[i]);
end;

var
  n,NUM:byte;
  A:TV;

begin
  writeln('Escriba la dimension del arreglo');
  readln(n);
  Leevector(A,N);
  writeln('INGRESE EL VALOR A INSERTAR');
  READLN(NUM);
  InsertarOrdenado(A,N,NUM);
  Escribevector(A,N);
  readln;
end.

