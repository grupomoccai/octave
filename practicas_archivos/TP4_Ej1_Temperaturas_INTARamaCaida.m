% Introduccion a Octave - 2020 - FCAI-UNCuyo - MoCCAI
% 
% Trabajo Practico 4 - Ejercicio 1
%
% Analisis Oasis Sur de Mendoza - Temperaturas Estacion INTA Rama Caida

% Leemos los datos del archivo .csv
[fecha,hora,temp]=textread('Temperaturas_INTARamaCaida_2016-2017.csv',"%s %s %f");

% 1) Graficar las temperaturas en funcion del tiempo

N=length(temp);  %numero de elementos registrados en temp
ndias=(1:N)/48;  %numeros de dias

figure(1);clf
plot(ndias, temp)
xlim([0,365])
xlabel('#dias','fontsize',20)
ylabel('ºC','fontsize',20)
  
% 2) Graficar la temperatura maxima diaria en funcion del tiempo
% 3) Graficar la temperatura minima diaria en funcion del tiempo
% 4) Graficar la temperatura media diaria en funcion del tiempo

%temperaturas diarias (48 mediciones)
tmin=zeros(1,N/48);
tmax=zeros(1,N/48);
tmed=zeros(1,N/48);

%% AQUI es donde deben trabajar!
for id=1:N/48
  elemI = (id-1)*48+1:id*48;  %de las mediciones de cada dia del anio
  tempI = zeros(size(elemI)); %completar con las mediciones de temp/dia
  tmin(id)=0;  %completar
  tmax(id)=0;  %completar
  tmed(id)=0;  %completar
end

%graficamos
figure(2);clf
hold on
plot(tmin,'r-')
plot(tmax,'b-')
plot(tmed,'k-')
hold off
xlabel('#dias','fontsize',20)
ylabel('ºC','fontsize',20)
h=legend('T_{min}', 'T_{max}', 'T_{med}', "location","northwest");
xlim([0,365])
set(h,'fontsize',20)
set(gca,'fontsize',16)
set(gcf, "numbertitle", "off", "name", "Estacion Rama Caida")

% 5) Verifica que los valores reportados en el informe del INTA son correctos.
[tabs1,iabs1]=min(temp);
[tabs2,iabs2]=max(temp);

fprintf(1,'### La temperatura mínima es %4.2f ºC\n', tabs1);
fprintf(1,'### La temperatura máxima es %4.2f ºC\n', tabs2);
fprintf(1,'### La temperatura media  es %4.2f ºC\n', mean(temp));
 
% 6) Determinar el dia en que se han obtenido los valores de temperatura media, 
%    maxima y minima absoluta reportados en el informe del inta.

diamax = fecha{iabs1};
diamin = fecha{iabs2};
fprintf(1,'### La temperatura minima se registro el %s\n', diamin);
fprintf(1,'### La temperatura maxima se registro el %s\n', diamax);
