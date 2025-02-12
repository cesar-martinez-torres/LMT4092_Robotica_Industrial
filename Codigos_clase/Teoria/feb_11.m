%% Ejercicio 1.2
clear
close all
WtW=transl(0,0,0)
WtA=transl(0,1,1)
AtB=transl(-1,1,0)
BtC1=transl(0,0,2)
BtC2=trotz(-90,'deg')*troty(180,'deg')
BtC=BtC1*BtC2
WtB=WtA*AtB
WtC=WtA*AtB*BtC
figure
trplot(WtW,'frame','W')
hold on
trplot(WtA,'frame','A')
trplot(WtB,'frame','B')
trplot(WtC,'frame','C')
%% Puntos de la mesa con respecto a A
Ae1e=[0;0;0]
Ae1h=e2h(Ae1e)
Ae2e=[-2;0;0]
Ae2h=e2h(Ae2e)
Ae3e=[-2;2;0]
Ae3h=e2h(Ae3e)
Ae4e=[0;2;0]
Ae4h=e2h(Ae4e)
We1h=WtA*Ae1h
We1e=h2e(We1h)
We2h=WtA*Ae2h
We2e=h2e(We2h)
We3h=WtA*Ae3h
We3e=h2e(We3h)
We4h=WtA*Ae4h
We4e=h2e(We4h)
figure
trplot(WtW,'frame','W')
hold on
trplot(WtA,'frame','A')
trplot(WtB,'frame','B')
trplot(WtC,'frame','C')
plot_point3(We1e,'Label','E1')
plot_point3(We2e,'Label','E2')
plot_point3(We3e,'Label','E3')
plot_point3(We4e,'Label','E4')