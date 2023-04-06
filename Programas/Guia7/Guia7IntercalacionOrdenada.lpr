
program Guia7IntercalacionOrdenada;
const
      max=100;

TYPE TV=array[1..max] of byte;

procedure LeeVector(Var v:TV ; n:byte);
var
  i:byte;
begin
  for i:=1 to n do
     begin
       write('Ingrese el elemento');
       readln(V[i]);
     end;

end;


procedure Intercalacion(V1,v2:TV;N,M:byte; var V3:tv; var k:byte;repetidos:boolean);
var
t,i,j:byte;
begin
i:=1;
j:=1;
k:=0;

while (i<=n) and (j<=m) do
   begin
   k:=k+1;
   if v1[i]<v2[j] then
      begin
      v3[k]:=v1[i];
      i:=i+1;
      end
   else
      if v1[i]>v2[j] then
         begin
         v3[k]:=v2[j];
         j:=j+1;
         end
       else
         begin
         v3[k]:=v1[i];
         if repetidos then
            begin
            k:=k+1;               //Inserta los repetidos
            v3[k]:=v2[j];
            end;
         i:=i+1;
         j:=j+1;
         end;
    end;
if i> n then
   begin
   for t:=j to M do
      begin
      k:=k+1;
      v3[k]:=v2[t];
      end
    end
else
    begin
   for t:=i to N do
       begin
       k:=k+1;
       v3[k]:=v1[t];
       end;
    end;

end;


procedure Escribevector(v:tv;n:byte);
var
i:byte;
begin
for i:=1 to n do
   writeln(v[i]);
end;

var
  n,m,k:byte;
  A,B,C:TV;


begin
  writeln('Escriba la dimension del arreglo A');
  readln(n);
  Leevector(A,N);
  writeln('Escriba la dimension del arreglo B');
  readln(m);
  Leevector(B,M);
  Intercalacion(A,B,N,M,C,K,true);

  writeln;

  Escribevector(C,K);

  readln;
end.
