%% Denavit Hartenberg Cilindrico
% Paso 14
syms q1 d2 d3 q4
L1=2;
L4=1;
aTb=trotz(q1)*transl(0,0,L1)*transl(0,0,0)*trotx(0);
bTc=trotz(90,'deg')*transl(0,0,d2)*transl(0,0,0)*trotx(90,'deg');
cTd=trotz(0)*transl(0,0,d3)*transl(0,0,0)*trotx(0);
dTe=trotz(q4)*transl(0,0,L4)*transl(0,0,0)*trotx(0);
% Paso 15
T=aTb*bTc*cTd*dTe;
T=simplify(T);
q1g=90
d2=0
d3=0
q4g=0
q1=deg2rad(q1g)
q4=deg2rad(q4g)
T1=eval(T)
rpy=tr2rpy(T1,'deg')
x=T1(1,4)
y=T1(2,4)
z=T1(3,4)



