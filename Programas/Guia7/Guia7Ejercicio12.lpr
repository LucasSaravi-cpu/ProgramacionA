{Se leen N n£meros (ingresan desde un archivo de texto NUMEROS.TXT), insertarlos en un
arreglo de forma que queden ordenados en forma ascendente. Mostrar el arreglo obtenido.

}

program  Guia7Ejercicio12;
Type

Tv=array[1..50] of real;

Procedure Ordenado ( Var V: TV; Var n: Byte; X: Real);
Var
J: Byte;
Begin
J:= N;
While ( J>0 ) and ( V[ J ] > X ) do
Begin
V[ J+1 ] := V [ j ] ; J := J-1;
End;
V[ J+1 ] := X ;
N := N+1;
End;

Procedure leevector(var v:tv; var n:byte);
var
arch:text;
x:real;
begin
assign(arch,'Guia7Ejercicio12.txt');
reset(arch);
while not eof(Arch) do
   begin
   readln(Arch,x);
   Ordenado(v,n,x);
   end;
close(Arch);
end;

  Procedure EscVector ( V : TV; L : byte);
Var
i : byte;
Begin
For i:=1 to L do
Writeln(V[i] : 8:2)
End;


var{pp}
v:tv;
n:byte;
begin{pp}
leevector(v,n);
escvector(v,n);
readln;
end.

