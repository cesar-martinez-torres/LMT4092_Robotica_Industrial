%% Lab 1 S2
close all
%Generar ejes de referencia
A=SE2(0,0,0,'deg')
aTb=SE2(4,5,60,'deg')
aTc=SE2(8,10,77,'deg')
aTd=SE2(7,6,0,'deg')
aTe=SE2(10,15,15,'deg')
%Generar puntos
aP1=[5;2]
aP2=[3;3]
aP3=[7;7]
aP4=[4;4]
aP5=[8;2]
aP6=[3;1]
% Plotear puntos y ejes de referencia
figure
trplot2(A, 'frame', 'A')
hold on
trplot2(aTb, 'frame', 'B')
trplot2(aTc, 'frame', 'C')
trplot2(aTd, 'frame', 'D')
trplot2(aTe, 'frame', 'E')
% Puntos
plot_point(aP1, '*')
plot_point(aP2, '*')
plot_point(aP3, '*')
plot_point(aP4, '*')
plot_point(aP5, '*')
plot_point(aP6, '*')
axis([-1 inf -1 inf])
grid on
%% punto 2
bTa=inv(aTb)%aux
bTe=bTa*aTe%OK
%% Calcular puntos
dTa=inv(aTd)
dP4=dTa*aP4





