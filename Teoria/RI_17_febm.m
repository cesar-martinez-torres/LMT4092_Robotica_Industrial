%% Cinematica Directa
%% Robot planar 1GDL
syms q1 %Radianes
a1=2
aTb=trotz(q1)*transl(a1,0,0)
%% Robot Planar de 2GDL
clear
syms q1 q2
a1=2
a2=3
aTb=trotz(q1)*transl(a1,0,0)
bTc=trotz(q2)*transl(a2,0,0)
aTc=aTb*bTc
aTc=simplify(aTc)
q1g=15
q2g=20
q1=deg2rad(q1g)
q2=deg2rad(q2g)
T=eval(aTc)
%% Robot Planar 3GDL
clear
syms q1 q2 q3
a1=1
a2=2
a3=3
aTb=trotz(q1)*transl(a1,0,0)
bTc=trotz(q2)*transl(a2,0,0)
cTd=trotz(q3)*transl(a3,0,0)
aTd=aTb*bTc*cTd
aTd=simplify(aTd)
%% Pincher X
clear
syms q1 q2 q3 q4 %Radianes
a1=95;
a2=137-95;
a3=105;
a4=105;
aTb=trotz(q1)*transl(0,0,a1);
bTc=troty(q2)*transl(0,0,a2);
cTd=troty(q3)*transl(0,0,a3);
dTe=troty(q4)*transl(0,0,a4);
pch=transl(0,0,95);
aTe=aTb*bTc*cTd*dTe*pch;
aTe=simplify(aTe);
q1g=0;
q2g=0;
q3g=0;
q4g=0;
q1=deg2rad(q1g);
q2=deg2rad(q2g);
q3=deg2rad(q3g);
q4=deg2rad(q4g);
T=eval(aTe);
rpy=tr2rpy(T);