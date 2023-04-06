{3.- Ingresar y almacenar en un arreglo de registros los datos de N autos, por cada uno:
Marca, Modelo (año de fabricación), Patente, VTV (registra si tiene o no la VTV realizada)
Para una determinada MARCA (dato que se ingresa por teclado) se pide generar un arreglo de
registros con los automóviles que no tienen VTV. En el nuevo arreglo se almacenarán
únicamente: Patente, Antigüedad (diferencia entre el año actual y el modelo). Mostrar el arreglo
generado.
}

Program Guia9Ejercicio3;


const
  AnioAct = 2021 ;
Type
  Str = string[15];
  StrPat = String[6];
  TR = record
    Marca:string[15];
    Modelo:Word;
    Patente:StrPat;
    VTV:boolean;
  end;
  Tres = record
    Patente:StrPat;
    Antiguedad:byte;
  end;

  TVdeR=array[1..100] of TR;
  TVdeRes=array[1..100] of TRes;


procedure LeeVecReg(Var R:TVdeR;var N:byte); {Teniendo en cuenta que el programa solo utiliza aquellos automoviles que no tienen VTV, se podria hacer un contador en el for de aquellos autos que
no tienen la VTV, y solo ingresaresos al Vector "R", luego, que el contador pase a ser la variable N, y asi no se desperdicia almacenamiento, pero seria menos reutilizable el codigo}
var
  i:byte;
  Res:Char;
begin
  Writeln('Ingrese la cantidad de autos a evaluar');
  Readln(N);
  For i:= 1 to N do
      begin
         with R[i] do
         begin
              Write('Ingrese la marca del ',i,' auto: ');
              readln(Marca);
              Write('Ingrese el modelo del ',i,' auto: ');
              readln(Modelo);
              Write('Ingrese la patente del ',i,' auto: ');
              readln(Patente);
              Write('Tiene VTV? S/N ');
              readln(Res);
              Res:=Upcase(Res);
              R[i].VTV:=Res='S';
         end;
      end;
end;



Procedure GeneraVec(var Res:TVdeRes;var K:byte;R:TVdeR;N:byte;Marca:Str);
var
  i:byte;
Begin
  K:=0;
  For i:= 1 to N do
         if (not R[i].VTV) and (Marca=R[i].Marca) then
               begin
                 K:=K+1;
                 Res[k].Patente:=R[i].Patente;
                 Res[k].Antiguedad:= AnioAct-R[i].Modelo;
               end;
end;


Procedure MuestraArreglo(A:TVdeRes;N:byte);
var
  i:byte;
begin
 for i:=1 to N do
      Writeln('Auto ',i,' Patente ',A[i].Patente,' , con una antiguedad de ',A[i].Antiguedad,' anios');
end;



var
  A:TVdeR;
  B:TVdeRes;
  N,K:byte;
  Marca:str;
begin
  LeeVecReg(A,N);
  writeln('Ingrese la Marca a verificar');
  readln(Marca);
  GeneraVec(B,K,A,N,Marca);
  Writeln('Los autos de la marca ',Marca,' que no tienen la VTV son: ');
  MuestraArreglo(B,K);
  readln(k);
end.


