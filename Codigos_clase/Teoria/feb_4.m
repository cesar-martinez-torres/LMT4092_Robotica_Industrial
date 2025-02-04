%% Ejercicio 1.1 2 de febrero
clear
close all
% Ejes de referencia (SE2=> Traslacio => Rotacion) !!!Objeto SE2
WtW=SE2(0,0,0)
WtA=SE2(0,0,0)
WtB=SE2(4,5,60,'deg')
WtC=SE2(8,10,77,'deg')
WtD=SE2(7,6,0,'deg')
WtE=SE2(10,15,15,'deg')
% Puntos
% Euclidiano para poder graficar...
Wp1e=[5;2]
Wp2e=[3;3]
Wp3e=[7;7]
Wp4e=[4;4]
Wp5e=[8;2]
Wp6e=[3;1]
% Homogeneo para realizar cálculos
Wp1h=e2h(Wp1e)
Wp2h=e2h(Wp2e)
Wp3h=e2h(Wp3e)
Wp4h=e2h(Wp4e)
Wp5h=e2h(Wp5e)
Wp6h=e2h(Wp6e)
%% Plotear puntos y ejes
figure
trplot2(WtW,'frame','W')
hold on
trplot2(WtA,'frame','A','color','k')
trplot2(WtB,'frame','B','color','c')
trplot2(WtC,'frame','C','color','b')
trplot2(WtD,'frame','D','color','r')
trplot2(WtE,'frame','E','color','g')
plot_point(Wp1e,'*')
plot_point(Wp2e,'*')
plot_point(Wp3e,'*')
plot_point(Wp4e,'*')
plot_point(Wp5e,'*')
plot_point(Wp6e,'*')
grid on




