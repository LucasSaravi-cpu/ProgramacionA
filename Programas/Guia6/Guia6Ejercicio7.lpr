program Guia6Ejercicio7;

uses varios;
var
  txt1: text;
  C1, C2, C3 : longint;
  CS : integer;
  Num : longint;
begin
  Assign(txt1, 'Guia6Ejercicio7.txt');
  reset(txt1);
  cs := 0;
  while not EoF(txt1) do
        begin
             Read(txt1, Num);
             if num<>0 then
                begin
                     if (Capicua(Num)) then
                        begin
                             Cs := cs + 1;
                             case cs of
                                  1 : C1 := num;
                                  2 : C2 := num;
                                  3 : begin
                                           C3 := num;
                                           break;
                                      end;
                             end;
                        end;
                end;
        end;
  Case cs of
       0 : Write( 'el archivo ingresado no posee numeros del tipo capicua.');
       1 : Write( 'Solo se encontro un numero del tipo capicua: ', c1);
       2 : begin
                Write( 'Solo se encontraron dos numeros del tipo capicua: ');
                OrdenaTres(C1, C2, C3);
                if C1 = 0 then
                  Write( c2,'  ',c3)
                  else if C2 = 0 then
                   Write( c1,'  ',c3)
                   else
                     Write( c1,'  ',c2);
           end;
       3 : begin
                Write( 'Se encontraron tres numeros del tipo capicua: ');
                OrdenaTres(C1, C2, C3);
                Write( c1,'  ',c2,'  ',c3);
           end;
      end;

  close(txt1);
  readln();

end.
