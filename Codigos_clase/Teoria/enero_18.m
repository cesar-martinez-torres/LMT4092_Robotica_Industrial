%% 
bP=[2;5]
bPh=e2h(bP)%Euclidiano a Homogeneo
bP=h2e(bPh)%Homogeneo a Euclidiano
%% Ejercicio 1
clear 
close all
cP1e=[6,2]'
cP2e=[3,2]'
cP3e=[6,4]'
cP4e=[3,4]'
cP5e=[4.5,4.5]'
W=SE2()
wTc=SE2(3.8,-10,122,'deg')
figure
trplot2(W,'frame','W','color','b')
grid on
hold on
trplot2(wTc,'frame','C','color','k')
%% calcular puntos con respecto a W (Global de MATLAB)
% 2.- Realizar el calculo para "mapear" los puntos al eje W
wp1e=(wTc)*cP1e
wp2e=(wTc)*cP2e
wp3e=(wTc)*cP3e
wp4e=(wTc)*cP4e
wp5e=(wTc)*cP5e
% Plotear los puntos
figure
trplot2(W,'frame','W','color','b')
grid on
hold on
trplot2(wTc,'frame','C','color','k')
plot_point(wp1e,'*')
plot_point(wp2e,'bo')
plot_point(wp3e,'o')
plot_point(wp4e,'*')
plot_point(wp5e,'*')
