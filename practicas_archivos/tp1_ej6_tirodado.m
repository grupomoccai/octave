% Introduccion a Octave - 2020 - FCAI-UNCuyo
% 
%
%% Guia de problemas 1

% El script esta listo para ejecutarlo e interpretar los resultados.
% Intente comprender que se esta haciendo en cada paso. 

N=1000;       
x=rand(1,N);  
x=ceil(6*x);  
%
%sacar un 3
sum(x==3)/N
%
%histograma
%
hist(x,6)
p=hist(x,6)/N

