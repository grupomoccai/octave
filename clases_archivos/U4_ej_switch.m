% Introduccion en Octave - 2020 - FCAI-UNCuyo
% Unidad 2
% Ejemplo: switch-case-otherwise

% generamos un número aleatorio entre 1 y 10
x = ceil(rand(1,1)*10);

% se imprime en la terminal de comandos el nro generado
printf("\tVariable x=%d\n",x);

% se ejecuta la "Sentencia" de acuerdo a alguna "Condicion"
switch (x)
	case 1
		disp("Variable is 1")
	case {6, 7}
		disp("Variable is either 6 or 7")
	otherwise
		disp("Variable is neither 1, 6 nor 7")
end
