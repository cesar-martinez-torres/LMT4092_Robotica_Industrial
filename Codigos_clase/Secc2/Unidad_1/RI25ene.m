%% Robotica industrial S2 25 ENERO
% Definir ejes de referencia
clear 
close all
W=transl(0,0,0)
wTa=transl(0,1,1)
aTb=transl(-1,1,0)
wTb=wTa*aTb
R=rotx(180,'deg')*roty(0,'deg')*rotz(-90,'deg')
t=[0,0,2]
bTc=SE3(R,t)
wTc=wTa*aTb*bTc.T
figure
trplot(W, 'frame', 'W')
hold on
trplot(wTa, 'frame', 'A')
trplot(wTb, 'frame', 'B')
trplot(wTc, 'frame', 'C')
grid on
% Puntos
aP1e=[0;0;0]
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
plot3(wP1e(1),wP1e(2),wP1e(3),'o')
plot3(wP2e(1),wP2e(2),wP2e(3),'o')
plot3(wP3e(1),wP3e(2),wP3e(3),'o')
plot3(wP4e(1),wP4e(2),wP4e(3),'o')
grid on
% Matriz simbolica
syms thx thy thz x y z
Rsym=rotx(thx)*roty(thy)*rotz(thz)
tsym=[x,y,z]
aTbsym=SE3(Rsym,tsym)
wTbsym=wTa*aTbsym.T
% Evaluar un punto
thx=pi
thy=0
thz=pi/2
x=-1
y=1.5
z=0
wTbmovil=eval(wTbsym)
Orpy=tr2rpy(wTbmovil)
Orpy=rad2deg(Orpy)
