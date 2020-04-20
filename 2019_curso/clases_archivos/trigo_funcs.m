% Archivo de ordenes: trigo_funcs.m

t=linspace(0,2*pi,90)';

figure(1);clf
hold on
plot(t,cos(t),'r- ','linewidth',3)
plot(t,sin(t),'b--','linewidth',3)
hold off
axis tight
xlabel('t','fontsize',20)
hlg=legend('cos(t)','sin(t)','location','north')
legend boxoff
set(gca,'fontsize',20)
set(hlg,'fontsize',20,'fontweight','b')
set(gca,'Xtick',0:pi/2:2*pi)
set(gca,'XtickLabel',...
    {'0','\pi/2','\pi','3\pi/2','2\pi'})
set(gcf,'number','off','name','Funciones Trigonometricas')

