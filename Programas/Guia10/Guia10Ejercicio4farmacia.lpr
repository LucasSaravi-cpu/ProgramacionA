{Una drogueria vende medicamentos a distintas farmacias , registra dichas operaciones en el archivo VENTAS de la sigueinte forma :
cod farmacia (ANUS , campo de secuencia , clave secundaria
cod.Medicamento(ANU3)
cant envases
venta libre (s/n)

A partir de larchivo listar para cada farmacia
El codigo de la farmacia , la cantidad de meicamentos venta libre y la cantidad con receta , el codigo de medicamento con mas envases vendidos

por fin de proceso el promedio e medicamentos ( no de envases ) vendidos por farmacia )

El listado debera tener el siguiente formato

cod farmacia   cant envases (V/l)   cant envases c/r cod.Medicamentos mas envases
xxxxxx               999                    999              999

promedio de medicamentos vendidos por farmacia 99999

    }


program project1;

type
  st5=string[6];
TRfarmacia=record
  codFarm:st5;
  codmedicamento:word;
  cantenvases:word;
  ventalibre:char;  //SI O NO

  end;

Tarfarmacia = file of TRfarmacia;

procedure ListadoFarmacia(var arch:Tarfarmacia);
var
farma:TRfarmacia;
farAct:st5;
max:byte;
maxmed:word;
cantVL,cantCR, contaventalibre, contar:byte;

begin

  Reset(arch);
  writeln('Resultados de las farmacias ');
  writeln('codfarmacia':10, 'cantenvasesVL':40, 'cantenvasesCR':40,'codigomedicamento':20);

   read(Arch,farma);
  max:=0;
  while not Eof(arch) do

    begin

    farAct:= farma.codFarm;

      cantVL:=0;
      cantCR:=0;
       contaventalibre:=0;
        contar:=0;

    while  (farAct=Farma.codFarm)  do
         begin


         if (farma.ventalibre='S') then
            begin
            cantVL:=cantVL+farma.cantenvases ;
            contaventalibre:=contaventalibre+1;
            end
         else

            cantCR:=cantCR+farma.cantenvases;


            contar:=contar+1;
        if farma.cantenvases>max then
           begin
           max:=farma.cantenvases;
           maxMed:=farma.codmedicamento;
           end;

              read(Arch,farma);

         end;

           writeln(faract:10, cantVL:40, cantCR:40,maxmed:20);
           writeln('El promedio de esta farmacia es', contar/ contaventalibre:8:2);


    end;
close(Arch);

end;




var
  arch:Tarfarmacia  ;
begin
  Assign(arch,'farmacia.dat');
  ListadoFarmacia(arch);
  readln;
end.

