%% Cinematica Directa
% Robot planar 1GDL
syms q1 %Radianes
a1=2
aTb=trotz(q1)*transl(a1,0,0)
% Robot Planar de 2GDL
clear
syms q1 q2
a1=2
a2=3
aTb=trotz(q1)*transl(a1,0,0)
bTc=trotz(q2)*transl(a2,0,0)
aTc=