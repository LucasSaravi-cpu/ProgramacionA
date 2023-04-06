program  ParcialPrimercuatrimestre11;
function costoadicionales(Adicional1:real;Adicional2:real;Adicional3:real):real;
begin
  CostoAdicionales:=Adicional1+Adicional2+Adicional3; //esta función no tiene mayormente sentido

//Hubiese sido útil declarar aquí lo que se desarrolló en el método principal, para así separar esta //funcionalidad del método principal y también, poder ser invocada desde futuras
//funciones o procedimientos, recibiendo los parámetros ‘adicionales’ (string[3]) y ‘cantidad’:
           // 		if adicionales='lum' then
           //  		 	CostoAdicionales:=(cantidad*100);  // OBS: usar constantes
           // 		if adicionales='mob' then
           // 		  	CostoAdicionales:=(cantidad*150);
           // 		if adicionales='atv' then
           //    			CostoAdicionales:=((cantidad*200)+1000);

end;

var {programa principal}
   arch:text;
   Id:string[8];
   TotalSuperficie,maxdescuento,superficie,espacioalquilado,sum1,sum2,sum3,totaldisponibles,disponibles,max,cont,TotalAdicionales,costototal,descuento:real;
   Stand:char;
   empresa,maxempresa:string;

   adicionales:string[3];
   cantidad,ContAdicionales:byte;
begin {programa principal}
assign(arch,'ParcialPrimercuatrimestre11.txt'); // muy pobre indentación. Mejorar la indentación favorece legibilidad y claridad
reset(Arch);
totalDisponibles:=0;
disponibles:=0;
max:=0;
cont:=0;
TotalSuperficie:=0;
while not eof(arch) do
   begin

   readln(arch,id,superficie,stand,stand); //debe consumir en la misma u otra variable caracter el espacio
  //entre superficie y tipo
   readln(arch,empresa);

  //if  empresa<>'DISPONIBLE' then
//Debería leer solamente adicional porque cuando es ‘FIN’, no tiene cantidad:
// Si lee junto debe ser readln
//         read(arch, adicional);
//y luego, si adicional <> ‘FIN’, hacer readln(arch, cantidad);

   sum1:=0;					// identificador poco representativo
   sum2:=0; 				// identificador poco representativo
   sum3:=0;					// identificador poco representativo
   ContAdicionales:=0;
   cont:=cont+1;
   if  empresa<>'DISPONIBLE' then
       begin
       read(arch,adicionales);
       while adicionales <>'FIN'  do
           begin
           readln(arch,cantidad);
           ContAdicionales:=ContAdicionales+1;
           if adicionales='lum' then               //Funcionalizar esta parte del código. Pasar como parámetros las
              sum1:=sum1+(cantidad*100);			// variables adicionales y cantidad
           if adicionales='mob' then
              sum2:=sum2+(cantidad*150);
           if adicionales='atv' then
              sum3:=Sum3+((cantidad*200)+1000);

		//No muestra detalle de los adicionales contratados y sus cantidades
          read(arch,adicionales);
          end;
        readln(arch);
        end
     else
         begin
         TotalDisponibles:=TotalDisponibles+superficie;
         Disponibles:=disponibles+1;
         end;
       TotalSuperficie:=TotalSuperficie+superficie;
    // solamente calcular costos y descuentos si el stand fue alquilado (empresa <> ‘DISPONIBLE’)
   TotalAdicionales:=CostoAdicionales(sum1,sum2,sum3);

   If Stand='I' then
      EspacioAlquilado:=(superficie*20)*1.5
   else
      EspacioAlquilado:=superficie*20;


   if  ContAdicionales>=2 then
      begin
      CostoTotal:=(TotalAdicionales+EspacioAlquilado)*0.9;
      descuento:=(totalAdicionales+EspacioAlquilado)*0.1;

      end
   else
      begin
      costoTotal:=TotalAdicionales+EspacioAlquilado;
      descuento:= 0;//No pone descuento en CERO si no corresponden descuentos
      end;

   if empresa<>'DISPONIBLE'  then
      writeln('la empresa',empresa,'el espacio alquilado',EspacioAlquilado:8:2,' servicio contratado ',TotalAdicionales:8:2,' total a pagar',costoTotal:8:2);

   if descuento>max then
     begin
     maxEmpresa:=Empresa;
     maxDescuento:=Descuento;
     end;
   end;
writeln('El total de m2 disponibles (aún no han sido alquilados) ',totaldisponibles:8:2,' el porcentaje que ese total',(TotalDisponibles/TotalSuperficie  )*100:8:2);
// no controla división por cero!
writeln('la empresa que recibe mayor descuento por haber contratado al menos 2 adicionales y de cuánto es',maxempresa,'con',maxdescuento:8:2);
// No contempla que NO haya empresas que reciban descuento por haber contratado al menos 2 categorías
close(arch);
readln;
end.


