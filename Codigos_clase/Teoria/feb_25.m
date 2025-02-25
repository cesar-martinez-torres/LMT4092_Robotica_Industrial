%% Robots planares
% Robot planar de 1gdl limites de -180 a 180
syms q1 %radianes
a1=1.5 %metros
mr=trotz(q1)
mt=transl(a1,0,0)
aTb=mr*mt
aTb=vpa(aTb)% simplificar con decimales
% Midiendo q1
q1g=90
q1=deg2rad(q1g)
aTbev=eval(aTb)
rpy=tr2rpy(aTbev)
rpyg=rad2deg(rpy)
pause()
%% Robot planar 2D 
clear 
close all
syms q1 q2
l1=1.5
l2=1.5
mr=trotz(q1)
mt=transl(l1,0,0)
aTb=mr*mt
mr=trotz(q2)
mt=transl(l2,0,0)
bTc=mr*mt
T=aTb*bTc
T=simplify(T)
% Midiendo q1 y q2
q1g=35
q2g=-35
q1=deg2rad(q1g)
q2=deg2rad(q2g)
Tev=eval(T)
rpy=tr2rpy(Tev)
rpyg=rad2deg(rpy)
pause()