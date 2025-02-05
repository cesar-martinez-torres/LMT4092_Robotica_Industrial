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
%% Inciso b
AtW=inv(WtA)
AtD=AtW*WtD
BtE=(inv(WtB)*WtE)
DtC=(inv(WtD)*WtC)
EtB=(inv(WtE)*WtB)
EtC=(inv(WtE)*WtC)
%% Inciso c
Cp1h=(inv(WtC.T))*Wp1h
Cp2h=(inv(WtC.T))*Wp2h
Cp3h=(inv(WtC.T))*Wp3h
Cp4h=(inv(WtC.T))*Wp4h
Cp5h=(inv(WtC.T))*Wp5h
Cp6h=(inv(WtC.T))*Wp6h

Bp1h=(inv(WtB.T))*Wp1h
Bp2h=(inv(WtB.T))*Wp2h
Bp3h=(inv(WtB.T))*Wp3h
Bp4h=(inv(WtB.T))*Wp4h
Bp5h=(inv(WtB.T))*Wp5h
Bp6h=(inv(WtB.T))*Wp6h

Dp4h=(inv(WtD.T))*Wp4h
Ep6h=(inv(WtE.T))*Wp6h

% Punto Dp1
Dp1h=(inv(WtD.T))*Wp1h

%% Inciso d
Bp4h=((inv(WtB.T))*(WtD.T))*(Dp4h)






