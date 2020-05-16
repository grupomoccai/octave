% Introduccion a Octave - 2020 - FCAI-UNCuyo - MoCCAI
% 
% Trabajo Practico 4 - Ejercicio 1
% Serie uniformemente convergente para x en el intervalo [0,1].
clc
clear
close all

%----------------------------------------------------------
% 1) x=1, error de corte e_N = 1e-06

N = 1e6; % proponemos un valor de N muy grande
         % esta forma de proceder implica un calculo mas eficiente a expensas
         % de consumir mas memoria (ver e_n en linea 16).
         
%inicializamos valores 
x   = 1;
s_k = 0;         %valor acumulado de los terminos de la serie 
e_n = ones(N,1); %vector que guarda los errores de sumar solo k-terminos

k   = 1;
e_k = 1;
while (e_k>1e-06)
    y_k  = k*k + k*x;   %k-esimo termino de la serie
    s_k  = s_k + 1/y_k; %valor acumulado de los terminos de la serie
    
    e_k  = abs(1-s_k);  %error hasta el k-esimo valor de la serie
    e_n(k) = e_k;       %guardamos en e_n el error 
    
    if mod(k,50000) == 0 %monitoreamos cada 50000 terminos
        printf("k=%6d  e_k=%6.2e\n", k, e_k);
    endif
    k = k+1;
end

% N : numero de terminos que deben ser considerados para que el valor 
%     aproximado tenga un error a lo sumo de 1e-6
N   =k-1;  %porque se suma 1 en la ultima linea del while
e_n = e_n(1:N);

printf("N=%d  e_N=%g | phi(1)=1  aprox_phi(1)=%9.7f\n", N, e_n(N), s_k);

figure(1);clf
loglog(1:N,e_n,'-b')
xlabel('n','fontsize',24)
ylabel('e_n(1)','fontsize',24)
set(gca,'fontsize',20,'linewidth',2)

%----------------------------------------------------------
% 2) x=0.5, error de truncamiento = 0.5e-08


%----------------------------------------------------------
% 3)