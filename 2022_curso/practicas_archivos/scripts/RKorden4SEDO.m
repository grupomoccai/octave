% Método clásico de RK de cuarto orden para sistemas de EDOs de 2 ecuaciones
% Ejecute y = RKorden4SEDO(f1,f2,x,yo,h)
%%  Donde:
%%  * Entradas:
%%  dy1dx=f1(x,y1,y2): primera EDO de primer orden,
%%  dy2dx=f2(x,y1,y2): segunda EDO de primer orden,
%%  x: vector que contiene el valor inicial y final de x (xo,xf),
%%  yo: vector que contiene las 2 condiciones iniciales para el sistema de ecuaciones,
%%  h: tamaño de paso, distancia entre dos valores de x consecutivos.
%%  * Salidas:
%%  y: matriz que contiene en cada fila los valores de la solución de la i-ésima variable
%%  dependiente obtenidos numéricamente.

function y = RKorden4SEDO(f1,f2,x,yo,h)
  n = length(yo);     % Número de ecuaciones diferenciales ordinarias
  N = (x(2)-x(1))/h;  % Número de segmentos que particionan al intervalo (xo,xf)
  y = zeros(n,N+1);   % Matriz de las n variables dependientes que contienen cada una N+1 puntos
                      % La fila representa a la i-�sima variable dependiente
  for j=1:n
    y(j,1) = yo(j);   % Se le asigna a la variable j-�sima, el valor inicial yo a la primera componente
  endfor
  xo = x(1);          % Valor inicial del intervalo
  for i=2:N+1
    % Calculo los coeficientes ks (relaciones de recurrencia)
    % k es una matriz donde k(i,j) representa el i-�simo valor de k para la j-�sima EDO
    % Coeficientes k1s
    k(1,1) = f1(xo,y(1,i-1),y(2,i-1));
    k(1,2) = f2(xo,y(1,i-1),y(2,i-1));
    % Coeficientes k2s
    k(2,1) = f1(xo+0.5*h,y(1,i-1)+0.5*k(1,1)*h,y(2,i-1)+0.5*k(1,2)*h);
    k(2,2) = f2(xo+0.5*h,y(1,i-1)+0.5*k(1,1)*h,y(2,i-1)+0.5*k(1,2)*h);
    % Coeficientes k3s
    k(3,1) = f1(xo+0.5*h,y(1,i-1)+0.5*k(2,1)*h,y(2,i-1)+0.5*k(2,2)*h);
    k(3,2) = f2(xo+0.5*h,y(1,i-1)+0.5*k(2,1)*h,y(2,i-1)+0.5*k(2,2)*h);
    % Coeficientes k4s
    k(4,1) = f1(xo+h,y(1,i-1)+k(3,1)*h,y(2,i-1)+k(3,2)*h);
    k(4,2) = f2(xo+h,y(1,i-1)+k(3,1)*h,y(2,i-1)+k(3,2)*h);
    % Aplico la ecuación de RK de cuarto orden para predecir el valor de la
    % variable dependiente al final del sub-intervalo
    y(1,i) = y(1,(i-1))+1/6*(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1))*h;
    y(2,i) = y(2,(i-1))+1/6*(k(1,2)+2*k(2,2)+2*k(3,2)+k(4,2))*h;
    xo = xo+h;        % Actualizo el valor de x
  endfor
endfunction
