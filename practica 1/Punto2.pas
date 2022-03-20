{
2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creados en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y
el promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.
   
}

program punto2;
type
	numeros = file of integer;

var 
arc_log: numeros;
arc_fis:String;
num:integer;
BEGIN
	writeln('Ingrese el nombre del archivo que desea abrir: ');
	readln(arc_fis);
	assign (arc_log,arc_fis);
	Reset (arc_log);
	while not eof (arc_log) do begin
		read(arc_log,num);
		if (num>1500) then
			writeln (num)
	end;
	close(arc_log);
	
	
END.

