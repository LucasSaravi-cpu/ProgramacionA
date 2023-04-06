
  {15- Sea A un arreglo de N elementos enteros escribir los elementos positivos y distintos de cero
que se encuentran entre dos negativos consecutivos. }
program Guia7Ejercicio15;
Type
  TV=array[1..50] of integer;

procedure MuestraVec(N:byte;Vec:TV);
var
  i:byte;
begin
  for i:=1 to N do
  write(Vec[i]:4);
end;
var
  arch:text;
  N,i,j,k,l:byte;
  A,B:TV;
begin
  assign(arch,'texto.txt');reset(arch);j:=1;
  readln(arch,N);
  For i:=1 to N do
  read(arch,A[i]);
  for i:=1 to n do
      begin
           if A[i]<0 then
              begin
                   if A[i+1]>=0 then
                      begin
                           k:=2;
                           while (A[i+k]>=0) and ((i+k)<=n) do
                                    k:=k+1;
                           if (i+k)<=N then
                              begin
                                   for l:=1  to (k-1) do
                                   begin
                                     if A[i+l]<>0 then
                                        begin
                                          B[j]:=A[i+l];
                                          j:=j+1;
                                        end;
                                   end;

                              end;



                      end;

              end;
     end;
  writeln('El vector inicial fue: ');
  MuestraVec(n,A);
  writeln;
  writeln('El vector final sera: ');
  MuestraVec(J-1,B);
  close(Arch);readln;
end.


