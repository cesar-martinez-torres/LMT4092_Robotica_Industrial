%% RI 1feb
% RR planar
syms q1 q2
R1=trot2(q1)%radianes
t1=transl2(1,0)
s0Ts1=R1*t1
R2=trot2(q2)%radianes
t2=transl2(1,0)
s1Ts2=R2*t2
s0Ts2=s0Ts1*s1Ts2
s0Ts2=simplify(s0Ts2)
% Evaluar una configuracion articular
q1g=25
q2g=90
q1=deg2rad(q1g)
q2=deg2rad(q2g)
s0Ts2=eval(s0Ts2)
O=tr2rpy(s0Ts2)
Og=rad2deg(O)
%% PincherX
clear
syms q1 q2 q3 q4
l1=8%cm
l2=5
l3=5
l4=5
R1=trotz(q1)%radianes
t1=transl(0,0,l1)
s0Ts1=R1*t1
R2=troty(q2)%radianes
t2=transl(0,0,l2)
s1Ts2=R2*t2
R3=troty(q3)%radianes
t3=transl(0,0,l3)
s2Ts3=R3*t3
R4=troty(q4)%radianes
t4=transl(0,0,l4)
s3Ts4=R4*t4
s0Ts4=s0Ts1*s1Ts2*s2Ts3*s3Ts4
s0Ts4=simplify(s0Ts4)
q1g=20
q2g=45
q3g=18
q4g=53
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
q4=deg2rad(q4g)
s0Ts4=eval(s0Ts4)
O=tr2rpy(s0Ts4)
Og=rad2deg(O)


