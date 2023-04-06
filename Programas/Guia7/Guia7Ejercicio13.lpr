{ Una estaci¢n de peaje registra por cada veh¡culo:
 Categoria (1..6)
 Hora(0..23)
Se considera horario pico los intervalos [6 , 9] y [17 , 20].
Los precios seg£n categor¡a deber n declarase en una vector constante con los siguientes valores:
(8, 10, 15, 20, 35, 60).
Se pide leer de un archivo los datos de los veh¡culos, para calcular e informar cuanto se recaud¢ en
cada categor¡a, considerando que las horas pico incrementan el costo en un 10% }


program Guia7Ejercicio13;
type
	tvcategoria = array [1..6] of real;
	tvtarifa = array [1..6] of real;

const
	tarifa:tvtarifa=(8,10,15,20,35,60);         //Indice con significado

Procedure IniciaVec(Var categoria:tvcategoria);
Var
i :byte;
Begin
for i := 1 to 6 do
categoria[i]:=0;
end;

Procedure Carga (Var categoria,total:tvcategoria);
Var
 Arch: text;
 Precio:real;
 hora,cat:byte;
Begin
 Assign(Arch, 'Guia7Ejercicio13.txt');
 Reset (Arch);
 While not eof(Arch) do
  begin
  IniciaVec(categoria);
  Readln (Arch,cat,hora);
  Precio := tarifa[cat];
  if hora in [6..9,17..20] then
    Precio := Precio * 1.1;

  total[cat]:= total[cat]+ Precio;
  End;
Close(Arch)
end;


Procedure Escribe (total: tvcategoria);
Var
Sum : real; i : byte;
Begin
Sum := 0;
for i:= 1 to 6 do
Begin
Sum := Sum + Total[i];
Writeln(Total[i]:8:2);
end;
Writeln('Total', Sum:8:2);
end;
var
	categoria,total:tvcategoria;

begin
IniciaVec(categoria);
carga (categoria,total);
escribe (total);
readln;
end.

