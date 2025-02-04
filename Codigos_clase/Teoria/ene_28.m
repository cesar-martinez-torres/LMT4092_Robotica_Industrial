%% Ejemplo 1
clear
close all
WtW=transl2(0,0);
WtA=trot2(25,'deg')*transl2(3,3)
WtB=transl2(5,0)
WtC=transl2(2,5)*trot2(32,'deg')
Bp1e=[3;3]
Bp1h=e2h(Bp1e)
%% Dibujar los ejes de referencia
figure
trplot2(WtW,'frame','W')
hold on
trplot2(WtA,'frame','A')
trplot2(WtB,'frame','B')
trplot2(WtC,'frame','C')
grid on

%% Calcular Wp1
Wp1h=WtB*Bp1h
Wp1e=h2e(Wp1h)
%% Dibujar punto
figure
trplot2(WtW,'frame','W')
hold on
trplot2(WtA,'frame','A')
trplot2(WtB,'frame','B')
trplot2(WtC,'frame','C')
plot_point(Wp1e,'*')
grid on

%% Obtener p1 con respecto a los otros ejes
AtB=(inv(WtA))*WtB
Ap1h=AtB*Bp1h
CtB=(inv(WtC))*WtB
Cp1h=CtB*Bp1h