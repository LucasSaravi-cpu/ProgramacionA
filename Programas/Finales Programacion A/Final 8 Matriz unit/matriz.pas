unit matriz;



interface

type
MT = array[1..20,1..20] of integer;

procedure cargamatriz(var mat:mt ;var n:byte );
procedure LeeMat(var mat: MT; var n: Byte);





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

