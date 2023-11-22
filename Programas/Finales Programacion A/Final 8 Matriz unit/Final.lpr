{Dada una matriz entera A de N x N elementos , se soliita :

a) Leerla y mostrarla . Desarrollar ambos subrogramas en unit aparte y utulizarla desde el programa que resuelve el ejercicio
b)Obtener el promedio de los primeros elementos de cada filay generar un arreglo de registro V con aquellas filas en las qe el elemento de la diagonal prinipal  sea mayor o igual
al promedio obtenido , cada registro debe almacenar
fila (entero)
valor diag principal(entero)
porcenaje (real) con el que el elemento de la digagonal principal supera al PROMEDIO
Cantidadintermedios(entero) cantidad de elementos de la fila cuyo valor supera al promedio , pero  es menor al elemento de la diagonal principal de dicha fila

no generar elementos para las filas que no cumplan la condicionpedida

c) mostrar el arreglo generado
d) a partir del arreglo indicar la fila con la maor cantidad de elementos intermedios


Ejemplo

n=5

A= 8 2 3 9 1
   11 18 15 1 6
   14 25 13 3 -6
   10 -1 20 5 9
   12 15 16 13 17


   resultados

promedio = 11

v= 2 18  63,6 1   3 13 18.1 0  5 17 54.5 4

la fila 5 es la que tiene mayor cantidad de valores intermedios  4}

program final;
uses matriz;
type
  RegistroV = record
    fila: byte;
    valorDiagonal: integer;
    porcentaje: Real;
    cantidadIntermedios: integer;
  end;

MT = array[1..20,1..20] of integer;
TV= array[1..20] of RegistroV;



Function PromedioFila(n:byte;A:matriz.mt):real;
var
  i, suma:byte;
begin

  suma:=0;
    for i := 1 to N do
      begin

      suma := suma + A[i, 1];
      end;



  promedioFila := suma / N;
end;

procedure GenerarArregloV(var    v:TV;     var count: byte;  A:matriz.mt ; n :byte);
var
  i, j, sumaIntermedios:byte;

begin
  count := 1;

  for i := 1 to N do
  begin
     if (A[i, i] >= promedioFila(n,A) )then
       begin

      V[count].fila := i;
      V[count].valorDiagonal := A[i, i];

      sumaIntermedios := 0;

      for j := 1 to N do
      begin
        if (A[i, j] > promedioFila(n,A)) and (A[i, j] < A[i, i]) then
          sumaIntermedios := sumaIntermedios + 1;



      end;

      V[count].cantidadIntermedios := sumaIntermedios;

        V[count].porcentaje := ((A[i,i]-promedioFila(n,a))/promediofila(n,a)) * 100 ;



      count := count + 1;

  end;

    end;


end;


 procedure MostrarArregloV(  v:TV; count: byte);
var
  i: byte;
begin
  writeln('Arreglo V generado:');
  writeln('Fila | Valor Diagonal | Porcentaje | Cantidad Intermedios');
  for i := 1 to count  do
  begin
    writeln(V[i].fila:4, ' | ', V[i].valorDiagonal:15, ' | ', V[i].porcentaje:8:2, '% | ', V[i].cantidadIntermedios:21);
  end;
end;



procedure EncontrarFilaMaxIntermedios( v:TV; count: byte);
var
  i, maxIntermedios, filaMaxIntermedios: Integer;
begin
  maxIntermedios := 0;


  for i := 1 to count  do
  begin
    if V[i].cantidadIntermedios > maxIntermedios then
    begin
      maxIntermedios := V[i].cantidadIntermedios;
      filaMaxIntermedios := V[i].fila;
    end;
  end;

  writeln('La fila con la mayor cantidad de elementos intermedios es la fila ', filaMaxIntermedios);
end;


var
  mat:matriz.mt  ;
  n,l,count:byte;
  v:TV;
  begin
  matriz.cargamatriz(mat,n);
  matriz.leemat(mat,n);
  GenerarArregloV(v,count,mat,n);
  mostrarArregloV(v,count);
  EncontrarFilaMaxIntermedios( v, count) ;
  readln;
  end.
