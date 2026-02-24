%% Denavit Hartenberg
% Paso 14
syms q1 q2 q3 %radianes
L1=2;
L2=2;
L3=0.5;
aTb=trotz(q1)*transl(0,0,0)*transl(L1,0,0)*trotx(0);
bTc=trotz(q2)*transl(0,0,0)*transl(L2,0,0)*trotx(0);
cTd=trotz(q3)*transl(0,0,0)*transl(L3,0,0)*trotx(0);
% Paso 15
T=aTb*bTc*cTd;
T=simplify(T);
q1g=40
q2g=30
q3g=10
q1=deg2rad(q1g)
q2=deg2rad(q2g)
q3=deg2rad(q3g)
T1=eval(T)
rpy=tr2rpy(T1,'deg')
x=T1(1,4)
y=T1(2,4)
z=T1(3,4)



