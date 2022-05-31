% Introduccion a Octave - 2022 - FCAI-UNCuyo - MoCCAI/DIMEC
%
% Unidad 5
% Ejercicio: mecanica vectorial - brazo tensionado
%
% Una estructura rigida con forma de L (brazo) se carga en el extremo libre 
% mediante un tensor como se muestra en la figura (ver apuntes de clase).
% La tension en el cable se puede ajustar hasta un valor maximo de 2.5kN. 
%
% Determinar, con OCTAVE, el momento M=r x T respecto al punto O que produce
% la tension del cable, que actua en el punto A, y la magnitud de ese momento.
%
% Se desea conocer como afecta la magnitud del momento torsor M la posicion B
% sobre el plano xy, en la cual es fijado el cable si se mantiene constante la
% longitud del cable.
%
% 1) Grafique el sistema que debe ser analizado
% 2) Determine las posiciciones de B en las que se logra el min(M) y max(M).
% 3) Grafique el sistema y la norma de M en funcion del angulo alfa=[0,2pi] 
%    que parametriza la posicion de B en el plano xy.

%coordenadas del "brazo" donde se fija el tensor
brazo = [0.0,0.0,0.0; 
         0.0,0.0,2.1;
         1.7,0.0,2.1];
           

% El punto B se fija en cualquier punto de una circunferencia de 
% radio rXY=sqrt(1.3^2+0.7^2) ubicada en el plano xy (z=0).
% Definimos las posiciones del punto B como aquellos sobre una circunferencia
% de radio "rXY" parametrizadas por alfa en [0,2pi];

nAlfa=90; %nro de intervalos angulares usados para dividir la circunferencia

rXY =sqrt(0.7^2+1.3^2); %radio en el plano xy sobre el que se fija el pto B  

%posiones del punto B sobre la circunferencia de radio rXY en el plano xy
alfa=linspace(0,2*pi,nAlfa)';
posB=rXY*[cos(alfa), sin(alfa),zeros(nAlfa,1)] + [1.7, 0, 0];

tenB=[1.7,0.0,2.1;
      2.4,1.3,0.0];
auxP=[1.7,0.0,2.1;
      1.7,0.0,0.0;
      2.4,1.3,0.0];
      
%=====================================================
% A continuacion se representa graficamente el problema bajo
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
T1=2.5*( [1.7+rXY,  0,0]-rA )/norm( [1.7+rXY,  0,0]-rA );
T2=2.5*( [1.7    ,rXY,0]-rA )/norm( [1.7    ,rXY,0]-rA );
T3=2.5*( [1.7-rXY,  0,0]-rA )/norm( [1.7-rXY,  0,0]-rA );

nM1=norm(cross(rA,T1))
nM2=norm(cross(rA,T2))
nM3=norm(cross(rA,T3))


%=========================================================
% Calculamos y graficamos el momento torsor en O que realizado
% el cable tensor, T, parametrizado por el angulo alfa que determina
% la posicion del punto B en el plano xy.

T = 2.5; %norma de la tension en el cable en kN
Mnorm=zeros(nAlfa,1);

for i=1:nAlfa
  rB = posB(i,:);
  nT = (rB-rA)/norm(rB-rA);
  MO = cross(rA,T*nT);
  Mnorm(i) = norm(MO);
end

figure(2);clf
plot(alfa, Mnorm, 'r-', 'linewidth', 4)
xlabel('\alpha [rad]','fontsize',24)
ylabel('|M_O| [kJ]','fontsize',24)
xlim([0,2*pi])
set(gca,'fontsize',20,'linewidth',1,...
        'xtick',[0,pi,2*pi],'xticklabel',['0';'\pi'; '2\pi'])
fig2 = gcf ();
set(fig2, "numbertitle", "off", "name", "Norma Momento Torsor en O")


%=====================================================
% Animacion
for i=1:nAlfa
  rB = posB(i,:);
  nT = (rB-rA)/norm(rB-rA);
  MO = cross(rA,T*nT)*0.25; %reducimos el valor 1/4 para visualización

  tenB=[rA;rB];
  auxP=[rA; 1.7,0.0,0.0; rB];
      
  figure(3);clf
  subplot(1,2,1)
  hold on
  plot3(brazo(:,1),brazo(:,2),brazo(:,3),'ko-','markersize',4,'linewidth',3)
  plot3( tenB(:,1), tenB(:,2), tenB(:,3),'bo--','markersize',4,'linewidth',1)
  plot3( posB(:,1), posB(:,2), posB(:,3),'k--','markersize',8,'linewidth',2)
  plot3( auxP(:,1), auxP(:,2), auxP(:,3),'k--o','markersize',8,'linewidth',2)
  h1=quiver3(rA(1), rA(2), rA(3), nT(1), nT(2), nT(3),'b','linewidth',2);
  h2=quiver3(    0,     0,     0, MO(1), MO(2), MO(3),'r','linewidth',3);
  set (h1, "maxheadsize", 0.2);
  set (h2, "maxheadsize", 0.2);
  hold off
  text( 0.2,-0.15, 0.15,'O','fontsize',20,'fontweight','bold')
  text( 1.7, 0.0, 2.3,'A','fontsize',20,'fontweight','bold')
  text( rB(1)*1.1, rB(2)*1.1, rB(3)*1.2,'B','fontsize',20,'fontweight','bold')
  text( mean(tenB(:,1))*0.95, mean(tenB(:,2)), mean(tenB(:,3)),'T',...
        'color','blue','fontsize',20,'fontweight','bold')
  text( MO(:,1)*0.5, MO(:,2)*0.5, MO(:,3)*0.5+0.1,'M_O',...
        'color','red','fontsize',20,'fontweight','bold')
  xlabel('x [m]','fontsize',16)
  ylabel('y [m]','fontsize',16)
  zlabel('z [m]','fontsize',16)
  set(gca,'fontsize',18,'linewidth',2)
  %grid
  box off
  axis square
  xlim([-0.7,3.3])
  ylim([-1.6,1.6])
  zlim([-0.6,2.3])
  view(142.258,20.252)
  
  subplot(1,2,2)
  hold on
  plot(alfa, Mnorm, 'r-', 'linewidth', 2)
  plot(alfa(i), Mnorm(i),'ko','markersize',12,'linewidth',2,'markerfacecolor','g')
  hold off
  xlabel('\alpha [rad]','fontsize',20)
  ylabel('|M_O| [J]','fontsize',20)
  xlim([0,2*pi])
  set(gca,'fontsize',18,'linewidth',2,...
     'xtick',[0,pi,2*pi],'xticklabel',{'0';'\pi';'2\pi'})
  axis square
  
  fig1 = gcf ();
  set(gca,'fontsize',18)
  set(fig1, "numbertitle", "off", "name", "Brazo Tensionado")
  
  %Solo para el primer valor de alfa: maximizar la ventana.
  if i==1
    set(fig1, 'Position', get(0, 'Screensize'));
    pause(1)
  end
  pause(0.001)
    
end
