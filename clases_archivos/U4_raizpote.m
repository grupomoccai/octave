function val=U4_raizpote(x,y)
% Esta funcion recibe dos numeros enteros y los suma. 
% Si la suma es par devuelve la raiz de la suma.
% Si la suma es impar devuelve la suma al cuadrado.
%
% Ejemplo 1:
% x=ceil(rand(1,1)*10);
% y=ceil(rand(1,1)*10);
% val = U4_raizpote(x,y)
%
% Ejemplo 2:
% x=ceil(rand(1,5)*10);
% y=ceil(rand(1,5)*10);
% for i=1:5
%   xi = x(i);
%   yi = y(i);
%   disp([xi yi U4_raizpote(xi,yi)]);
% end
%
% (C) Introduccion a Octave 2021. MoCCAI, FCAI-UNCuyo.

s=x+y;

% El resultado de mod(s,2) solo puede ser 0 o 1.
% Si el nro es impar el resto es 1 => verdadero = impar
if (mod(s,2)) %1 verdadero = impar
  disp('La suma de x e y es impar')
  val = s*s;
else
  disp('La suma de x e y es par')
  val = sqrt(s);
end
