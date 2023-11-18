{Se tiene el archivo comicios en el que se registraron los resultados de las ultmas elecciones en la ciudad 

archivo comicios

cicuito ( 1° campo de secuenca )
mesa ( 2° campo de secuencia )
cantidad de votos
cargo ( p g s d I C )

Se pide escribir un programa que defina el tipo del archivo y utilice para generar el listado que se muestra

Resultados comicios

circuito xxxx
mesa      cant. votos ejecutivos         cant.votos legislativos
xxxx          999                             999
circuito xxxx
mesa     cant votos ejecutivos           cant votos legislativos
xxxx         999                              999
xxxx         999                              999
xxxx         999                              999

circuito con mas mesas xxxx

nota considere votos ejecutivos  P G I Y  votos legislativos S D C}

program Final3Comicios;

type
   st4 = string[4];
   TRCarMes = record
     Cir, Mes: st4;
     CantVot: word;
     Carg: char;
   end;

   TArCom = file of TRCarMes;

procedure ListadoCom(var ArchCom: TArCom);

var
  CirAct, MesAct, CirMaxMes: st4;
  CarMes: TRCarMes;
  AcumCargEj, AcumCargLeg : word;
  ContMes, MaxMes :byte;

begin
  Reset(ArchCom);

  writeln('Resultado de los comicios':15);

  read(ArchCom, CarMes);
  MaxMes := 0;
  while not Eof(ArchCom) do
        begin
             CirAct := CarMes.Cir;

             writeln('Circuito: ', CirAct);
             writeln('Mesa':10, 'Cant. Votos Ejecutivos':40, 'Cant.Votos Legislativos':40);

             ContMes := 0;


             while CirAct = CarMes.Cir do
                   begin
                        MesAct := CarMes.Mes;

                        AcumCargEj := 0;
                        AcumCargLeg := 0;

                        while (CirAct = CarMes.Cir) and (MesAct = CarMes.Mes) do
                               begin

                                    if Upcase(CarMes.carg) in ['P','G','I'] then
                                       AcumCargEj := AcumCargEj + CarMes.CantVot
                                    else
                                       AcumCargLeg := AcumCargLeg + CarMes.CantVot;


                                    read(ArchCom, CarMes);



                               end;
                       contMes := ContMes + 1;


                        writeln(MesAct :10, AcumCargEj :40, AcumCargLeg:40);


                   end;

             if ContMes > MaxMes then
                begin
                  MaxMes := ContMes;
                  CirMaxMes := CirAct;
                end;

        end;
        writeln(' Circuito con mas mesas ', CirMaxMes);

        Close(ArchCom);
end;

var
  ArchCom : TArCom;

begin
   Assign(ArchCom, 'comicios.dat');
   ListadoCom(ArchCom);

   readln;
end.
