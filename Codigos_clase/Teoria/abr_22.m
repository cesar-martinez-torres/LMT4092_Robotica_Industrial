%% Robot SCARA
clear 
close all
% Cargar línea a línea la tabla de parámetros DH
% theta d a alpha tipo de articulación
l1=4
l2=4
l3=3
l5=5
q3m=2.5
L(1)= Link([0 0 l1 0 0]); %Generar cada uno de los eslabones
L(2)= Link([0 0 l2 pi 0]);
L(3)= Link([0 0 0 0 1]);
L(3).qlim=[0 q3m];
L(4)=Link([0 l3 0 0 0]);
scara= SerialLink(L, 'name', 'SCARA'); % Armar el robot uniendo los eslabones
scara.base=transl(0,0,l5)
figure
scara.teach
clear 
close all
%% Robot Diap 37
l1=5
q3m=4
L(1)= Link([0 l1 0 pi/2 0]); %Generar cada uno de los eslabones
L(2)= Link([0 0 0 -pi/2 0]);
L(3)= Link([0 0 0 0 1]);
L(3).qlim=[0 q3m];
diap37= SerialLink(L, 'name', 'DIAP 37'); % Armar el robot uniendo los eslabones
figure
diap37.teach
%% Resolver cin inversa
close all
l1=5
syms q1 q2 q3
syms nx ox ax px ny oy ay py nz oz az pz
noap=[nx ox ax px;ny oy ay py; nz oz az pz; 0 0 0 1]
AtB=trotz(q1)*transl(0,0,0)*transl(l1,0,0)*trotx(pi/2)
BtC=trotz(q2)*transl(0,0,0)*transl(0,0,0)*trotx(-pi/2)
CtD=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
izq1=inv(AtB)*noap
izq1=simplify(izq1)
der1=BtC*CtD
der1=simplify(der1)
ec1x=izq1(1,4)==der1(1,4)
ec1y=izq1(2,4)==der1(2,4)
ec1z=izq1(3,4)==der1(3,4)
a=-py
b=px
q1_sol1=atan2(a,-b)
q1_sol2=atan2(-a,b)
%% Para q2
izq2=inv(BtC)*inv(AtB)*noap
izq2=simplify(izq2)
der2=CtD
der2=simplify(der2)
ec2x=izq2(1,4)==der2(1,4)
ec2y=izq2(2,4)==der2(2,4)
ec2z=izq2(3,4)==der2(3,4)
syms k1 k2
k1=px*cos(q1)
k2=py*sin(q1)
a1=k1+k2-5
b1=pz
q2_sol1=atan2(a1,-b1)
q2_sol2=atan2(-a1,b1)
%% para q3
%Sustituir las soluciones de q1 y q2 en ec2z
%% Encontrar [q1 q2 q3] para la matriz T
Q=[pi pi/4 3]
Tf=diap37.fkine(Q)
Tf=Tf.T
px=Tf(1,4)
py=Tf(2,4)
pz=Tf(3,4)
% Evaluar las ecuaciones
% Evaluando q1
q1_sol1f=eval(q1_sol1)
q1_sol2f=eval(q1_sol2)
% Evaluando q2
q1=q1_sol1f
q1sol1_q2sol1=eval(q2_sol1)
q1sol1_q2sol2=eval(q2_sol2)
%%%%%%
clear q1
q1=q1_sol2f
q1sol2_q2sol1=eval(q2_sol1)
q1sol2_q2sol2=eval(q2_sol2)





