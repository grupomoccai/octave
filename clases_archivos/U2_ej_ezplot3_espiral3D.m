% Introduccion en Octave - 2021 - FCAI-UNCuyo
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
x1 = t*sin(pi*t);
y1 = t*cos(pi*t);
z1 = t;

% Graficamos la trayectoria
fe1=ezplot3(x1, y1, z1,[0,2*pi])
title('Curva parametrizada en 3D','fontsize',20)
set(gca,'fontsize',20)
set(fe1,'linewidth',3,'color','red')
axis equal

pause(4) % espera 4 segundos antes de continuar

% -----------------------------------------------------------------------------
% Ejercicio: graficar una espiral eliptica cuya exentricidad sea 
% c=2 y z2(t)=t.
%           
% Hint: ecuacion implicita de una elipse centrada en (0,0)
%       (x/a)^2 + (y/b)^2 == 1, 
%       siendo la excentricidad: c=a/b
% Definimos las coordenadas de la trayectoria en 3D: x(t), y(t), z(t)
x2 = 2*t*sin(pi*t);
y2 = 1*t*cos(pi*t);
z2 = t;

## Graficamos la trayectoria
hold on
fe2=ezplot3(x2, y2, z2,[0,2*pi])
hold off
title('Curvas parametrizadas en 3D','fontsize',20)
legend('espiral circular','espiral eliptica','location','northeast')
set(gca,'fontsize',20,'linewidth',2)
set(fe2,'linewidth',3,'color','blue')
axis equal
