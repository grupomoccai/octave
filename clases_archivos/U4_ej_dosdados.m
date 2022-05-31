% Introduccion a Octave - 2022 - FCAI-UNCuyo - MoCCAI/DIMEC

% Unidad 4
% Ejemplo: simule tirar dos dados hasta que la
% suma de ambas caras sea 7, cuente el numero 
% de tiradas. Repita esto 1000 veces y estime 
% la probabilidad y compare esta con el valor teorico.

clear


%------------------------------------------------
% Tiramos 2 dados hasta que la suma de las caras es 7, 
% el proceso lo repetimos N veces
N=100000;

k=0;  %numero de tiradas totales

for i=1:N
  s = 0;   %valor de sumar ambas caras del dado
  while (s~=7)
    s = sum(ceil(rand(1,2)*6));
    k = k+1;
  end
end

% probabilidad de que salga un 7 es: casos_favorables/casos_totales
disp([N/k, 6/36])


%------------------------------------------------
% Ahora realizamos el histograma obtenido de arrojar N
% veces dos dados y sumar sus caras
da2 = sum(ceil(rand(N,2)*6),2);

% Densidad de probabilidad empirica de la muestra
pMue= hist(da2,11);
pMue= pMue/N;

% Densidad de probabilidad teorica
pTeo= [1,2,3,4,5,6,5,4,3,2,1]/36;

figure(1);clf
hold on
plot(2:12,pMue,'ro-','linewidth',2,'markersize',20)
plot(2:12,pTeo,'b*-','linewidth',2,'markersize',20)
hold off
xlabel('D_1+D_2','fontsize',20)
ylabel('P(D_1+D_2)','fontsize',20)
leg=legend('Densidad Empírica','Densidad Teórica')
grid on
set(leg,'fontsize',20,'box','off','location','northwest')
set(gca,'fontsize',20)
set(gca,'XTick',2:12)
set(gca,'YTick',(1:6)/36,...
        'YTickLabel',{'1/36','2/36','3/36','4/36','5/36','6/36'})
set(gcf,'Number','off','Name','Función de Densidad de Probabilidad - Suma 2 Dados')