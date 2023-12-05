{Se tiene el archivo Comicios en el que se registraron los resultados de las últimas elecciones en una ciudad: 
Archivo Comicios 
• Circuito (cadena de 4, 1
er Campo de secuencia - Clave Secundaria) 
• Mesa (cadena de 4, 2
do Campo de secuencia - Clave Secundaria) 
• Cantidad de votos 
• Cargo (los valores para este campo pueden ser: P, G, S, D, I, C) 
Se pide escribir un programa Pascal que defina el tipo del archivo y lo utilice para generar el listado que se muestra 
más abajo. 
 
 Resultado de los Comicios 
Circuito xxxx 
 Mesa Cant. Votos Ejecutivos Cant. Votos Legislativos 
 xxxx 999999 999999 
 xxxx 999999 999999 
 …… .. ……… 
Circuito xxxx 
 Mesa Cant. Votos Ejecutivos Cant. Votos Legislativos 
 xxxx 999999 999999 
 xxxx 999999 999999 
 …… .. ……… 
Circuito con mas mesas xxxx 
Notas: Considerar 
- Votos ejecutivos P, G, I 
- Votos Legislativos S, D, C
}

program TrabajoPractico1;

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

