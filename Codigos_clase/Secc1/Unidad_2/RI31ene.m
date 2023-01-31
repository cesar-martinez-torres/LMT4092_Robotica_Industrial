%% Robotica industrial S1 31ene
%RR Planar
syms q1 q2 
R1=trot2(q1)%q1 es en radianes
t1=transl2(1,0)
aTb=R1*t1%Matriz T de S0 a S1
R2=trot2(q2)%q2 es en radianes
t2=transl2(1,0)
bTc=R2*t2%Matriz T de S1 a S2
aTc=aTb*bTc%Matriz de T de la base a la brida del robot
aTc=simplify(aTc)
% Evaluar aTc
q1g=25
q2g=35
q1=deg2rad(q1g)
q2=deg2rad(q2g)
aTc=eval(aTc)
O=tr2rpy(aTc)
Og=rad2deg(O)



