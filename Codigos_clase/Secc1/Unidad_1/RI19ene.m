%% Ejercicio 1.1
close all
% Generar los ejes de referencia
W=SE2(0,0,0,'deg')
wTr=SE2(5,2,10,'deg')
wTl=SE2(3,6,0,'deg')
wTa=SE2(5,5,15,'deg')
% Calcular relaciones de ejes faltantes
aTw=inv(wTa)% OK
rTw=inv(wTr)%aux
rTa=rTw*wTa %OK
aTr=inv(rTa)%OK
aTl=aTw*wTl %OK
%Generar puntos con respecto a W
wP3e=[7,3]'
wP4e=[4;8]
% Puntos que no pertenecen a W
lP1e=[1;2]
aP2e=[1;2]
% Calcular puntos restantes
wP2e=wTa*aP2e
wP1e=wTl*lP1e
figure
trplot2(W,'frame', 'W')
hold on
trplot2(wTr,'frame', 'R')
trplot2(wTl,'frame', 'L')
trplot2(wTa,'frame', 'A')
plot_point(wP3e, '*')
plot_point(wP4e, '*')
plot_point(wP1e, '*')
plot_point(wP2e, '*')
axis([-1 8 -1 9])
grid on
