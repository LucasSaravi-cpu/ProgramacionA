unit vectores;

interface

type

  st11=string[11];
  TR1 = record
    nom: st11;
    esp: char;
    cla: char;
    pre: real;
  end;


   TV = array[1..20] of TR1;
procedure LeeVec(var vec: TV; var n: Byte);
procedure cargaVector(var vec:tv ;var n:byte );
function promedio (vec:tv;letra:char;n:byte):real;
function esta(vec:tv;n:byte;nombre:st11):byte;
function contar(vec:tv;n:byte;tipo:char):byte;

implementation

procedure LeeVec(var vec: TV; var n: Byte);
var
  i: Byte;
begin
  for i := 1 to n do
  begin
    writeln(vec[i].nom, ' ', vec[i].esp, ' ', vec[i].cla, ' ', vec[i].pre);
  end;
end;


function esta(vec:tv;n:byte;nombre:st11):byte;
var
i:byte;
begin

for i:=1 to n do
begin

  if (vec[i].nom = nombre) then
      esta :=1;


end;

end;

function contar(vec:tv;n:byte;tipo:char):byte;
var
i:byte;
begin


for i:=1 to n do
begin

  if (vec[i].cla = tipo) then
      contar:=contar+1;


end;


end;

procedure cargaVector(var vec:tv ;var n:byte );
var
i:byte;
arch:text;
espacio:char;
begin
assign(arch,'Final1.txt');
reset(Arch);
readln(arch,n);

while not eof(arch) do
   begin

    for i:=1 to n do
       begin

       readln(arch,vec[i].nom,espacio,vec[i].cla,espacio,vec[i].pre);

       end;

   end;
close(Arch);
end;


function promedio (vec:tv;letra:char;n:byte):real;
var
i:byte;
contL,contJ,contI:byte;
begin
contL:=0;
contJ:=0;
contI:=0;
for i:=1 to n do
  begin
  if vec[i].cla='L' then
    contL:=contL+1
  else
     if vec[i].cla='J' then
       contJ:=contJ+1
     else

           contI:=contI+1;


  end;

  if (letra='L') and (contL<>0) then
      promedio:=n/contL
    else
       if (letra='J') and (contJ<>0) then
         promedio:=n/contJ
       else
          if (letra='I') and (contI<>0) then
            promedio:=n/contI;


end;

end.


