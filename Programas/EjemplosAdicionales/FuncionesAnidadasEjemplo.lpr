{Para cada uno de N clientes de una compañía de electricidad, se tienen los siguientes datos:
Número de cliente
Estado actual del medidor (en kw)
Estado anterior del medidor
Desarrollar un programa que lea desde teclado los datos de los clientes, calcule el consumo,      el importe e imprima las boletas.
La boleta deberá contener:
el  número de usuario
la cantidad de Kw consumida
el importe.
Para  este último considerar básico fijo de $50 y más un monto variable que depende del consumo, en base a este se establece el precio por kw :
   $0.54              	        consumo <= 100
   $0.48     		100 < consumo <= 250
   $0.37     		250 < consumo}

program FuncionesAnidadasEjemplo;

Function Precio (Consum : word) : real;  {define función, Consum parámetro de entrada}
Begin
    If Consum <= 100 then
        Precio := 0.54
    else
        if Consum <=250 then
           Precio := 0.48
        else
          Precio :=0.37;
End;
Procedure Boleta (EstAct, EstAnt : word; Var Imp: real; Var Cons : word);
Begin
    Cons := EstAct - EstAnt;
    Imp := 50 + Cons * Precio(Cons); {invoca función, el parámetro actual es parámetro formal}
End;


Procedure Imprime( NroUsua: String ; Imp : real;      Cons : word);
begin
    Writeln('Usuario', NroUsua);
    Writeln('Consumo', Cons);
    Writeln('Importe', Imp:0:3);
End;
{Programa Principal}
Var
    NroUsu: string [10];
    Cons, EstAct, EstAnt, I, N : word;
    Imp:real;
Begin
 Write('Ingrese cantidad de usuarios');  Readln(N);
 For I:= 1 to N do
 Begin
    writeln('ingrese nombre de usuario');
    Readln ( NroUsu);
    writeln('Ingrese estado actual ');
    Readln ( EstAct);
    writeln('Ingrese estado anterior');
    readln(EstAnt);
    Boleta (EstAct, EstAnt, Imp, Cons);
    Imprime (NroUsu ,Imp, Cons);
 end;
readln;
End.

