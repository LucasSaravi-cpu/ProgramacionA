{Leer un conjunto de numeros , determinar cuatos terminan con 0,1,2...9}

program Guia7IndiceConSignificado2;

type
     tv=array[0..9] of word;

procedure inicia(var vec:tv);
var
  i:byte;
begin
   for i:=0 to 9 do
      vec[i]:=0;
end;


procedure cuantos (var vec:tv);
var
  nro:word;
  indice:byte;
  arch:text;
begin
assign(arch,'');
reset(arch);
while not eof(arch) do
   begin
   readln(arch,nro);
   indice:=nro mod 10;
   vec[indice]:=vec[indice]+1;
   end;
close(arch);

end;

procedure Escribe(vec:tv);
var
i:byte;
begin
for i:=0 to 9 do
   writeln(vec[i]);
end;

var
vec:tv;
begin
 Inicia(vec);
 cuantos(vec);
 escribe(vec);
readln;
end.

