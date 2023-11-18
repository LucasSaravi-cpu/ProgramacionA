{Se conocen el nombre de la clase ( L libreria - I - iluminacion J - Jugueterua ) y el precio de N articulos . Se pide ingresar dicha informacion en un arreglo de registros
para luego

a) calcular el % de una determinada clase ( L I o J) que se ingreso por teclado sobre los N articulos

b) para un conjunto de articulos ( no se conoce cuantos son ) . Ingresar sus nombres e informar sus datos (clase y precio ) e indicar cuantos articulos se econtrarion

El programa que resuelva lo pedido debera utilizar la Unit Vectores , la cual debe incluir los tipos de datos necesarios y 3 subprogramas que se ocupen de
1. la lectura del arreglo
2. de calcular la cantidad de articulos de una clase recibida como parametro
3. de buscar en el arreglo un articulo recibido como parametro.

         }


program Final1;

uses vectores;

Type
st11=string[11];

TR1=record
nom:st11;
esp:char;
cla:char;
pre:real;
end;

tv=array[1..20] of tr1;



var
vec:vectores.tv;
n:byte;
cla,clase:char;
prom:real;
nombre:string[11];
es,con:byte;


begin
vectores.cargaVector(vec,n);
vectores.LeeVec(vec, n);


writeln('ingrese la clase para sacar su promedio I J o L si no ingrese 1 para salir ');
readln(Clase);

while clase<>'1' do
begin
If (clase='L') or (clase='J') or (clase='I') then
  begin
   prom:=promedio(vec,clase,n);
    writeln('El promedio de la letra elejida es de ' , prom:8:2);
  end
else
   writeln('La letra ingresada es incorrecta');

writeln('ingrese la clase para sacar su promedio I para iluminacio, J para jugueteria o L para libreria , si no ingrese 1 para salir ');
readln(Clase);






end;

Writeln('Ingrese el nombre que quiere saber si esta');
readln(nombre);

es:=esta(vec,n,nombre);

if (es=1) then
   writeln('El producto esta')
else
  writeln('El producto no esta ');


writeln('Ingrese la clase que queire contar ');
readln(cla);

con:=contar(vec,n,cla);
writeln('la cantidad de objetos de la clase ', cla , ' es ',con  );

readln;
end.

