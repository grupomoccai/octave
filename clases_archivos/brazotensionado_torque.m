% Ejercicio: mec�nica vectorial
%
% Una estructura r�gida con forma de L (brazo) se carga en el extremo libre 
% mediante un tensor como se muestra en la figura (ver apuntes de clase).
% La tensi�n en el cable se puede ajustar hasta un valor m�ximo de 2.5kN. 
%
% Determinar, con OCTAVE, el momento M=r x T respecto al punto O que produce
% la tensi�n del cable, que act�a en el punto A, y la magnitud de ese momento.
%
% Se desea conocer como afecta la magnitud del momento torsor M la posici�n B
% sobre el plano xy, en la cual es fijado el cable si se mantiene constante la
% longitud del cable.
%
% 1) Grafique el sistema que debe ser analizado
% 2) Determine las posiciciones de B en las que se logra el min(M) y max(M).
% 3) Grafique la norma de M en funci�n del �ngulo alfa=[0,2pi] que parametriza
%    la posici�n de B en el plano xy.

%coordenadas del "brazo" donde se fija el tensor
brazo = [0.0,0.0,0.0; 
         0.0,0.0,2.1;
         1.7,0.0,2.1];
           

% El punto B se fija a una rueda de radio R=sqrt(1.3^2+0.7^2)
% ubicada en el plano xy (z=0).
% Definimos las posiciones del punto B como aquellos sobre un 
% c�rculo de radio R parametrizadas por alfa en [0,2pi];

Rten=sqrt(0.7^2+1.3^2);
alfa=linspace(0,2*pi,360)';
posB=Rten*[cos(alfa), sin(alfa),zeros(360,1)] + [1.7, 0, 0];

tenB=[1.7,0.0,2.1;
      2.4,1.3,0.0];
auxP=[1.7,0.0,2.1;
      1.7,0.0,0.0;
      2.4,1.3,0.0];
      
%=====================================================
% A continuaci�n se representa gr�ficamente el problema bajo
% estudio.
nB=[tenB(2,1)-tenB(1,1), tenB(2,2)-tenB(1,2), tenB(2,3)-tenB(1,3)];
nB=nB/norm(nB);

figure(1);clf
hold on
plot3(brazo(:,1),brazo(:,2),brazo(:,3),'ko-','markersize',12,'linewidth',8)
plot3( tenB(:,1), tenB(:,2), tenB(:,3),'bo-','markersize',12,'linewidth',4)
plot3( posB(:,1), posB(:,2), posB(:,3),'r--','linewidth',4)
plot3( posB(1,1), posB(1,2), posB(1,3),'rs','linewidth',4,'markersize',12)
plot3( auxP(:,1), auxP(:,2), auxP(:,3),'k--o','linewidth',3)
quiver3(tenB(1,1), tenB(1,2), tenB(1,3), nB(1), nB(2), nB(3), 'linewidth',4,'markersize',12)
hold off
text( 0.2,-0.2, 0.2,'O','fontsize',24)
text( 1.7, 0.0, 2.3,'A','fontsize',24)
text( 2.4, 1.3, 0.2,'B','fontsize',24)
text( mean(tenB(:,1)), mean(tenB(:,2)), mean(tenB(:,3)),'T','fontsize',24)
xlabel('x [m]','fontsize',20)
ylabel('y [m]','fontsize',20)
zlabel('z [m]','fontsize',20)
set(gca,'fontsize',20,'linewidth',1)
grid
box off
axis equal
xlim([-0.1,3.2])
ylim([-1.6,1.6])
zlim([-0.1,2.3])
fig1 = gcf ();
set(fig1, "numbertitle", "off", "name", "Mecánica Vectorial")

%Momento torsor en O realizado por la fuera T en 3 posiciones de B
rA=[1.7,0.0,2.1];
T1=2.5*( [1.7+Rten,   0,0]-rA )/norm( [1.7+Rten,   0,0]-rA );
T2=2.5*( [1.7     ,Rten,0]-rA )/norm( [1.7     ,Rten,0]-rA );
T3=2.5*( [1.7-Rten,   0,0]-rA )/norm( [1.7-Rten,   0,0]-rA );

nM1=norm(cross(rA,T1))
nM2=norm(cross(rA,T2))
nM3=norm(cross(rA,T3))


%=========================================================
% Calculamos y graficamos el momento torsor en O que realizado
% el cable tensor, T, parametrizado por el angulo alfa que determina
% la posicion del punto B en el plano xy.

T = 2.5; %norma de la tension en el cable en kN
Mnorm=zeros(360,1);

for i=1:360
  rB = posB(i,:);
  nT = (rB-rA)/norm(rB-rA);
  MOA= cross(rA,T*nT);
  Mnorm(i) = norm(MOA);
end

figure(2);clf
plot(alfa, Mnorm, 'r-', 'linewidth', 4)
xlabel('\alpha [rad]','fontsize',24)
ylabel('|M_O| [kJ]','fontsize',24)
xlim([0,2*pi])
set(gca,'fontsize',20,'linewidth',1,'xtick',[0,pi,2*pi],'xticklabel',['0';'\pi'; '2\pi'])
fig2 = gcf ();
set(fig2, "numbertitle", "off", "name", "Norma Momento Torsor en O")
