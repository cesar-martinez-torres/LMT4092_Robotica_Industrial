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
%% Robot planar 2GDL
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
%% Robot planar de 3GDL
clear
close all
syms q1 q2 q3
a1=1.5
a2=1.5
a3=1.5
mr=trotz(q1)
mt=transl(a1,0,0)
aTb=mr*mt
mr=trotz(q2)
mt=transl(a2,0,0)
bTc=mr*mt
mr=trotz(q3)
mt=transl(a3,0,0)
cTd=mr*mt
T=aTb*bTc*cTd
T=simplify(T)
% Midiendo q1, q2 y q3
q1g=0
q2g=0
q3g=0
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
Tev=eval(T)
rpy=tr2rpy(Tev)
rpyg=rad2deg(rpy)
W=SE3(0,0,0)
figure
trplot(W,'frame','W','color','k')
hold on
trplot(Tev,'frame','T','color','b')
pause()
%% Robot Phantom X
clear
close all
syms q1 q2 q3 q4
a0=95
a1=42
a2=105
a3=105
a4=21
T=(transl(0,0,a0))*(trotz(q1)*transl(0,0,a1))*(troty(q2)*transl(0,0,a2))*(troty(q3)*transl(0,0,a3))*(troty(q4)*transl(0,0,a4))
T=simplify(T)
% Midiendo q1, q2 y q3
q1g=0
q2g=0
q3g=0
q4g=0
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
q4=deg2rad(q4g)
Tev=eval(T)
rpy=tr2rpy(Tev)
rpyg=rad2deg(rpy)
W=SE3(0,0,0)
figure
trplot(W,'frame','W','color','k')
hold on
trplot(Tev,'frame','T','color','b')