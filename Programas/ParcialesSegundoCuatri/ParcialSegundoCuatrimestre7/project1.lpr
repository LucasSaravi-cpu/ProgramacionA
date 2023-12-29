{Una empresa de transporte de pasajeros guarda en un archivo de texto viajes.txt la informacion de todos los viajes que realiza . El archivocontiene ne cada linea
un viaje con el codigo de la ciudad de origen , el codigo de la ciudad de destino , la cantidad de pasajeros y el valor del pasaje . En otro archivo de texto ciudades .txt se encuentran los nombres de las cudades.
Por el momento la empresa no tiene pensado expandirse y opera en 5 ciudades
El orden en que se encuentran las ciudades en el archivo determina su codigo

Se pide leer la informacion de los archivos almacenandola en estructuras para luego

a) mostrar por cada ruta par ciudad de origen - ciudad de destino ) cuantos viajes ha realizado cuantos pasajeros transporto y cual es la recuadacion total de esa ruta
b)a partir de la informacion obtenida anteriormente mostrar para cada ciudad  la cantidad de salidas y arribos
c)informar si la ciudad de la que partieron mas viajes , es tambien la ciudad a la que mas arriaron
d) mostrar la recaudacion  promeio por ruta ( solamente incluir las que tengan viajes)




resultados esperados 


rutas
origen/destino        mar del plata           tandil                necochea           olavarria                  buenos aires
mardelplata                                2 65 71257.50         2 100 270036        0 0 0                         1 51 53550    
tandil                1    25 75000                              1  44  83600        0 0 0                         0 0 0
necochea              0   0    0            0    0   0                               2 82 18020                    0 0 0
olavarria             3  117  186651.30     4 118 273500.00         0 0 0                                          1 22 66242
buenos aires          0   0    0             0  0   0              0  0 0           0 0 0

ciudad      salidas arrbbos
mardelplata   5 4 
tandil        2 6
necochea      2 3
olavarria     8 2
buenos aires   0 2

ciudad de la que partieron mas serivicos no es la ciudad a la que arribaron mas serivcios
la recudacion promedio por ruta es de 140004.09



}


program ParcialPractica;

const
  max = 50;

type
  st13 = string [13];
  Registro = record
     AcumPersonas : integer;
     AcumPasaje : real;
    end;
  TMatriz = array [1..max, 1..max] of Registro;
  Tvector  = array [1..max] of st13;
  TSalYArribos  = array [1..max] of byte;
  TM2 =  array [1..max, 1..max] of byte;


procedure CargaDatos(var Ciudades:TVector; var Matriz:Tmatriz;var contViajes: TM2; Var N:byte);
var
  i, j, T: byte;
  CantPersonas: integer;
  ValorPasaje:real;
  ArchCiudades, ArchViajes:text;

  begin
       Assign(ArchCiudades, 'ciudades.txt'); Reset(ArchCiudades);
         T:= 0;
         N:= 0;
         while not eof(archCiudades) do
               begin
                    T:= T + 1;
                    N:= N + 1;
                    readln(ArchCiudades, Ciudades[T]);
               end;
       Close(archCiudades);
       Assign(ArchViajes, 'viajes.txt'); Reset(ArchViajes);
       for i:= 1 to N do
       begin
            for j:= 1 to N do
            contViajes[i,j]:= 0;
       end;
       i:= 0;
       j:= 0;
       while not eof(ArchViajes) do
             begin
                  readln(ArchViajes, i, j, CantPersonas, ValorPasaje);
                  Matriz[i,j].AcumPersonas:= CantPersonas + Matriz[i,j].AcumPersonas;
                  Matriz[i,j].AcumPasaje:= (ValorPasaje*CantPersonas) + Matriz[i,j].AcumPasaje;
                  contViajes[i,j]:= 1 + contViajes[i,j];
             end;
       close(archViajes);
       writeln('------------ Rutas ---------------------------------------------------------------------------------------------------------------');
       write('orgien/Destino       ');
       for i:= 1 to N do
           write(Ciudades[i]:20);
       writeln;
       for i:= 1 to N do
       begin
           write(Ciudades[i]:13,'        ');
           for j:= 1 to N do
             begin
                   if (i = j) then
                      write('--------------------  ')
                   else
                       write(contViajes[i,j]:2,'  ', Matriz[i,j].AcumPersonas:3,' ', Matriz[i,j].AcumPasaje:12:2, '  ');
             end;
           writeln;
       end;
       writeln('---------------------------------------------------------------------------------------------------------------------------------');
       writeln;
    end;

procedure incisoByC(Ciudades:TVector;contViajes: TM2; N:byte);
var
i,j: byte;
SumSalidas,SumArribos :TSalYArribos;
CiudadMaxSalidas, CiudadMaxArribos:st13;
maxSalidas, MaxArribos:byte;
  begin
  MaxSalidas:= 0;
  MaxArribos:= 0;
  writeln('     Ciudad        Salidas      Arribos');
  writeln;
    for i:= 1 to N do
      begin
           sumSalidas[i]:= 0;
           for j:= 1 to N do
             begin
                  SumSalidas[i]:= SumSalidas[i] + contViajes[i,j];
                  if (MaxSalidas < SumSalidas[i]) then
                     begin
                       MaxSalidas:= SumSalidas[i];
                       CiudadMaxSalidas:= Ciudades[i];
                     end;
             end;
      end;
    for j:= 1 to N do
      begin
           SumArribos[j]:= 0;
           for i:= 1 to N do
           begin
                SumArribos[j]:= SumArribos[j] + contViajes[i,j];
                if MaxArribos < Sumarribos[j] then
                   begin
                     MaxArribos:= SumArribos[j];
                     CiudadMaxArribos:= Ciudades[J];
                   end;
           end;
      end;
    j:= 1;
    for i:= 1 to N do
      begin
        writeln (Ciudades[i]:13, '         ', SumSalidas[i],'            ', SumArribos[j]);
        j:= j + 1;
      end;
    writeln;
   If (CiudadMaxArribos = CiudadMaxSalidas) then
        writeln('La ciudad con mas salidas y arribos es: ', Ciudadmaxsalidas)
   else
     writeln('La ciudad donde partieron mas servicios, no es la misma a la que arribaron mas servicios.');
writeln;
  end;

procedure IncisoD(Matriz:Tmatriz; N:byte);
var
i,j, CantPasajes:byte;
Sum, promedio:real;
begin
 Sum:= 0;
 CantPasajes:= 0;
  for i:= 1 to N do
      begin
        for j:= 1 to N do
          begin
              if (Matriz[i,j].AcumPasaje <> 0) then
                 begin
                 Sum:= Matriz[i,j].AcumPasaje + sum;
                 CantPasajes:= CantPasajes + 1;
                 end;
          end;
      end;
  Promedio:= Sum/CantPasajes;
  writeln('La recaudacion Promedio por ruta es $',Promedio:0:2);
end;

var
  Ciudades:TVector;
  Matriz:Tmatriz;
  contViajes: TM2;
  N, i, j:byte;
begin
  N:= 0;
  for i:= 1 to Max do
  begin
    Ciudades[i] := ' ';
    for j:= 1 to Max do
        begin
          Matriz[i,j].AcumPasaje := 0;
          Matriz[i,j].AcumPersonas := 0;
          contViajes[i,j] := 0;
        end;
  end;
  CargaDatos(Ciudades, Matriz, contViajes, N);
  incisoByC(Ciudades, contViajes, N);
  IncisoD(Matriz, N);
  readln;
end.

