program cervecerias;

type
  TCerveceria = record
    nombre: string[4];
    cobro: real;
  end;

  TRepartidor = record
    nombre: string[10];
    cervecerias: array of TCerveceria;
  end;

var
  repartidores: array of TRepartidor;
  archivo: text;
  cantidadRepartidores, i, j: byte;
  cerveceria: TCerveceria;
  repartidor: TRepartidor;

procedure leevector();
begin
  assign(archivo, 'cervecerias.txt');
  reset(archivo);

  readln(archivo, cantidadRepartidores);

  SetLength(repartidores, cantidadRepartidores);

  for i := 0 to cantidadRepartidores - 1 do
  begin
    read(archivo, repartidores[i].nombre);
    SetLength(repartidores[i].cervecerias, 0);

    while not eoln(archivo) do
    begin
      read(archivo, cerveceria.nombre, cerveceria.cobro);
      SetLength(repartidores[i].cervecerias, Length(repartidores[i].cervecerias) + 1);
      repartidores[i].cervecerias[High(repartidores[i].cervecerias)] := cerveceria;
    end;

    readln(archivo); // Leer la línea en blanco después de '****'
  end;

  close(archivo);
end;

begin
  leevector();

  // Mostrar la información leída
  writeln('Cantidad de repartidores: ', cantidadRepartidores);
  for i := 0 to cantidadRepartidores - 1 do
  begin
    writeln('Repartidor: ', repartidores[i].nombre);
    for j := 0 to High(repartidores[i].cervecerias) do
    begin
      writeln('  Cervecería: ', repartidores[i].cervecerias[j].nombre, ', Cobro: ', repartidores[i].cervecerias[j].cobro:0:2);
    end;
  end;
end.

