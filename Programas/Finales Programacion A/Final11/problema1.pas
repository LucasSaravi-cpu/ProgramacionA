{Una empresa de turismo tiene registro de las salidas de una excursion especial que ofrece , en un archivo de texto salidas.txt , con una salida por linea con los siguientes
datos: hora de salida ( 0 ..23) siempre parten en una hora en punt) dia de la semana de 1..7 y cantidad de plazas ofrecidas . El archio no esta orndenado por ningun criterio y no hay mas de una salida por
hora y dia . se pide :

a)generar una grilla de salida de la excursion donde se vea claramente la oferta para cada dia de la semana y horario
b) generar una estructura con los dias de la semana que ofrezcan un total de mas de X ( valor leido por teclado) plazas , detallando para cada dia la canidad total de plazas y la cantidad
de horas del dia sin salidas . No deben figuar en la estrctura los dias que no cumplan la condicion establecida . Luego listar los datos generados
c) inforar la cantidad total de salidas ofrecidas en un rango horario h1 y h2 con h2>=h1

usar registros vectores y matrices

para respoder lo solicitado deberan utilizar unit viajes.pas la cual debe incluir los tipos de datos necesarios y distintos subprogramas que se ocupen de

procesar el archivo y generar la grilla de salida
mostrar la informacion almacenada en la grilla de salida
procesasr la informacion e informar lo requerido en el inciso b
procesar la informcion e informar lo requerido en el inciso c}

program problema1;
uses viajes;

var
  mat:viajes.mt  ;
  vec:viajes.tVR;
  k:byte;
  n,m,x:byte;
  total,hora1,hora2:byte;


  begin
  leematriz(mat,n,m);
  muestramat(mat,n,m);
  writeln('ingrese la cantidad maxima de plazas');
  readln(x);
  genereArreglo(vec,k,mat,m,n,x);
  Escribevec(vec,k);

  writeln('ingrese la hora minima ');
  readln(hora1);
  writeln('ingrese la hora maxima');
  readln(hora2);

  total:=horastotales(mat, n, hora1,hora2);
  writeln('La cantidad de total de salidas ofrecidas en un rango de ',hora1, 'y de ', hora2,'es ' ,total);

  readln;
  end.
