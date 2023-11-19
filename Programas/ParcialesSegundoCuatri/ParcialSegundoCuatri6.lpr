program parcialsegundocuatri6;

type
  st4 = string[4];

Function Efectividad(cantVisitas: byte; promCobrado: real): byte;
begin
  if promCobrado >= 1000 then
     Efectividad := 1
  else
     if (cantVisitas >= 3) and (promCobrado > 500) then
        Efectividad := 2
     else
        Efectividad := 3;
end;

var
  Arch:text;
  i,n: byte;
  repartidor, cerveceria: st4;
  car: char;
  impoCobrado: real;  
  cantCobrosRepa: byte;
  sumCobrosRepa, promCobrosRepa: real;
  menorPago: real;
  cervMenorPago: st4;
  maxVisitasPorRepa: byte;
  repMaxVisitas: st4;
  totCobrado: real;
  cantTotCobros: byte;
begin
 menorPago := 999999999;
 maxVisitasPorRepa := 0;
 totCobrado := 0;
 cantTotCobros := 0;
 Assign(Arch,'text.txt');
 Reset(Arch);
 Readln(Arch, n);
 for i:=1 to n do
 begin
    Read(Arch, repartidor, car, cerveceria);
    cantCobrosRepa := 0;
    sumCobrosRepa := 0;
    while cerveceria <> '****' do
    begin
       Read(arch, impoCobrado);
       cantCobrosRepa := cantCobrosRepa + 1;
       sumCobrosRepa := sumCobrosRepa + impoCobrado;
       if impoCobrado < menorPago then
       begin
         menorPago := impoCobrado;
         cervMenorPago := cerveceria;
       end;

       Read(Arch, car, cerveceria);
    end;
    Readln(Arch);
    if cantCobrosRepa  > 0 then
         promCobrosRepa := sumCobrosRepa / cantCobrosRepa
    else promCobrosRepa := 0;
    writeln(repartidor, ' ', cantCobrosRepa, ' ', sumCobrosRepa:8:2, ' ',
            Efectividad(cantCobrosRepa, promCobrosRepa));  // a)
    if cantCobrosRepa > maxVisitasPorRepa then
    begin
      maxVisitasPorRepa := cantCobrosRepa;
      repMaxVisitas := repartidor;
    end;
    totCobrado := totCobrado + sumCobrosRepa;
    cantTotCobros := cantTotCobros + cantCobrosRepa;
 end;
 Close(Arch);
 writeln('La cerveceria que efectuo el menor pago fue ', cervMenorPago); // b)
 writeln('El repartidor que visito mas cervecerias fue ',
         repMaxVisitas, '= ', maxVisitasPorRepa); // c)
 if cantTotCobros > 0 then
    writeln('Total cobrado = ', totCobrado:0:2,
            '    Cobro Promedio = ', totCobrado / cantTotCobros:0:2) // d)
 else writeln('NO se registraron cobros');

 Readln;
end.

