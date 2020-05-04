% Introducción a Octave 2020
% Unidad 3
% Ejemplo: 
%   (i) Ajuste los datos siguientes con el modelo de potencias y = a x^b. 
%   (ii) Use la ecuacion de potencias resultante para hacer el pronostico
%   de y en x = 9.
% 

% (i) ==========================================================================
% Mediciones
x=[ 2.5  3.5 4.5 6.0 7.5 10.0 12.5 15.0 17.5 20.0];
y=[13.0 11.0 9.5 7.8 7.0  6.0  5.2  4.8  4.5  4.3];

figure(1);clf
%loglog(x,y,'ro--','linewidth',2,'markersize',15)
plot(x,y,'ro--','linewidth',2,'markersize',15)
xlabel('x','fontsize',24)
ylabel('y','fontsize',24)
set(gca,'fontsize',20,'linewidth',2)


% Realizamos un ajuste de los datos empleando
%  1) transformación mediante log() para linealizar: log(y)=log(a)+b*log(x)
%  2) un ajuste lineal de los datos transformados mediante polyfit()
p = polyfit(log(x),log(y),1);
b = p(1);
a = exp(p(2));

% función obtenida empleando el modelo de potencias para ajustar los datos
fa = @(x) a*x.^b;

%generamos 100 valores en el intervalo analizado
xx =linspace(2.5,20,100);

% verificamos el ajuste realizado
figure(2);clf
hold on
plot(x,y,'ro','linewidth',2,'markersize',15)
plot(xx,fa(xx),'b-','linewidth',3)
hold off
xlabel('x','fontsize',24)
ylabel('y','fontsize',24)
set(gca,'fontsize',20,'linewidth',2)
leg=legend('datos','ajuste');
set(leg,'fontsize',24)

% (ii) =========================================================================
figure(3);clf
hold on
plot(x,y,'ro','linewidth',2,'markersize',15)
plot(xx,fa(xx),'b-','linewidth',3)
plot(9,fa(9),'kd','linewidth',3,'markersize',15,'markerfacecolor','w')
hold off
xlabel('x','fontsize',24)
ylabel('y','fontsize',24)
text(9,fa(9)+0.5,'ajuste x=9','fontsize',24,'color','black')
set(gca,'fontsize',20,'linewidth',2)
leg=legend('datos','ajuste');
set(leg,'fontsize',24)