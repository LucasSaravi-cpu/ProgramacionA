program project1;

type
  TCerveceria = record
    nombre: string[4];
    cobro: real;
  end;

  TRepartidor = record
    nombre: string[4];

  end;

  TV = Array [1..50] of  TCerveceria;
   TV2 = Array [1..50] of  TRepartidor  ;

var

  cerveceria: tv;
  repartidor: tv2   ;
  archivo:text;

procedure leevector(var cerveceria: tv ; var repartidor: tv2);
var
  i,j:byte;
  cantidadrepartidores:byte;

begin
  assign(archivo, 'text.txt');
  reset(archivo);

  readln(archivo, cantidadRepartidores);

   for i:= 1 to cantidadrepartidores do
      begin

    read(archivo, repartidor[i].nombre);

       j:=1;
       while ( cerveceria[j].nombre<>'****') do
          begin
              read(archivo, cerveceria[i].nombre, cerveceria[i].cobro);

           j:=j+1;
           end ;
       readln(archivo);
       end;


  close(archivo);
end;

begin
  leevector(cerveceria , repartidor);

  readln;
end.    

