%% Cinematica Inversa
clear
close all
L1=3
L(1)=Link([0 L1 0 pi/2 0])
L(2)=Link([0 0 0 -pi/2 0])
L(3)=Link([0 0 0 0 1])
L(3).qlim=[0 3]
ant=SerialLink(L,'name','Diap 86')
figure
ant.teach
%%
syms q1 q2 q3
aTb=trotz(q1)*transl(0,0,L1)*transl(0,0,0)*trotx(pi/2)
bTc=trotz(q2)*transl(0,0,0)*transl(0,0,0)*trotx(-pi/2)
cTd=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
syms nx ny nz ox oy oz ax ay az px py pz
noap= [nx ox ax px; ny oy ay py;nz oz az pz;0 0 0 1]
% Paso 1
izq1=inv(aTb)*noap
izq1=simplify(izq1)
der1=bTc*cTd
der1=simplify(der1)
ec1=izq1(3,4)==der1(3,4)
solq1=solve(ec1,q1)% Ya conocemos q1
% Paso 2
izq2=inv(bTc)*inv(aTb)*noap
izq2=simplify(izq2)
der2=cTd
der2=simplify(der2)
ec2=izq2(1,4)==der2(1,4)
solq2=solve(ec2,q2)
ec3=izq2(3,4)==der2(3,4)
solq3=isolate(ec3,q3)
