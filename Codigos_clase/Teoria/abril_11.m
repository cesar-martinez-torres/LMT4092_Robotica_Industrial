% 11 abril
clear 
close all
mdl_puma560
figure
p560.plot(qn)
%% Muñeca esferica
me=p560.isspherical
T=p560.fkine(qn)
% Resolviendo la cin inversa
Q=p560.ikine6s(T,'d')
T2=p560.fkine(Q)
figure
p560.plot(Q)
%% Generando trayectorias
%qz a ready (0 0 0 0 0 0) => (0 0 -180 0 0 0)
M=100
ready=[0 0 -pi 0 0 0]
Q1=jtraj(qz(1),ready(1),M)
Q2=jtraj(qz(2),ready(2),M)
Q3=jtraj(qz(3),ready(3),M)
Q4=jtraj(qz(4),ready(4),M)
Q5=jtraj(qz(5),ready(5),M)
Q6=jtraj(qz(6),ready(6),M)
Qt1=[Q1 Q2 Q3 Q4 Q5 Q6]
%% Primer lado del triangulo
Tready=p560.fkine(ready)
t=[0.7115;-0.1501;-0.4318]
Tesq1=SE3(Tready.R,t)
Qesq1=p560.ikine6s(Tesq1)% Si es alcanzable
Tt2=ctraj(Tready,Tesq1,100)
Qt2=p560.ikine6s(Tt2)
close all
trayectoria=[Qt1;Qt2]
figure
p560.plot(trayectoria)