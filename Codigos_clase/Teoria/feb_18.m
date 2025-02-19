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
%% Febrero 17 Ejercicio 1.2 Inciso 3
syms x y
AtBsim=transl(x,y,0)
WtBsim=WtA*AtBsim
x=5%Con respecto a A
y=6%Con respecto a A
WtB1=eval(WtBsim)
% if limite de la mesa con respecto a A
% Con respecto a C (camara)
syms xc yc
CtW=inv(WtC)
CtA=CtW*WtA
CtB=CtA*AtBsim
%% Inciso 4
Wp1e=[0;1;0]
Wp2e=[-2;1;0]
Wp3e=[-2;3;0]
Wp4e=[0;3;0]
Ws1e=[-2;3;3]
Ws2e=[-1;2;3]
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
plot_point3(Wp1e,'Label','P1')
plot_point3(Wp2e,'Label','P2')
plot_point3(Wp3e,'Label','P3')
plot_point3(Wp4e,'Label','P4')
plot_point3(Ws1e,'Label','S1')
plot_point3(Ws2e,'Label','S2')
plot3DLine(We1e,We2e)
plot3DLine(We2e,We3e)
plot3DLine(We3e,We4e)
plot3DLine(We1e,We4e)
plot3DLine(We1e,Wp1e)
plot3DLine(We2e,Wp2e)
plot3DLine(We3e,Wp3e)
plot3DLine(We4e,Wp4e)
plot3DLine(We3e,Ws1e)
plot3DLine(Ws1e,Ws2e)





