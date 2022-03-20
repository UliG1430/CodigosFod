{
  3. Realizar un programa que presente un menú con opciones para:
a. Crear un archivo de registros no ordenados de empleados y completarlo con
datos ingresados desde teclado. De cada empleado se registra: número de
empleado, apellido, nombre, edad y DNI. Algunos empleados se ingresan con
DNI 00. La carga finaliza cuando se ingresa el String ‘fin’ como apellido.
b. Abrir el archivo anteriormente generado y
i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado.
ii. Listar en pantalla los empleados de a uno por línea.
iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.
NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario una
única vez.
   
   
}


program punto3;
type
	Empleado=record
		num:integer;
		ape:String;
		nom:String;
		edad:integer;
		dni:String;
		end;
	Empleados= file of empleado;

procedure leerEmpleado(var E:empleado);

begin
with E do begin
write('Ingrese el numero: ');
readln(num);
write('Ingrese el apellido: ');
readln(ape);
if (ape<>'fin')then begin
	write('Ingrese el nombre: ');
	readln(nom);
	write('Ingrese edad: ');
	readln(edad);
	write('Ingrese dni: ');
	readln(dni);
	end;
end;
end;

var
	arc_fis:String;
	arc_log:Empleados;
	eleccion:char;
	E:empleado;
	eleccion_num:integer;
	res:String;
	nuevaedad:integer;
	encontre: boolean;

BEGIN
writeln('INGRESE UNA OPCION: ');
writeln('A) Crear archivo');
writeln('B) Abrir archivo');
writeln('C) Agregar empleado a archivo');
writeln('D) Modificar la edad de un empleado: ');
readln(eleccion);
case eleccion of 
'A': begin
	write('Ingrese el nombre del archivo: ');
	readln(arc_fis);
	assign (arc_log,arc_fis);
	rewrite(arc_log);	
	leerEmpleado(E);
	while (E.ape<>'fin') do begin
		write (arc_log,E);
		leerEmpleado(E);
		end;
	end;
'B':
begin
	write('Ingrese el nombre del archivo que desea abrir: ');
	readln(arc_fis);
	assign (arc_log,arc_fis);
	Reset (arc_log);
	write ('Ingrese la opcion que desea imprimir (1, 2 o 3): ');
	readln(eleccion_num);
	{i. Listar en pantalla los datos de empleados que tengan un nombre o apellido
determinado.}
	if (eleccion_num=1) then begin
			write ('Ingrese apellido o nombre: ');
			readln(res);
			write ('Si ingreso un nombre aprete 1. Si ingreso un apellido aprete 2. ');
			readln(eleccion_num);
			if (eleccion_num=1) then begin
				while not eof(arc_log) do begin
					read(arc_log,E);
					if (E.nom=res) then begin
						writeln('entre');
						seek (arc_log,filepos(arc_log)-1);
						read(arc_log,E);
						writeln('NOMBRE: '+E.nom);
						writeln('APELLIDO: '+E.ape);
					end;
				end;
			end
			{ii. Listar en pantalla los empleados de a uno por línea.}
			else if (eleccion_num=2) then begin
				while not eof(arc_log) do begin
					read(arc_log,E);
					if (E.ape=res) then begin
						writeln('NOMBRE: '+E.nom);
						writeln('APELLIDO: '+E.ape);
						write('EDAD: ');
						writeln(E.edad);
						writeln(' ');
					end;
				end;
			end;
			end
	else if (eleccion_num=2) then begin
			while not eof(arc_log) do begin
					read(arc_log,E);
					writeln('NOMBRE: '+E.nom);
					writeln('APELLIDO: '+E.ape);
					write('EDAD: ');
						writeln(E.edad);
						writeln(' ');
			
					end;
				end
				else if (eleccion_num=3) then begin
					while not eof (arc_log) do begin
						read (arc_log,E);
						if (E.edad>70) then begin
							writeln ('NOMBRE: '+E.nom);
							writeln('APELLIDOl: '+E.ape);
							write('EDAD: ');
							writeln(E.edad);
							writeln(' ');
							end;
						end;
					end;
					
			end;	
	'C': begin
		write('Ingrese el nombre del archivo al cual desea agregar empleados: ');
		readln(arc_fis);
		assign (arc_log,arc_fis);
		reset(arc_log);	
		leerEmpleado(E);
		seek(arc_log,FileSize(arc_log));
		write(arc_log,E);
		end;
	'D': begin
		encontre:=false;
		write('Ingrese el nombre del archivo al cual desea modificar edad de empleados: ');
		readln(arc_fis);
		assign (arc_log,arc_fis);
		reset(arc_log);
		write('Ingrese el apellido de la persona a la cual quiere cambiar la edad o ingrese ZZZ para finalizar: ');
		readln(res);
		while (res<>'ZZZ') do begin
				while (not eof(arc_log)) and (encontre=false) do begin
				read(arc_log,E);
				if (E.ape=res) then begin
						writeln('Ingrese la edad que quiere asignar: ');
						readln(nuevaedad);
						E.edad:=nuevaedad;
						seek (arc_log,filepos(arc_log)-1);
						write(arc_log,E);
						encontre:=true;
						seek(arc_log,0);
					end;
				end;
				if (eof(arc_log)) then
					writeln('El empleado no existe');
			encontre:=false;
			write('Ingrese el apellido de la persona a la cual quiere cambiar la edad o ingrese ZZZ para finalizar: ');
			readln(res);
			
		end;
end;
end;
'E':	
END.


writeln
