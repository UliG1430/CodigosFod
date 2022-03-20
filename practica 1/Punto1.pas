{
1. Realizar un algoritmo que cree un archivo de números enteros no ordenados y permita
incorporar datos al archivo. Los números son ingresados desde teclado. El nombre del
archivo debe ser proporcionado por el usuario desde teclado. La carga finaliza cuando
se ingrese el número 30000, que no debe incorporarse al archivo.
2. Realizar un algoritmo, que utilizando el archivo de números enteros
   
   
}


program untitled;

type
	numeros = file of integer;
	

var 
arc_log: numeros;
arc_fis:String;
num:integer;
BEGIN
	write('Ingrese el nombre del archivo: ');
	readln(arc_fis);
	assign (arc_log,arc_fis);
	rewrite(arc_log);
	writeln('Ingrese un numero: ');
	readln(num);
	while (num<>3000) do begin
		write(arc_log,num);
		writeln('Ingrese un numero: ');
		readln(num);
		end;
		close(arc_log);
		
END.

