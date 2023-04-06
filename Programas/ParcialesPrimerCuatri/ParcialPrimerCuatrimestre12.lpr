{ La empresa de venta de Electrodomesticos " La heladera loca " tiene distntas sucursales en la ciudad y lleva en un archivo diario ,
registro de los electrodomesticos que tiene que transfportar desde su deposito central a las distintas sucursales. Los electrodomesticos se categorizan en 4 rubros
informatica -i
cocina- c
multimedia - m
varios - v

El precio de cada articuo es por unidad

informar
a) nombre de la sucursal y un detalle para cada articulo transportado a dicha sucursal ,mostrar el nombre del articulo , tipo . cantidad de ese articulo , y el valor total y el seguro

seguro
el seguro de transporte equivale al 10% del valorde los articulos
si el rubro es multimedia o informatica el seguro es del 20
si la cantidad de items del articulo es superior a 4 se le aplica un descuento del 5

b) para cada sucursal, el valor total de los articulos transportados a la misma y el importe promedio por item pagado en seguros

c) finalmente , mosrar el nombre de la scurusal que menos cantidad de articulos recibio y cual fue esa cantidad


}


program ParcialPrimerCuatrimestre12;

function Seguro(valor:real;rubro:char;cantidadItem:byte):real;

begin
Seguro:=valor*0.1;


if (rubro='M') or (rubro='I') then
   Seguro:=valor*0.2;
If cantidadItem>4 then
   Seguro:=Seguro-(Seguro*0.05);

end;



var
arch:text;
rubro,ru:char;
valor:real;
nombre,Minsucu:string[6];
cantidadItem:byte;
articulo:string[13];
cantidadArticulos, cantItems:byte;
i:byte;
total,TotalSeguros:real;
ValorTotal,TransporteSeguro:real;
min:byte;
begin

assign(arch,'ParcialPrimerCuatrimestre12.txt');
reset(arch);
min:=99999;
while not eof(arch) do
    begin
     readln(arch,nombre,cantidadArticulos);
     Total:=0;
     TotalSeguros:=0;
      cantItems:=0;
     writeln('Sucursal  ',nombre);
     for i:=1 to cantidadArticulos do
        begin
        readln(arch,articulo,ru,rubro,cantidadItem,valor);
        ValorTotal:=cantidadItem*valor;
        cantItems:=cantItems+cantidadItem;
        Total:=Total+ValorTotal;
        TransporteSeguro:=Seguro(ValorTotal,rubro,cantidaditem);
        TotalSeguros:=TotalSeguros+TransporteSeguro;

        writeln(articulo,'','  Rubro ',rubro,'  cantidad de articulos ', cantidadItem, ' Valor total de los articulos  ', ValorTotal:8:2 , '  y su seguro es de  ' ,TransporteSeguro:8:2);

        end;


    writeln('El valor total de los articulos transportados es ' , total:8:2 , ' y el importe promedio por item pagado en seguros' , TotalSeguros/cantItems:8:2 );


      if cantItems<min then
         begin

         min:=cantItems;
         minSucu:=nombre;
         end;
   end;

writeln('LA SUCURSAL CON MENOS CANTIDAD DE ARTICULOS ES ',minSucu, ' y la cantidad de articulos es de ' , min);



readln;

end.

