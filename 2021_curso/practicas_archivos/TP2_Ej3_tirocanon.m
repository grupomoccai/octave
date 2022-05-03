% Introduccion a Octave - 2021 - FCAI-UNCuyo
% 
% Trabajo Practico 2
% Ejercicio 3

% Tiro en 2D de un "canion"

%% Primer caso, ang = pi/3 y v0 = 100 m/s.

% Creamos la variable tiempo
%% pkg install -forge symbolic %[descomentar si no esta disponible]
pkg load symbolic
syms t positive;

% Declaramos las variables necesarias
% Mire las ecuaciones expresadas en el trabajo practico y complete.


% Expresamos las ecuaciones
x1 = %==> Completar
y1 = %==> Completar
t1 = 2*sin(..) * v0/g; %==> Completar

x2 = %==> Completar
y2 = %==> Completar
t2 = 2*sin(..) * v0/g; %==> Completar

x1 = %==> Completar
y1 = %==> Completar
t3 = 2*sin(..) * v0/g; %==> Completar

% Graficamos la curva. 
fig1=figure(1);clf
hold on
f1=ezplot(x1,y1,[0,t1]);
f2=ezplot(x2,y2,[0,t2]);
f3=ezplot(x3,y3,[0,t3]);
hold off
l=legend('tiro 1','tiro 2','tiro 3','location','northeast');
set(l,'fontsize',20,'linewidth',2)
set(gca,'fontsize',20,'linewidth',2)
title('')
set(f1,'linewidth',3)
set(f2,'linewidth',3)
set(f3,'linewidth',3)
set(fig1, "numbertitle", "off", "name", "Tiro parametrizado 2D")


