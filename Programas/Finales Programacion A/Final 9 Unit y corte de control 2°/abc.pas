unit ABC;



interface
 Const
   TOPE =10;

type

   MT = array[1..TOPE,1..TOPE] of char;

  TR1 = record
   col:byte;
   porc:real;
  end;
TVr = array[1..TOPE] of TR1;


procedure cargamatriz(var mat:mt ;var n,m:byte );
procedure LeeMat( mat: MT;  n,m: Byte);
procedure Escribevec( vec: tvr;  n:byte);
Function EsLetra(ch: Char): Boolean;
procedure genereArreglo(var  vector:tVR ; var k:byte ; mat:mt ; n,m:byte);






implementation



procedure cargamatriz(var mat:mt ;var n,m:byte );
var
i,j:byte;
arch:text;
espacio:char;

begin
assign(arch,'matriz.txt');
reset(Arch);
readln(arch,n,m);



    for i:=1 to n do
       begin
       for j:=1 to m do     //va de 0 a 6
          begin
           read(arch,mat[i][j],espacio);
           end;
       readln(Arch);
       end;


close(Arch);
end;


 procedure LeeMat( mat: MT;  n,m: Byte);
var
  j,i: Byte;
begin
   for i:=1 to n do
       begin
       for j:=1  to m do
          begin
           write(mat[i][j]);
           end;
       writeln();

       end;
end;

  procedure Escribevec( vec: tvr; n:byte);
var
  i: Byte;
begin
   for i:=1 to n do
        begin
           writeln(vec[i].col:3 , vec[i].porc:8:2);



       end;
end;



  function EsLetra(ch: Char): Boolean;
const
  letras = ['A'..'Z', 'a'..'z'];
begin

  EsLetra := ch in letras;
end;




  procedure genereArreglo(var  vector:tVR ; var k:byte ; mat:mt ; n,m:byte);
var
    i,j,contarletras:byte;
begin

  k:=1;
 for j:=1 to m do
    begin
    contarletras:=0;

       for i:=1 to n do
          begin


          if EsLetra(mat[i][j])then
            begin
            contarLetras:=contarLetras+1;
            end;


          end ;

       if contarLetras<>0 then
         begin
          vector[k].col := j;
          vector[k].porc:=contarLetras/n*100;
          k:=k+1;
          end;


     end




end;


end.










