{El siguiente programa utiliza alguna de las facilidades que brinda Varios }
{Probar utilizando el siguiente lote de datos:
3 2 1  se visualiza 1 2 3
500 900  se visualizan 6 numeros aleatorios entre 500 y 900
22 121  se visualiza 11
12 8  se visualiza 24 }

Program Guia6Ejercicio3;
Uses
 Varios;
Var
 A, B, C :real;
 N1, N2, i: word;
Begin
writeln('Ingrese tres numeros para ordenar');
Readln(A, B, C);
OrdenaTres(A, B, C);
Writeln(A:2:0, B:2:0, C:2:0);
writeln('Ingrese extremos de la secuencia aleatoria');
Readln(N1, N2);
Randomize;
for i:= 1 to 6 do
 write(Aleatorio (N1, N2):7);
writeln;
writeln('Ingrese dos enteros para calcular MCD');
Readln(N1, N2);
writeln(MCD(N1, N2));
writeln('Ingrese dos enteros para calcular MCM');
Readln(N1, N2);
writeln(MCM(N1, N2));
Readln;
End.
