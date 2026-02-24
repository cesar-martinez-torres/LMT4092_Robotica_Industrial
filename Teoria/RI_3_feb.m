%% Ejercicio 1.2
clear
close all
W=SE3()
cTb=transl(0,0,2)*troty(180,'deg')*trotz(90,'deg')
bTc=inv(cTb) % No solicitada por el ejercicio
% Segundo metodo
wTa=transl(0,1,1)
wTb=transl(-1,2,1)
wTc=transl(-1,2,3)*troty(180,'deg')*trotz(90,'deg')
cTw=inv(wTc)
cTb2=cTw*wTb
% Punto 2
wp1=[0,1,1]
wp2=[0,3,1]
wp3=[-2,3,1]
wp4=[-2,1,1]
figure
trplot(W,'frame','W','arrow')
hold on
plot_point3(wp1)
plot_point3(wp2)
plot_point3(wp3)
plot_point3(wp4)
trplot(wTa,'frame','A','arrow')
trplot(wTb,'frame','B','arrow')
trplot(wTc,'frame','C','arrow')
grid on
% Punto 3 cTb se considera siempre conocido.
aTw=inv(wTa)
syms tx ty tz rx ry rz
cTbs=transl(tx,ty,tz)*trotx(rx,'deg')*troty(ry,'deg')*trotz(rz,'deg')
aTb=aTw*wTc*cTbs
% Aqui va el codigo para verificar si el objeto esta fuera de la mesa
% Punto 4
figure
plot3DLine(wp1',wp2')
hold on
plot3DLine(wp2',wp3')
plot3DLine(wp3',wp4')
plot3DLine(wp4',wp1')
grid on
