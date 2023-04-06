program Guia9Ejercicio4;
{4.- Leer un conjunto de números reales desde un archivo de texto considerando que los ceros
separan secuencias. Generar un arreglo de registros que contenga para cada secuencia:
 - cantidad de positivos
 - cantidad de negativos
no generar elemento en el arreglo si alguna de las dos cantidades es cero.
Mostrar el arreglo generado.}
Type
  TR = record
    Positivos,Negativos:byte;
  end;
  TV = array[1..10] of TR;
procedure AsignaRegInd(var R:TV;var J:byte;Pos,Neg:byte);
begin
  if (Pos<>0) and (Neg<>0) then
            begin
                J:=J+1;
                R[j].Positivos:=Pos;
                R[j].Negativos:=Neg;
            end;
end;
Procedure AsignaRegTot(var R:TV;var j:byte);{asigna valor a la totalidad del vector}
var
  Num:real;
  Pos,Neg:byte;
  Arch:text;
begin
  Assign(Arch,'Texto.txt');reset(Arch);
  j:=0;
  while not eof(Arch) do
        begin
          Pos:=0;Neg:=0;
          Read(Arch,Num);
          while Num<>0 do
                begin
                     if Num > 0 then
                         Pos:=Pos+1
                     else
                         Neg:=Neg+1;
                     Read(Arch,Num);
                end;
{¿ Es recomendable asignar una sentencia if Num<>0 then, para evitar llamar al procedimiento si hay 2 0 seguidos en el archivo ? no lo puse ya que asumo que la persona que arma el archivo, usa los 0 correctamente, pero en todo caso ahi esta la posibilidad}
          AsignaRegInd(R,J,Pos,Neg);
        end;
  close(Arch);
end;
Procedure EscribeReg(R:TV;N:byte);{lee registros}
var
  i:byte;
begin
  for i:=1 to N do
      begin
        Writeln('Conjunto ',i);
        writeln('Positivos: ',R[i].Positivos);
        Writeln('Negativos: ',R[i].Negativos);
        writeln;
      end;
end;

{PROGRAMA PRINCIPAL}
var
  R:TV;
  N:byte;
begin
  AsignaRegTot(R,N);
  EscribeReg(R,N);
  Readln;
end.



