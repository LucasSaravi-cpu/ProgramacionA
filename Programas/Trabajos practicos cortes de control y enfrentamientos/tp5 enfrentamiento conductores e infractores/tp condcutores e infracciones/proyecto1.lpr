program proyecto1;



type
  st8=string[8]  ;
  tr= record
    DNI: st8;
    ApellidoNombre: string[10];
    Puntos: byte;
  end;


 tr2 = record
    DNI: st8;
    CodInfraccion: byte;
  end;

  tr3 = record
    CodInfraccion: byte;
    PuntosDescontar: byte;
  end;

  tarconductores=file of tr;
  Tarinfracciones=file of tr2;
    TV=array[1..50] of TR3;


  function cantidaddemultas(vecpuntosxinfraccion: TV ; num:byte):byte;
  var
  i:byte;
  begin
  i:=1;
 while (i<=10) or (vecpuntosxinfraccion[i].codinfraccion<>num ) do
     begin
     if  vecpuntosxinfraccion[i].codinfraccion=num then
        cantidaddemultas:=vecpuntosxinfraccion[i].puntosdescontar;

     i:=i+1;
     end;
  end;



procedure modificaciones(var conductores:tarconductores;var infracciones:Tarinfracciones ;var vecpuntosxinfraccion: TV );

var
temp: tarconductores;
condu :tr ;
infra:   tr2;
erroneas,cont,sum,inf:byte;

begin

assign(temp,'temp.dat');
rewrite(temp); // se abre el archivo para gravar los datos
reset(conductores);
reset(infracciones);
read(conductores,condu);
read(infracciones,infra);

 erroneas:=0;
cont:=0;
sum:=0;
 inf:=0;


while not eof(conductores) or not eof(infracciones) do
    begin

    if condu.dni<infra.dni then
        begin
        write(temp,condu);
        read(conductores,condu);
        sum:=sum+condu.puntos;
        cont:=cont+1;

        end
    else

         if condu.dni=infra.dni then // signfica que tiene infracciones entonces
           begin
           inf:=    condu.puntos - cantidaddemultas(vecpuntosxinfraccion , infra.codinfraccion)     ;

           if ( inf<=0)  then
              writeln('Conductor dado de baja: ', condu. ApellidoNombre);



              read(infracciones,infra);
              read(conductores,condu);

              end




      else
          if condu.dni>infra.dni then
          begin
          read(infracciones,infra); //incorrecta no existe conductores con infracciones
           erroneas:=erroneas+1;
          end;

    end ;
  writeln(' Puntos promedio de los conductores que no registran infracciones  ',sum/cont);
  writeln('la cantidad infracciones erroneas osea que no exiten los dni son ' , erroneas);

 write(temp,condu); // graba el centinela
 close(conductores);
 close(infracciones);
 close(Temp);

end;


var
  conductores:tarconductores;
  infracciones:Tarinfracciones;
  vecpuntosxinfraccion: TV;
  arch:text;
  i:byte;
begin{programa principal}

assign(arch,'PUNTOS_X_INFRACCION.txt')  ;
reset(arch);

for i:=1 to 10 do
        begin
        readln(arch,vecpuntosxinfraccion[i].CodInfraccion,vecpuntosxinfraccion[i].PuntosDescontar) ;

        end;


assign(conductores,'conductores.dat');
assign(infracciones,'infracciones.dat');

modificaciones(conductores,infracciones,vecpuntosxinfraccion);
readln;

end.


