%% RI 13abril
clear
close all
mdl_puma560
% Ir de qz a qn
% Crear trayectorias
%q1, q4 y q6 van de 0 a 0
q1t=jtraj(0,0,10)
q4t=jtraj(0,0,10)
q6t=jtraj(0,0,10)
% Para q2
q2t=jtraj(0,0.7854,10)
q3t=jtraj(0,3.1416,10)
q5t=jtraj(0,0.7854,10)
%figure
%p560.plot(qz)
%pause
%p560.plot(qn)
close all
t=[0:1:9]
figure
subplot(6,1,1)
plot(t,q1t)
subplot(6,1,2)
plot(t,q2t)
subplot(6,1,3)
plot(t,q3t)
subplot(6,1,4)
plot(t,q4t)
subplot(6,1,5)
plot(t,q5t)
subplot(6,1,6)
plot(t,q6t)
% Unir trayectorias
Q=[q1t q2t q3t q4t q5t q6t]
figure
p560.plot3d(Q)



