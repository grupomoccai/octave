% Introduccion a Octave - 2023 - FCAI-UNCuyo - MoCCAI/DIMEC
% Unidad 2
% Ejemplo: prueba de algunas posibilidades de plot

clear
close all

%vector x conteniendo 100 valores equiespaciados en [-2*pi,2*pi]
x=linspace(-2*pi,2*pi,100);

%creamos la figura
figure(1);clf
pause(4) %espera 4 segundos

%graficamos las funciones seno y coseno para cada valor de x
hold on
plot(x,sin(x),'ro-','linewidth',2)
plot(x,cos(x),'bx--','linewidth',2)
hold off
pause(4) %espera 4 segundos

%agregamos el titulo, nombre a los ejes, curvas, etc
title('Funciones seno(x) y coseno(x)','fontsize',20)
xlabel('angulo en radianes','fontsize',20)
ylabel('valor de la funcion','fontsize',20)
leg=legend('cos(t)','sin(t)','location','north');
legend boxoff
set(gca,'fontsize',20)
axis([-7,7,-1.5,1.5])
axis('on'), grid
pause(4) %espera 4 segundos

%cambiamos algunas de las propiedades definidas anteriormente
xlabel('t','fontsize',20)
leg=legend('cos(t)','sin(t)','location','south');
legend boxoff
set(leg,'fontsize',20,'fontweight','b')
set(gca,'Xtick',0:pi/2:2*pi)
set(gca,'XtickLabel',{'0','\pi/2','\pi','3\pi/2','2\pi'})
set(gcf,'number','off','name','Trigonometricas')
