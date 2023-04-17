%% RI 14ABR
clear
close all
mdl_puma560
figure
p560.teach
% q1,q4,q4,q6 van de 0 a 0
q1t=jtraj(0,0,50)
q4t=jtraj(0,0,50)
q5t=jtraj(0,0,50)
q6t=jtraj(0,0,50)
% q2 va de 0 a pi/2
q2t=jtraj(0,pi/2,50)
% q3 va de 0 a -pi/2
q3t=jtraj(0,-pi/2,50)
% plotear trayectorias
t=[0:1:49]
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
% Trayectorias coordinadas
Q=[q1t q2t q3t q4t q5t q6t]
figure
p560.plot3d(Q)
