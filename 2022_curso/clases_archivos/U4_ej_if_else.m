% Introduccion a Octave - 2022 - FCAI-UNCuyo - MoCCAI/DIMEC
% Unidad 4
% Ejemplo: if-elseif-else 

% generamos un número aleatorio entre 1 y 10
x = ceil(rand(1,1)*10);

% se imprime en la terminal de comandos el nro generado
printf("\tVariable x=%d\n",x);

% se ejecuta la "Sentencia" de acuerdo a alguna "Condicion"
if (x==1)
	disp("Variable is 1")
elseif (x==6 || x==7)
	disp("Variable is either 6 or 7")
else
	disp("Variable is neither 1, 6 nor 7")
end
