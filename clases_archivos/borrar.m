clear 
close all

x = -pi:pi/20:pi; 
y = sin(x);
plot(x,y,'-r','LineWidth',2)
set(gca,'fontsize',20,'linewidth',2)
set(gca,'Xtick',-pi:pi/2:pi)
pause(4)
set(gca,'XTickLabel',{'-pi','-pi/2','0','\pi/2','\pi'})