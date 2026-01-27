%% Ejercicio 1.1
clear
close all
W=trot2(0)% Puede ser generado de varias formas, SE2() o transl2(0,0)
wTc=transl2(8,2)% Eje de referencia C
% Puntos en el espacio con respecto a W
wmi=[4;6]
wmd=[12;6]
wac=[6;7]
wacp=[10;7]
wrd=[12;9]
wtt=[12;3]
figure
trplot2(W,'frame','W','arrow')
hold on
trplot2(wTc,'frame','C','arrow')
plot_point(wmi,'*')
plot_point(wmd,'*')
plot_point(wac,'*')
plot_point(wacp,'*')
plot_point(wrd,'*')
plot_point(wtt,'*')
grid on
%% Calcular los puntos con respecto a C
cTw=inv(wTc)
% Convertir los puntos a homogeneos para realizar los calculos
wmih=e2h(wmi)
wmdh=e2h(wmd)
wach=e2h(wac)
wacph=e2h(wacp)
wrdh=e2h(wrd)
wtth=e2h(wtt)
% Calcular los puntos con respecto a C
cmih=cTw*wmih
cmdh=cTw*wmdh
cach=cTw*wach
cacph=cTw*wacph
crdh=cTw*wrdh
ctth=cTw*wtth
%% ii)
wTc2=transl2(11,5)*trot2(45,'deg')
% Calcular los puntos con respecto a W
wmih2=wTc2*cmih
wmdh2=wTc2*cmdh
wach2=wTc2*cach
wacph2=wTc2*cacph
wrdh2=wTc2*crdh
wtth2=wTc2*ctth
% Convertir a puntos euclidianos
wmi2=h2e(wmih2)
wmd2=h2e(wmdh2)
wac2=h2e(wach2)
wacp2=h2e(wacph2)
wrd2=h2e(wrdh2)
wtt2=h2e(wtth2)
figure
trplot2(W,'frame','W','arrow')
hold on
trplot2(wTc2,'frame','C','arrow')
plot_point(wmi2,'*')
plot_point(wmd2,'*')
plot_point(wac2,'*')
plot_point(wacp2,'*')
plot_point(wrd2,'*')
plot_point(wtt2,'*')
grid on



