{ A partir de un archivo de texto que contiene en cada línea dos reales que representan un punto en el
plano, Calcular para dichos puntos la distancia promedio, además cual registra la distancia máxima y la
mínima al centro, indicando a que cuadrante pertenece.
}


program Guia6Ejercicio6;

uses Varios;

var
  arch: text;
  x,y, xt, yt,SumaDistancia, lejos, cerca,d: real;
  CuadranteCerca,CuadranteLejos,cuentaDistancia,cont:byte;
  cuadc, cuadl : string;

begin
        //  asignacion de archivos
  Assign(arch, 'Guia6Ejercicio6.txt');
  reset(Arch);
  read(arch,x,y);
  cerca:=cuadrante(x,y);
  CuadranteCerca:=cuadrante(x,y);
  reset(Arch);
  lejos:=0;
  cont:=0; { Este contador se usa solo para que el primer numero no lo Sume}
  SumaDistancia:=0;
  CuentaDistancia:=0;
  xt := 0; yt := 0;
  while not EoF(arch) do
        begin
        readln(arch,x,y);
        cont:=cont+1;

        d:=distancia(0,0,x,y); {distancia al centro}
        if d > lejos then
           begin
                lejos := d;
                CuadranteLejos:=cuadrante(x,y);
           end;
        if d < cerca then
           begin
                cerca := d;
                CuadranteCerca:=cuadrante(x,y);
           end;


          if cont>=2 then    {Los Suma Apartir del segundo punto , el primero no lo hace ya que no tiene con quien compararce}
             begin
                  sumaDistancia := SumaDistancia + distancia(xt,yt,x, y);
                  CuentaDistancia:=CuentaDistancia+1;
             end;
           xt := x;      {Guarda los puntos para comprarlos con los que sigue}
           yt := y;

        end;

  case CuadranteCerca of
       0 : cuadc := 'origen';
       1 : cuadc := 'primero cuadrante';
       2 : cuadc := 'segundo cuadrante';
       3 : cuadc := 'tercero cuadrante';
       4 : cuadc := 'cuarto cuadrante';
       5 : cuadc := 'eje x';
       6 : cuadc := 'eje y';
  end;
  case CuadranteLejos of
       0 : cuadl := 'origen';
       1 : cuadl := 'primer cuadrante';
       2 : cuadl := 'segundo cuadrante';
       3 : cuadl := 'tercero cuadrante';
       4 : cuadl := 'cuarto cuadrante';
       5 : cuadl := 'eje x';
       6 : cuadl := 'eje y';
   end;
writeln('Distancia promedio ',SumaDistancia/CuentaDistancia:0:4);
writeln('La distancia Minima es ',cerca:0:4,' y esta en el ',cuadc);
writeln('La distancia Maxima es ',lejos:0:4,' y esta en el ',cuadl);
close(arch);
readln;
end.
