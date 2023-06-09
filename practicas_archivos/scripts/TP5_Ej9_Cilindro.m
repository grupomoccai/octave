% Introduccion a Octave - 2023 - FCAI-UNCuyo - MoCCAI
%
% Trabajo Practico 5 - Ejercicio
%
%Movimiento cilindro uniforme sin deslizar
%

clc; clear all; close all;

%Datos del sistema

m=50;            %Masa del cilindro [kg]
k=50;             %Constante del resorte [N/m]

c_crit=2*m*sqrt(k/m);  %constante critica del sistema [Ns/m]

%%Mediante el empleo de la segunda ley de Newton, se encuentran las ecuaciones
%%de movimiento del cilindro con respecto su desplazamiento en x, y con respecto
%%al desplazamiento del angulo theta.
%%La condición de rodadura d2x/dt2=d2z/dt2*r, donde z=theta
%%Esto nos permite reducir el sistema a una sola ecuación diferencial de segundo
%%orden, la cual queda como d2x/dt2+(2/3)*(c/m)*(dx/dt)+(2/3)*(k/m)*x=0

%==============================================================================

%Encontrar las ecuaciones del sistema, para poder usar el script que nos permite
%resolver el SEDO. Tener en cuenta que dx/dt=v

c=[25 150];           % Constantes de amortiguamiento [Ns/m]

x0_v0 = [-2 0];              %Valores iniciales de x y v respectivamente
t0    = [0,50];                 %Intervalo de tiempo que se analiza
h     = 0.05;                    %Tamaño de paso
t     = t0(1):h:t0(2);           % Vector de tiempo


% ========= NO MODIFICAR =============
dxdt=@(t,x,v) v;

for i=1:length(c)         % Obtengo 1 solución para cada valor de c
  dvdt=@(t,x,v) -(2/3)*(c(i)/m)*v - (2/3)*(k/m)*x + 10;% + (2/3)*(100*cos(w*t)/m);    % Aceleración
  y = RKorden4SEDO(dxdt,dvdt,t0,x0_v0,h);
  x_val(i,:) = y(1,:);
  v_val(i,:) = y(2,:);
end

col = {'r','g','b','k','c','m'};
figure(1);clf
hold on
for i=1:length(c)
  plot(t,x_val(i,:),'color',col{i},'linewidth',2)
  L{i} = sprintf('%d',c(i));
end
l = legend(L);
set(l,'fontsize',14)
hold off
title('Posición del sistema en función del tiempo','fontsize',24)
xlabel('t','fontsize',20)
ylabel('x','fontsize',20)


