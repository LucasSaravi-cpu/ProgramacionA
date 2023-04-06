program Ejercicio1;
Procedure (n:word);
var
  i,contA,contB,contAB,contNoAsiB,ContSiAnoB,contNoaNoB:word;
  aceptaA,AceptaB:byte;
begin
    contA:=0;
    contB:=0;
    contAB:=0;
    contNoAsiB:=0;
    ContSiAnoB:=0;
    contNoaNoB:=0;
    for i:=1 to n do
        begin
          writeln('Ingrese si acepta(1) y si no acepta(0) , Para producto A y Producto B');
          readln(aceptaA,AceptaB);

          if acepta=1 then
             begin
              contA:=ContA+1
              if aceptaB=0 then
                 contSiAnoB:=ContsiAnoB+1
              else //aceptaB =1
                 begin
                 contAB:=ContAB+1;
                 contB:=contb+1;
                 end;
              END
          else //aceotaA =0
          begin
            if aceptaB=0 then
               contNoAnoB:=ContnoAnoB+1
            else // acepta B=1
               BEGIN
                contNoAsiB:=ContNoAsiB+1;
                contB:=contB+1;
               end;
          end;
        end;


var
  N:word;
begin
  write('ing.cantidad personas: ');
  readln(n);

end.

