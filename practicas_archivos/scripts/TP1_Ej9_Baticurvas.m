% Introduccion a Octave - 2022 - FCAI-UNCuyo
% 
%
%% Guia de problemas 1
%
% Ingrese las funciones necesarias para graficar las baticurvas

close all;
clear all; 

f1 = 0;	% <=== COMPLETAR 
f2 = 0; % <=== COMPLETAR 
f3 = 0; % <=== COMPLETAR 
f4 = 0; % <=== COMPLETAR 
f5 = 0; % <=== COMPLETAR 

figure(1);clf
hold on
%c(1) = ezplot(0, [-7 -3 -2.5 0]); 	    % <=== COMPLETAR Y DESCOMENTAR
%c(2) = ezplot(0, [-7 -3 0 2.8]);  	    % <=== COMPLETAR Y DESCOMENTAR
%c(3) = ezplot(0, [3 7 -2.5 0]);   	    % <=== COMPLETAR Y DESCOMENTAR
%c(4) = ezplot(0, [3 7 0 2.8]);    	    % <=== COMPLETAR Y DESCOMENTAR
%c(5) = ezplot(0,[-4 4]);         	    % <=== COMPLETAR Y DESCOMENTAR
%c(6) = ezplot(0,[-1 -0.75]);		        % <=== COMPLETAR Y DESCOMENTAR
%c(7) = ezplot(0,[0.75 1 ]);		        % <=== COMPLETAR Y DESCOMENTAR
%c(8) = ezplot(0,[-0.75 -0.5 2.25 3]);  % <=== COMPLETAR Y DESCOMENTAR
%c(9) = ezplot(0,[ 0.5 0.75 2.25 3]);   % <=== COMPLETAR Y DESCOMENTAR
%c(10) = ezplot(0,[-3 -0.75]);		      % <=== COMPLETAR Y DESCOMENTAR
%c(11) = ezplot(0,[0.75 3]);		        % <=== COMPLETAR Y DESCOMENTAR
c(12) = line([-0.5,0.5],[2.25,2.25]);  
set(c,'linewidth',6)
xlim([-8 8])
ylim([-4 4])
colormap([0 0 1])
grid on

title('BATICURVAS','fontsize',20);
xlabel('X','fontsize',14);
ylabel('Y','fontsize',14);
hold off
