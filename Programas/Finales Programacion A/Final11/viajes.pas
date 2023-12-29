unit viajes;

interface
 Const
   MAX =20;

type



  TR1 = record
   dia:byte;
   plazasTotal:byte;
   horassinsalida:byte;
  end;



TVr = array[1..MAX] of TR1;
MT = array[1..MAX,1..MAX] of byte;


procedure Leematriz(var mat:mt ;var n,m:byte );
procedure MuestraMat( mat: MT;  n,m: Byte);
procedure genereArreglo(var  vector:tVR ; var k:byte ; mat:mt ; m,n:byte ; x:byte);
procedure Escribevec( vec: tvr;  n:byte);
Procedure IniciaMatriz(Var Mat:mt; N,M:byte);
function horastotales(mat:mt; n:byte ; hora1:byte;hora2:byte):byte;







implementation

  //Inicializo matriz
Procedure IniciaMatriz(Var Mat:mt; N,M:byte);
Var
 i, j: byte;
begin
For i:= 1 to N do
    For j:= 0 to M do
        Mat[i, j]:=0;
End;


  Procedure LeeMatriz (var Mat:mt;var N,m:byte);
  var
    i,j:byte;
    Arch:Text;
  Begin
    Assign(Arch,'salidas.txt');
    Reset(Arch);
    Readln(Arch,N,m);
    iniciamatriz(mat,n,m); {inicializo toda la matriz en 0}
    While not eof (Arch) do
          begin
               read(Arch,i,j);
               readln(Arch,Mat[i,j]);
          end;
    Close(Arch);
  end;







 procedure MuestraMat(mat:mt;n,m:Byte);
var
i,j:byte;
begin
   writeln('Grilla de salidas');
   writeln('H0':9,'h1':4,'h2':4,'h3':4,'h4':4,'h5':4,'h6':4,'h7':4,'h8':4,'h9':4,'h10':4,'h11':4,'h12':4,'h13':4,'h14':4,'h15':4,'h16':4,'h17':4,'h18':4,'h19':4,'h20':4,'h21':4,'h22':4,'h23':4);
for i:=1 to n do
    begin
    write('Dia ':4,i);
   for j:=0 to m do

       begin

       write(mat[i,j]:4);
       end;
    writeln;
    end;
end;




  procedure Escribevec( vec: tvr; n:byte);
var
  i: Byte;
begin
   for i:=1 to n do
        begin
           writeln('dia',vec[i].dia,'horassinsalidas',vec[i].horassinsalida,'plazas totales',vec[i].plazastotal);



       end;
end;







  procedure genereArreglo(var  vector:tVR ; var k:byte ; mat:mt ; m,n:byte ; x:byte);
var
    i,j:byte;
    sum:byte;
    cont:byte;
begin

  k:=1;


          for i:=1 to n do
              begin
              cont:=0;
              sum:=0;
             for  j:=0 to m do
                begin

                if mat[i,j]=0 then
                   cont:=cont+1;

                sum:=sum+mat[i,j];


                end;

             if sum>=x then
                begin
                   vector[k].dia:=i;
                  vector[k].plazastotal := sum;
                   vector[k].horassinsalida:=cont;
                   k:=k+1;
                end;
             end;

            end;
    

        





function horastotales(mat:mt; n:byte ; hora1:byte;hora2:byte):byte;
var
i,j:byte;
cont:byte;
begin
 cont:=0;
  for i:=1 to n do
      begin
      for j:=hora1 to hora2 do
          begin

          if mat[i,j]<> 0 then
             cont:=cont+1;


          end;




          end;

  horastotales:=cont;



end;






end.

