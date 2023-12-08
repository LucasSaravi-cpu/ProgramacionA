{La Cámara Hotelera requiere un listado por ciudad y por nivel de todos los hoteles, cuenta con un archivo con los
datos ordenados por los dos primeros campos, como se detallan:
CIUDAD (1er campo de secuencia, clave secundaria)
CATEGORIA (1..5) (2do campo de secuencia, clave secundaria)
NOMBRE del HOTEL
CANTIDAD de PLAZAS
PRECIO por PERSONA
Se pide:
a) Un listado por ciudad y por nivel, agrupar por nivel según el siguiente criterio:
Nivel 1: categorías 1
Nivel 2: categorías 2 y 3
Nivel 3: categoría 4 y 5
Detallar:
• Para cada ciudad listado de hoteles y total de plazas por nivel
• Al finalizar cada ciudad el nivel con más hoteles.
• Al final del listado el nombre de la ciudad con más hoteles categoría 5 y precio superior a $ 1000
• Al final del listado el total de hoteles y total de plazas en cada categoría


Ciudad xxxxxx
Nivel 1
Nombre del Hotel
xxxxxxxxx
xxxxxxxxx
Total Plazas 9999
Nivel 2
Nombre del Hotel
xxxxxxxxx
xxxxxxxxx
Total Plazas 9999
…………………………
El nivel con mas hoteles es: 9
Ciudad xxxxxx
Nivel 1
Nombre del Hotel
xxxxxxxxx
xxxxxxxxx
Total Plazas 9999
Nivel 2
Nombre del Hotel
xxxxxxxxx
xxxxxxxxx
Total Plazas 9999
…………………………
El nivel con mas hoteles es: 9
………………………………………………
La ciudad xxxxxxx es la que tiene más hoteles de categoría 5 y precio superior a $1000
Totales
Categoría 1 2 3 4 5
Hoteles 99 99 99 99 99
Plazas 999 999 999 999 999}






program CorteDeControlHotel;
Type

    st10=String[10];

    TR=record
    ciudad:st10;
    categoria:byte;
    hotel:st10;
    plazas:byte;
    precio:real;

    end;

 Tar=File of TR;






 Function EsNivel(categoria:byte):byte;
 begin

 if (categoria=1) then
   EsNivel:=1
 else
    if (categoria=2) or (categoria=3) then
      EsNivel:=2
    else
       if (categoria=4) or (categoria=5) then
         EsNivel:=3;


 end;









Procedure Resuelve(var vector:Tar);
var
r:TR;

ciudadAct,maxciudad:st10;
plazastotales,plazasnivel,nivel,max,maxnivel,cantidadhoteles,max2,hotelescategoria:byte;
cont1,cont2,cont3,cont4,cont5,sum1,sum2,sum3,sum4,sum5:byte;
categoriaAct:byte;
begin

Reset(vector);  {Abre el archivo}
read(vector,R); {lee la componente actual sobre la variable  }

max2:=0;
cont1:=0;
 cont2:=0;
 cont3:=0;
 cont4:=0;
 cont5:=0;
 sum1:=0;
  sum2:=0;
  sum3:=0;
  sum4:=0;
  sum5:=0;
while not eof(vector) do { mientras que no se termine el archivo}
begin




CiudadAct:=r.ciudad;

writeln('ciudad ' , ciudadact);
plazastotales:=0;
max:=0;
 hotelescategoria:=0;
while  (CiudadAct=r.ciudad)  do
          begin

         Nivel:= EsNivel(r.categoria);
         categoriaAct:=nivel;



         plazasNivel:=0;
         cantidadHoteles:=0;

         writeln('nivel ' , nivel);
         writeln('Hoteles de este nivel ' );


          while  (CiudadAct=r.ciudad) and  (CategoriaAct=EsNivel(r.categoria))  do
                    begin

                    plazasnivel:=plazasnivel+r.plazas;
                    plazasTotales:=PlazasTotales+r.plazas  ;

                    writeln(r.hotel);

                    cantidadhoteles:=cantidadhoteles+1;



                    read(vector,R);


                    if (r.categoria=5) and (r.precio>=1000) then
                       begin
                       HotelesCategoria:=hotelescategoria+1;
                       end;






                    if r.categoria=1 then
                      begin
                      cont1:=cont1+1 ;
                      sum1:=sum1+r.plazas;
                      end
                    else
                        if r.categoria=2 then
                           begin
                            cont2:=cont2+1;
                            sum2:=sum2+r.plazas;
                           end
                        else
                            if r.categoria=3 then
                              begin
                              cont3:=cont3+1    ;
                               sum3:=sum3+r.plazas;
                              end
                            else
                                if r.categoria=4 then
                                  begin
                                 cont4:=cont4+1    ;
                                  sum4:=sum4+r.plazas;
                                  end

                                 else
                                     if r.categoria=5 then
                                       begin
                                       cont5:=cont5+1;
                                       sum5:=sum5+r.plazas;
                                       end;








                    end;





             if cantidadHoteles>max then
               begin
               max:=cantidadhoteles;
               maxnivel:=nivel;
               end;

              case Nivel of
                 1: writeln('Las plazas para el nivel 1 son ', plazasNivel);
                 2: writeln('Las plazas para el nivel 2 son ', plazasNivel);
                 3: writeln('Las plazas para el nivel 3 son ', plazasNivel);
              end;





              end;

       if (max2>hotelesCategoria) then
         begin
          max2:=hotelescategoria;
          maxciudad:=ciudadAct;
         end;



       writeln('La  cantidad de plazas para la ciudad es ',plazasTotales);
       writeln('el nivel con mas hoteles es ', maxnivel, ' y su cantidad es  ' , max);



end;


if (hotelescategoria<>0) then
writeln('La ciudad con mayo cantidad de hoteles con categoria 5 y precio mayores a 1000 es ' , maxciudad);

writeln();

writeln('Categoria':9, '1':5,'2':5 , '3':5 , '4':5,'5':5 );
writeln('Hoteles ':9 , cont1:5,cont2:5,cont3:5,cont4:5,cont5:5);
writeln('Plazas':9 , sum1:5, sum2:5 ,sum3:5,sum4:5,sum5:5);



close(vector);
end;


var
vector:Tar;

begin
Assign(vector, 'archivo.dat');
resuelve(vector);


readln;
end.
