program Guia7EliminarInsertarIntercalar;
const
      max=100;        //Dimencion fisica

TYPE TV=array[1..max] of byte;

procedure LeeVector(Var v:TV ; n:byte);
var
  i:byte;
begin
  for i:=1 to n do        //dimencion logica(utilizado)
     begin
       write('Ingrese el elemento');
       readln(V[i]);
     end;

end;


procedure elimina(Var v:tv; var n:byte; pos:byte);
var
i:byte;
begin                                  //Eliminar un numero
if pos<= n then                         //Eliminar  todos los numeros iguales a 7
  begin
  for i:=pos to n-1 do
      V[i]:=v[i+1];     //Corre todos los valores , hago un corrimiento de los elementos posteriores

  n:=n-1

  end;
end;


 procedure Inserta(var v:tv; var n:byte; pos:byte; x:integer);
 var
 i:byte;
 begin
 if (pos>=1) and (pos <=n+1) then
    begin
    for i:=N downto pos do
         v[i+1]:=V[i];          //corrido del ultimo al primero de derecha a izquierda
         v[pos]:=x;
         N:=n+1;
    end;                            //incrementa N
 end;

procedure Escribevector(v:tv;n:byte);
var
i:byte;
begin                  // En vez de eliminar e insertar v[pos]:=N
for i:=1 to n do
   write(v[i]);
end;

var
  n:byte;
  A:TV;
  pos,pos2,num:byte;

begin
  writeln('Escriba la dimension del arreglo');
  readln(n);
  Leevector(A,N);

  writeln('Escriba la posicion que quieras eliminar');
  readln(pos);

  elimina(A,n,pos);

  writeln('Escriba la posicion donde insertar');
  readln(pos2);
  writeln('Ingresar el numero el cual quiera insertar');
  readln(num);
  Inserta(A,n,pos2,num);
  Escribevector(A,N);
  readln;
end.

