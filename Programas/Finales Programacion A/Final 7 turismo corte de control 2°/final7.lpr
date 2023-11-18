{Armar el siguiente listado teniendo en cuenta que la estructura del registro es
provincia   caracteres de 20 clave primera
ciudad      caracteres de 30 clave segunda
dni caracteres de 10
importe del gasto real

resumenes de los gastos

provincia buenos aires
ciudad               importe mayor gastos          canntidad de gastos      total de gastos
mardelplata             30000                                3                  57500
necochea                 4000                                 1                  4000
tandil                   55000                                 2                   70000

ciudad donde se gasto mas tandil 70000


provincia mendoza
ciudades                 importe mayor gastos          canntidad de gastos      total de gastos
mendoza                          75000                            2                    127000
san rafaela                      45000                            2                       67000

  ciudad donde se gasto mas mendoza con 127000

provincia misiones
ciudad                importe mayor gastos          canntidad de gastos      total de gastos
iguazu                         18000                             3                     42000


ciudad donde se gasto mas iguzu con 42000


provincia con mayor cantidad de gastos buenos aires



}

program final7;

 Type
 st20= String[20];
 st30=  String[30];
 st10=  string[10];
 tr=record
   provincia:st20;
   ciudad:st30;
   dni:st10;
   importe:real;
   end;

      TArprovincia = file of tr;

procedure listarProvincias( var arch:tarprovincia);
var
  pro:tr;
  provact,maxtotalgastospro:st20;
  ciudadact,maxciudad2:st30;
  contadorciudad:byte;
  totalgastos,maxciudad,max,totalmax,total:real;
begin
   reset(arch);
    read(Arch, pro);
    writeln('resultados de las provincias');
     totalmax:=0;
  while not Eof(Arch) do
        begin
        provact:=pro.provincia;
        writeln('provincia ' , pro.provincia);
        writeln('ciudad', ' importe mayor gastos':30,'cantidad de gastos','total de gastos');

         total:=0;
         maxciudad:=0;
        while (provact= pro.provincia)do
              begin
              ciudadact:=pro.ciudad;
              contadorciudad:=0;
              totalgastos:=0;
              max:=0;

              while  (provact= pro.provincia) and ( ciudadact=pro.ciudad) do
                    begin

                    contadorciudad:=contadorciudad+1;

                     totalgastos:=totalgastos+pro.importe;


                    if (pro.importe>max) then
                       max:=pro.importe;


                    read(Arch, pro);
                    end;


              writeln(ciudadact,'  ' ,max:8:2 ,'  ',contadorciudad,'  ',totalgastos:8:2);

                if (totalgastos>maxciudad) then
                 begin
                 maxciudad:=totalgastos;
                 maxciudad2:=ciudadact;
                 end;

              total:=total+totalgastos;


              end;

              writeln(' la ciudad con mayor gastos es ' ,maxciudad2);

              writeln(total:8:2);
              if total>totalmax then
               begin
                 maxtotalgastospro:=provact;
                totalmax:=total;
               end;



          end;

  writeln('la provincia con mayor gastos es ' , maxtotalgastospro);
  close(arch);
end;


var
  arch:tarprovincia;

begin
  assign(arch,'transporte.dat');

  listarprovincias(arch);
  readln;
end.

