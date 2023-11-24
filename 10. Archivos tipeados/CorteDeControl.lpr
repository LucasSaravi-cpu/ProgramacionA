program CorteDeControl;
Type

    st10=String[10];

    TR=record

    end;

 Tar=File of TR;

Procedure Resuelve(var vector:Tar);
var
r:TR;



begin

Reset(vector);  {Abre el archivo}
read(vector,R); {lee la componente actual sobre la variable  }
  vectorAnt:='  ';

while not eof(vector) do { mientras que no se termine el archivo}
begin




vectoroAct:=r.;



while  (vectorAct=r.)  do
          begin


         vectorAct2:=r.


          while  (vectorAct=r.) and  vectorAct2:=r.    do
                    begin





                      read(vector,R);

                    end;


              end


end;


close(vector);
end;


var
vector:Tar;
begin
Assign(vector, 'vector.dat');
resuelve(vector);

readln;
end.
