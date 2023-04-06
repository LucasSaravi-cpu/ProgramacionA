{Una empresa de transportes realiza envios de cargas , se desea calcular y mostrar el importe a pagar:
Los datos se ingresan por peso de la carga (numero reales) y CATEGORIAS (datos codiicados : 1 comun , 2 esepcial , 3 aereo)
El precio se calcula a $25 por kg para cateroias comun , $32,5 por kg para categoria especial y $ 50 por kgg para categoria aerea
Se cobra recargo por sobrepeso 30% si sobrepasa los 15kg , 20% si pesa mas de 10kg y hasta 15kg inclusive , 10% mas de 5kg y hasta 10 kg inclusive}

program Guia3Ejercicio12B;
var
peso,precio,imp:real;
categoria:char;
begin
writeln('Escriba el peso de la carga');
readln(peso);
writeln('ingrese la categoria de transporte');
writeln('C comun');
writeln('E especial');
writeln('A aereo');
readln(Categoria);

categoria:=upcase(categoria);   {  devuelve la mayuscula del argumento}

case categoria of
'C':precio:=25;
'E':precio:=32.5;
'A':precio:=50;
end;

Imp:=peso*precio;

If (peso>5) and (peso <=10) then
    imp:=imp*1.1
else
  If (peso>10) and (peso <=15) then
      imp:=imp*1.2
  else
     if peso>15 then
        imp:=imp*1.3 { El 1.3 es la recarga del 30%}
     else
         imp:=imp;

writeln('El precio del transporte es %',imp:8:2);

readln;

end.

