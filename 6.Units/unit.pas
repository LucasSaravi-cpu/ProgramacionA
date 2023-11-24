unit unit;



interface

type


  st11=string[11];
  TR1 = record
    nom: st11;
    esp: char;
    cla: char;
    pre: real;
  end;
MT = array[1..20,1..20] of integer;
TV = array[1..20] of TR1;

procedure cargamatriz(var mat:mt ;var n:byte );
procedure LeeMat(var mat: MT; var n: Byte);




procedure LeeVec(var vec: TV; var n: Byte);
procedure cargaVector(var vec:tv ;var n:byte );

function esta(vec:tv;n:byte;nombre:st11):byte;





implementation



procedure cargamatriz(var mat:mt ;var n:byte );
var
i,j:byte;
arch:text;

begin
assign(arch,'matriz.txt');
reset(Arch);
readln(arch,n);

while not eof(arch) do
   begin

    for i:=1 to n do
       begin
       for j:=1 to n do
          begin
           read(arch,mat[i][j]);
           end;
       readln(Arch);
       end;

   end;
close(Arch);
end;


 procedure LeeMat(var mat: MT; var n: Byte);
var
  j,i: Byte;
begin
   for i:=1 to n do
       begin
       for j:=1 to n do
          begin
           write(mat[i][j]);
           end;
       writeln();

       end;
end;

end.


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



end.


