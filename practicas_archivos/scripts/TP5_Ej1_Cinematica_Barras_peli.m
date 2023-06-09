% Introduccion a Octave - 2023 - FCAI-UNCuyo - MoCCAI
% 
% Trabajo Practico 5 - Ejercicio 1
%
% Cinematica del solido rigido.
%
% Sistema de ecuaciones vectoriales. Se considera un sistema de barras 
% que giran sin rozamiento.
% Una barra AB de longitud a=10cm gira con velocidad angular de 12 [rad/s] en 
% sentido anti horario. A esta barra está unida una barra BC de longitud b=15cm,
% la cual gira libremente. Finalmente el otro extremo de la barra BC está unida
% a la barra CD de longitud c=20cm que posee su otro extremo fijo.
%
% Se pide determinar la posición de las barras en función del tiempo, determinar
% las velocidades de los puntos de unión y las aceleraciones.

clear all
close all


% Datos
a=10;
b=15;
c=20;
w=12;  %velocidad angular

% Si se desea ver la animación del sistema se debe definit ipeli menor a 0
ipeli=0;

% Mediante un análisis geométrico determinamos las posiciones de los 
% puntos P1 y P2
function [x1, y1] = pos_pto1(a, wt)
  x1 = a * cos(wt);
  y1 = a * sin(wt);
endfunction

function [x2, y2] = pos_pto2(a, c, pt)
  x2 = a/2 + c - c * cos(pt);
  y2 = c * sin(pt);
endfunction

% Determinamos las posiciones para una vuelta completa, t=[0,2*pi/w]
Nt= 480; %nro de instantes de tiempo a evaluar
tt= linspace(0,8*pi/w,Nt);
P1= zeros(Nt,2);
P2= zeros(Nt,2);
for i=1:Nt
  wt = w*tt(i);
  
  [x1, y1] = pos_pto1(a, wt);
  
  L     = sqrt( (x1-a/2-c)^2 + y1^2 );
  beta  = acos( (L^2 + c^2 - b^2)/(2*L*c) );
  theta = acos( (L^2 + (a/2+c)^2 - a^2)/(2*L*(a/2+c)) ) * sign(y1);
  
  if (wt>pi && wt<3*pi) || (wt>5*pi && wt<7*pi)
    beta = -beta;
  endif
  
  pt   = beta+theta;
  [x2, y2] = pos_pto2(a, c, pt);

  %Almacenamos las posiciones de los puntos en función de t   
  P1(i,:) = [x1, y1];
  P2(i,:) = [x2, y2];
end

% Velocidad del punto P2 en función del tiempo
dt=tt(2);

V2=[ diff(P2(:,1)), diff(P2(:,2)) ] / dt;
V2(Nt,:)=V2(1,:);

for i=1:80:Nt 
    figure(1);clf
    subplot(1,2,1)
    hold on
    plot(P1(1:i,1),P1(1:i,2),'r.','markersize',10)
    plot(P2(1:i,1),P2(1:i,2),'k.','markersize',10)
    plot(0,0,'ko','markersize',14,'linewidth',6)
    plot(a/2+c,0,'ko','markersize',14,'linewidth',6)
    plot([0,P1(i,1)],[0,P1(i,2)],'ro-','linewidth',10)
    plot([P1(i,1),P2(i,1)],[P1(i,2),P2(i,2)],'bo-','linewidth',10)
    plot([P2(i,1),a/2+c],[P2(i,2),0],'ko-','linewidth',10)
    plot(P1(i,1),P1(i,2),'ko','markersize',14,'linewidth',6)
    plot(P2(i,1),P2(i,2),'ko','markersize',14,'linewidth',6,'markerfacecolor','g')
    axis equal
    xlim([-a-a/4,a/2+c+a/4])
    ylim([-c-a/2,c+a/2])
    hold off
    xlabel('x [cm]','fontsize',24)
    ylabel('y [cm]','fontsize',24)
    set(gca,'fontsize',20,'linewidth', 2)
    
    subplot(1,2,2)
    hold on
    plot(tt(1:Nt),V2(:,1),'k-','linewidth',2)
    plot(tt(1:Nt),V2(:,2),'color',[0.7,0.7,0.7],'linewidth',2)
    plot(tt(i),V2(i,1),'ko','markersize',14,'linewidth',3,'markerfacecolor','g')
    plot(tt(i),V2(i,2),'ko','markersize',14,'linewidth',3,'markerfacecolor','g')
    hold off
    xlabel('t [s]','fontsize',24)
    ylabel('velocidad [cm/s]','fontsize',24)
    xlim([0, tt(end)])
    ylim([-170,130])
    axis 'tight'
    h=legend('V_X', 'V_Y','location','southeast','orientation','vertical');
    legend boxoff
    set(h,'fontsize',16)
    set(gca,'fontsize',20,'linewidth', 2)

    set (gcf, "paperunits", "inches", "paperposition", [0, 0, 12, 8]);

    ifile=sprintf('barra%03d.png',i);
    print(ifile,'-r300')
    pause
    
    %print barras_peli.pdf -append -landscape -r300
endfor
  
%im = imread ("barras_peli.pdf", "Index", "all");
%imwrite (im, "barras_peli.gif", "DelayTime", 0)


V1=[ diff(P1(:,1)), diff(P1(:,2)) ] / dt;
V1(Nt,:)=V1(1,:);

figure(2);clf
hold on
plot(tt(1:Nt),V1(:,1),'k-','linewidth',2)
plot(tt(1:Nt),V1(:,2),'k:','linewidth',2)
plot(tt(i),V1(i,1),'ko','markersize',14,'linewidth',3,'markerfacecolor','g')
plot(tt(i),V1(i,2),'ko','markersize',14,'linewidth',3,'markerfacecolor','g')
hold off
xlabel('t [s]','fontsize',24)
ylabel('velocidad [cm/s]','fontsize',24)
xlim([0, tt(end)])
%ylim([-170,130])
axis 'tight'
h=legend('V_X', 'V_Y','location','southeast','orientation','vertical');
legend boxoff
set(h,'fontsize',16)
set(gca,'fontsize',20,'linewidth', 2)
