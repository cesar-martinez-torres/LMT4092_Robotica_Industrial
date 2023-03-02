%% Repaso
clear
close all
Wm=SE3();
O=trotx(180,'deg')*trotz(90,'deg')
figure
trplot(Wm)
hold on
trplot(O)
%% 
syms xd yd rxd ryd rzd
SOD=rotx(rxd)*roty(ryd)*rotz(rzd)
td=[xd yd 3]
wmTd=SE3(SOD,td)
syms xc yc rzc
SOC=rotz(rzc)
tc=[xc yc 0]
wmTc=SE3(SOC,tc)
dTc=inv(wmTd)*wmTc
rxd=pi/4
ryd=0
rzd=0
rzc=0
xc=0
yc=0
xd=0
yd=0
dTc=dTc.T
dTc=eval(dTc)
Cp=[200/1000; 0; -20/1000;1]
Dp=dTc*Cp
%% DH
clear
close all
l1=5
l2=6
l3=2
A(1)= Link([0 0 5 0 1]); %Generar cada una de las articulaciones 
A(1).qlim = [0 5];
A(2)= Link([0 0 6 0 0]);%th,d,a,alpha, tipo art; 0=rot 1=pris
A(3)= Link([0 0 2 0 0]);
examen= SerialLink(A, 'name', 'Examen'); %Unir articulaciones
syms q1 q2 q3
Q=[2 pi/4 pi/2]
[T,ALL] = examen.fkine(Q)
figure
examen.teach


