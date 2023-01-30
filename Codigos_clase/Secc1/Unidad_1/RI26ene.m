%% Robotica industrial S1 26ene
clear
close all
% Generacion de ejes
W=transl(0,0,0)
wTa=transl(0,1,1)
aTb=transl(-1,1,0)
R=rotx(180,'deg')*roty(0,'deg')*rotz(-90,'deg')
t=[0,0,2]
bTc=SE3(R,t)
wTb=wTa*aTb
wTc=wTb*bTc.T
figure
trplot(W, 'frame', 'W')
hold on
trplot(wTa, 'frame', 'A')
trplot(wTb, 'frame', 'B')
trplot(wTc, 'frame', 'C')
xlim([-3 3])
ylim([-3 3])
zlim([-3 3])
view(45,45)
% Puntos
aP1e=[0,0,0]'
aP1h=e2h(aP1e)
wP1h=wTa*aP1h
wP1e=h2e(wP1h)
wP2e=[0,3,1]'
wP3e=[-2,3,1]'
wP4e=[-2,1,1]'
figure
trplot(W, 'frame', 'W')
hold on
trplot(wTa, 'frame', 'A')
trplot(wTb, 'frame', 'B')
trplot(wTc, 'frame', 'C')
plot_point3(wP1e, 'Marker', 'o', 'Label', 'wP1', 'Color', 'r'); %Funcion plot_point3
plot_point3(wP2e, 'Marker', 'o', 'Label', 'wP2', 'Color', 'b');
plot_point3(wP3e, 'Marker', 'o', 'Label', 'wP3', 'Color', 'k');
plot_point3(wP4e, 'Marker', 'o', 'Label', 'wP4', 'Color', 'g');
xlim([-3 3])
ylim([-3 3])
zlim([-3 3])
view(45,45)
% matriz simbolica
syms thx thy thz x y z
Rsym=rotx(thx)*roty(thy)*rotz(thz)
tsym=[x;y;z]
aTbsym=SE3(Rsym,tsym)
wTbsym=wTa*aTbsym.T
%Evaluar un punto
thx=pi
thy=pi/2
thz=pi/4
x=-1.5
y=1.3
z=0
wTb=eval(wTbsym)


