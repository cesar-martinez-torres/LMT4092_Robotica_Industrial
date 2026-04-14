%% Cinemática Inversa (Regla de Pieper)
clear
close all
syms q1 q2 q3
l1=2
L(1)= Link([0 l1 0 pi/2 0]); %Generar cada uno de los eslabones
L(2)= Link([0 0 0 -pi/2 0]);
L(3)= Link([0 0 0 0 1]);
L(3).qlim=[0 2];
diap37= SerialLink(L, 'name', 'Diapo 37');
% Para ec1 a=-py y b=px
Q=[0 0 1.5]
T=diap37.fkine(Q)
pos=T.t
a1=-pos(2);
b1=pos(1);
q1sol1=atan2(a1,-b1)
q1sol2=atan2(-a1,b1)
% q2 soluciones se necesitan 4, 2 de q1sol1 y 2 de q1sol2
%Para q1sol1
u1=pos(1)*cos(q1sol1)
v1=sin(q1sol1)
a2=u1+(v1*pos(2))
b2=pos(3)-l1
q2sol1=atan2(a2,-b2)
q2sol2=atan2(-a2,b2)
Q_cand1=[q1sol1 q2sol1]
Q_cand2=[q1sol1 q2sol2]
%Para q1sol2
u2=pos(1)*cos(q1sol2)
v2=sin(q1sol2)
a2=u2+(v2*pos(2))
b2=pos(3)-l1
q2sol1=atan2(a2,-b2)
q2sol2=atan2(-a2,b2)
Q_cand3=[q1sol2 q2sol1]
Q_cand4=[q1sol2 q2sol2]
% q3 solo tiene una solucion
q3sol1=pos(3)*cos(q2sol1) - 2*cos(q2sol1) - pos(1)*cos(q1sol1)*sin(q2sol1) - pos(2)*sin(q1sol1)*sin(q2sol1)
Q_cand1=[q1sol1 q2sol1 q3sol1] % No es viable, q3 no toma valores negativos...
q3sol1=pos(3)*cos(q2sol2) - 2*cos(q2sol2) - pos(1)*cos(q1sol1)*sin(q2sol2) - pos(2)*sin(q1sol1)*sin(q2sol2)
Q_cand2=[q1sol1 q2sol2 q3sol1]
q3sol1=pos(3)*cos(q2sol1) - 2*cos(q2sol1) - pos(1)*cos(q1sol2)*sin(q2sol1) - pos(2)*sin(q1sol2)*sin(q2sol1)
Q_cand3=[q1sol2 q2sol1 q3sol1]
q3sol1=pos(3)*cos(q2sol2) - 2*cos(q2sol2) - pos(1)*cos(q1sol2)*sin(q2sol2) - pos(2)*sin(q1sol2)*sin(q2sol2)
Q_cand4=[q1sol2 q2sol2 q3sol1]
% Validar calculos
Tc=diap37.fkine(Q_cand1)
error_pos=pos-Tc.t
error_ori=T.R-Tc.R


