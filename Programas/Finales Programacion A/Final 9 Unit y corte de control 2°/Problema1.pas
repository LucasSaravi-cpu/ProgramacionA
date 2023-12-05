{
Dada La unit 
unit ABC;



interface
 Const
   TOPE =10;

type

   MT = array[1..TOPE,1..TOPE] of char;

  TR1 = record
   col:byte;
   porc:real;
  end;
TVr = array[1..TOPE] of TR1;


procedure cargamatriz(var mat:mt ;var n,m:byte );
procedure Escribevec( vec: tvr;  n:byte);

Lee una desde unit abc una matriz de caracteres mat de N*M A PARTIR DE ESA MATRIZ GENERAR E IMPRIMIR UN ARREGLO  donde cada 
componente almacenara C y el porcentaje de las letras sobre el total de caracteres de la columna C si esta contiene al menos una letra . En caso contrario no generar elementos

4 6
5 a 1 d ) #
$ 3 = e ( 4
% * 1 \ @ 3
8 B & k i c



}

program problema1;
uses ABC;

var
  mat:ABC.mt  ;
  vector:ABC.tVR;
  k:byte;
  n,m:byte;


  begin
  cargamatriz(mat,n,m);
  leemat(mat,n,m);
  genereArreglo(vector,k,mat,n,m);
  escribevec(vector,k);
  readln;
  end.
