program ParcialSegundoCuatrimestre5;
Type
   st8=string[11];
   tr=record
   nombre:st8;
   end;

   tr2=record

   Venesperadas:real;
   Venreales:real;
   end;

   tr3=record
   sucursal:st8;
   prom:real;
   end;

   TM=array[1..50,1..50] of tr2;
   TV=array[1..50] of tr;
   tv2=array[1..50] of tr3;


procedure LeeMatriz(var mat:tm;var vec:tv; var n,m:byte );
var
i,j:byte;
arch:text;
begin
assign(arch,'saravi.txt');
reset(arch);
readln(arch,n,m);
for i:=1 to n do
   begin
   read(arch,vec[i].nombre);
   for j:=1 to m do
      begin
      read(Arch,mat[i,j].venesperadas,mat[i,j].venreales);
      end;
   readln(arch);
   end;
close(arch);
end;

procedure escribematriz(mat:tm;vec:tv;n,m:byte);     {controlar que leea bien la matriz}
var
i,j:byte;
begin
for i:=1 to n do
   begin
   write(vec[i].nombre);
   for j:=1 to m do
      begin
      write(mat[i,j].venesperadas:8:2,mat[i,j].venreales:8:2);
      end;
   writeln;
   end;
end;


procedure ResuelveA(mat:tm;vec:tv;n,m:byte;suc:st8);
var
cont,i,j:byte;
totalesperadas,totalreales:real;
begin
TotalEsperadas:=0;
totalReales:=0;
cont:=0;
for i:=1 to n do
   begin
   for j:=1 to m do
      begin
      if suc=vec[i].nombre then
         begin

         totalesperadas:=totalesperadas+mat[i,j].venesperadas;
         totalreales:=totalreales+mat[i,j].venreales;

         if mat[i,j].venesperadas>mat[i,j].venreales then
            cont:=cont+1;
         end;
      end;

   end;
writeln('Para la sucursal ',suc,'el total de ventas esperadas es',totalesperadas:8:2 ,' y el total de ventas reales es',totalreales:8:2);
writeln('Las veces que no supero las venntas esperadas son ' ,cont);
end;






procedure ResuelveB(mat:tm;vec:tv;n:byte;mes:byte);
var
i,maxsuc:byte;
porcentaje:real;
max:Real;
begin
max:=-999;
for i:=1 to n do
   begin
   porcentaje:=mat[i,mes].venreales*100/mat[i,mes].venesperadas;
   if mat[i,mes].venreales>mat[i,mes].venesperadas then
      begin
      if (porcentaje>max) then
         begin
         max:=porcentaje;
         maxsuc:=i;
         end;

      end;
   end;
writeln('la sucursal que obtuvo ventas reales por encima de las esperadas con mayor porcentaje es ',vec[maxsuc].nombre);
end;


function prom(mat:tm;m,i:byte):Real;
var
j:byte;
sum:real;
cont:byte;
begin
cont:=0;
sum:=0;
for j:=1 to m do
   begin
   sum:=sum+mat[i,j].venreales;
   cont:=cont+1;
   end;

prom:=sum/cont;
end;

procedure Resuelvec(mat:tm;vec:tv;n,m:byte;IMP:real;var k:Byte ; var sucursales:tv2);
var
i,j:byte;
promedio:Real;
begin
k:=0;
for i:=1 to n do
   begin
   for j:=1 to M do
      begin

      end;

   promedio:=prom(mat,m,i);
    if promedio>imp then
       begin
       k:=k+1;
       sucursales[k].sucursal:=vec[i].nombre;
       sucursales[k].prom:=promedio;
       end;

    end;
end;

procedure escribevec(vec:tv2;k:byte);
var
i:byte;
begin
for i:=1 to k do
   begin
   writeln(vec[i].sucursal, vec[i].prom:8:2);
   end;

end;


var
mat:tm;
vec:tv;
n,m,mes,k:byte;
suc:st8;
IMP:REAL;
sucursales:tv2;

begin
Leematriz(mat,vec,n,M);
escribematriz(mat,vec,n,m);
writeln('ingrese el nombre de la sucursal, (agregarle los espacios hasta completar el string[11])');
readln(suc);
ResuelveA(mat,vec,n,m,suc);
writeln('Ingrese un mes');  {para que funcione hay que agregarle los espaciso que le faltan para completan el string[11]}
readln(mes);
ResuelveB(mat,vec,n,mes);
writeln('Ingrese el importe');
readln(IMP);
ResuelveC(mat,vec,n,m,IMP,k,sucursales);
escribevec(sucursales,k);
readln;
end.


