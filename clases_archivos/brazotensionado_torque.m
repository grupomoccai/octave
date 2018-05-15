% Ejercicio: mecánica vectorial
%
% Una estructura rígida con forma de L (brazo) se carga en el extremo libre 
% mediante un tensor como se muestra en la figura (ver apuntes de clase).
% La tensión en el cable se puede ajustar hasta un valor máximo de 2.5kN. 
%
% Determinar, con OCTAVE, el momento M=r x T respecto al punto O que produce
% la tensión del cable, que actúa en el punto A, y la magnitud de ese momento.
%
% Se desea conocer como afecta la magnitud del momento torsor M la posición B
% sobre el plano xy, en la cual es fijado el cable si se mantiene constante la
% longitud del cable.
%
% 1) Grafique el sistema que debe ser analizado
% 2) Determine las posiciciones de B en las que se logra el min(M) y max(M).
% 3) Grafique la norma de M en función del ángulo alfa=[0,2pi] que parametriza
%    la posición de B en el plano xy.

%coordenadas del "brazo" donde se fija el tensor
brazo = [0.0,0.0,0.0; 
         0.0,0.0,2.1;
         1.7,0.0,2.1];
           

% El punto B se fija a una rueda de radio R=sqrt(1.3^2+0.7^2)
% ubicada en el plano xy (z=0).
% Definimos las posiciones del punto B como aquellos sobre un 
% círculo de radio R parametrizadas por alfa en [0,2pi];

Rten=sqrt(0.7^2+1.3^2);
alfa=linspace(0,2*pi,360)';
posB=Rten*[cos(alfa), sin(alfa),zeros(360,1)] + [1.7, 0, 0];
tenB=[1.7,0.0,2.1;
      2.4,1.3,0.0];
auxP=[1.7,0.0,2.1;
      1.7,0.0,0.0;
      2.4,1.3,0.0];
      
%=====================================================
% A continuación se representa gráficamente el problema bajo
% estudio.
figure(1);clf
hold on
plot3(brazo(:,1),brazo(:,2),brazo(:,3),'ko-','markersize',12,'linewidth',8)
plot3( tenB(:,1), tenB(:,2), tenB(:,3),'bo-','markersize',12,'linewidth',4)
plot3( posB(:,1), posB(:,2), posB(:,3),'r--','linewidth',4)
plot3( posB(1,1), posB(1,2), posB(1,3),'rs','linewidth',4,'markersize',12)
plot3( auxP(:,1), auxP(:,2), auxP(:,3),'k--o','linewidth',3)
hold off
text( 0.2,-0.2, 0.2,'O','fontsize',24)
text( 1.7, 0.0, 2.3,'A','fontsize',24)
text( 2.4, 1.3, 0.2,'B','fontsize',24)
xlabel('x','fontsize',20)
ylabel('y','fontsize',20)
zlabel('z','fontsize',20)
set(gca,'fontsize',16)
grid
box off
axis equal
xlim([-0.1,3.2])
ylim([-1.6,1.6])
zlim([-0.1,2.3])
fig1 = gcf ();
set(fig1, "numbertitle", "off", "name", "Mecánica Vectorial")
