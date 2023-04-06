{Una empresa de transportes realiza envios de cargas , por cada bulto se ingresa PESO de la carga (numero real) y CATEGORIA ( datos 1- comun
2- especial , 3 - aereo)
El precio se calcula a $25 por kg para categoria comun , 32,5$ por kg para categoria especial y $50 por kg para categoria aerea. Se cobra recargo por sobrepeso
30% si sobrepasa los 15 kg , 20% si sobrepasa los 10kg y 10 % mas de 5 kg y hasta 10 kg inclusive
Se desea calcular y mostrar el importe a pagar por cada uno de los n bultos al final del proceso el total recaudado en cada una de las tres categorias
Implementar y utilizar funcon precio correctamente parametrizada que devueva el importe a pagar por un bulto}

program Guia5Ejercicio4;

function precio(peso:Real;tipo:char):real;
var
  importe:real;
begin
  importe:=0;

  case tipo of
  '1':Importe:=peso*25;
  '2':importe:=peso*32.5;
  '3':importe:=peso*50;
  end;

  if peso > 15 then
    importe:=importe*1.3
  else
    if peso>10 then
      importe:=importe*1.2
    else
        if (peso>5) and (peso<=10) then
           importe:=importe*1.1;

  precio:=importe;
end;


var
 n,i:byte;
 peso,sum1,sum2,sum3:real;
 tipo:char;
begin
  sum1:=0;
  sum2:=0;
  sum3:=0;
  writeln('Ingrese cantidad de paquetes');
  readln(n);
  for i:=1 to n do
     begin
     writeln('Ingrese el peso');
     readln(peso);
     writeln('ingrese el tipo');
     readln(tipo);

     writeln('El precio a pagar por el paquete es',precio(peso,tipo):8:2);

     case tipo of
     '1':sum1:=sum1+precio(peso,tipo);
     '2':sum2:=sum2+precio(peso,tipo);
     '3': sum3:=sum3+precio(peso,tipo);
     end;
     end;
  writeln('Total a pagar categoria 1',sum1:8:2, 'categoria 2' , sum2:8:2,'categoria 3',sum3:8:2);
  readln;

end.

