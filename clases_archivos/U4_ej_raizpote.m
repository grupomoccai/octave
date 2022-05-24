% Introduccion a Octave - 2022 - FCAI-UNCuyo - MoCCAI/DIMEC

% Unidad 4
% Ejemplo: funcion raizpote, recibe dos numeros enteros y los suma. 
%          Si la suma es par devuelve la raiz de la suma.
%          Si la suma es impar devuelve la suma al cuadrado.

clc
clear

% Se crea la funcion:
disp('Prueba de la funcion raizpote')

%Funcion raizpote version 'command-line' %--------------------------------------
function val=U4_raizpoteCL(x,y) 
% NOTA: no es posible obtener "help" de esta funcion, 
%       pruebe ejecutar en la terminal:
%       >> help U4_raizpoteCL

s = x + y;

if (mod(s,2) != 0) %resto distinto de cero => verdadero = impar
  disp('La suma de x e y es impar')
  val = s*s;
else
  disp('La suma de x e y es par')
  val = sqrt(s);
end
endfunction  % -----------------------------------------------------------------

% Prueba de las funciones raizpoteCL y U4_raizpote (fichero U4_raizpote.m)
x=ceil(rand(1,1)*10);
y=ceil(rand(1,1)*10);

disp([x y])
disp(U4_raizpoteCL(x,y))
disp(U4_raizpote(x,y))
