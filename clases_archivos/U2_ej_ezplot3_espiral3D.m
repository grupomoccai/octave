% Introduccion a Octave - 2022 - FCAI-UNCuyo -  MoCCAI/DIMEC
% Unidad 2
% Ejemplo: empleo del paquete "symbolic" para crear variables simbolicas
% Graficaremos con ezplot3 una espiral circular parametrizada por t en 3D.
%
% https://octave.sourceforge.io/symbolic/function/syms.html

clear
close all

% Se realiza la carga del paquete "symbolic"
%% pkg install -forge symbolic %[descomentar si no está disponible]
pkg load symbolic

% Definimos la variable simbólica t (forzamos que sea mayor a cero)
syms t positive

% Definimos las coordenadas de la trayectoria en 3D: x(t), y(t), z(t)
x = t*sin(pi*t);
y = t*cos(pi*t);
z = t;

% Graficamos la trayectoria
figure(1);clf
f=ezplot3(x, y, z,[0,2*pi])
title('Curva parametrizada en 3D','FontSize',20)
set(gca,'FontSize',20)
set(f,'linewidth',3)
axis equal

return

% -----------------------------------------------------------------------------
% Ejercicio: graficar una espiral eliptica cuya exentricidad sea 
% c=2 y z1(t)=t.
%           
% Hint: ecuacion implicita de una elipse centrada en (0,0)
%       (x/a)^2 + (y/b)^2 == 1, 
%       siendo la excentricidad: c=a/b
% Definimos las coordenadas de la trayectoria en 3D: x(t), y(t), z(t)
x1 = 2*t*sin(pi*t);
y1 = t*cos(pi*t);
z1 = t;

## Graficamos la trayectoria
figure(1)
hold on
f1=ezplot3(x1, y1, z1,[0,2*pi])
hold off
title ('')
legend('espiral circular','espiral eliptica','location','southeast')
set(gca,'fontsize',20,'linewidth',2)
set(f1,'linewidth',3)
fig1 = gcf ();
set(fig1, "numbertitle", "off", "name", "Curva parametrizada en 3D")
axis equal
