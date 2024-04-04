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
% Calcular T
Q=[0 pi/4 2]
T=ant.fkine(Q)
%Usando la ec 4 de la tabla
T=T.T
px=T(1,4)
py=T(2,4)
a=-py
b=px
q1_sol1=atan2(a,-b)
q1_sol2=atan2(-a,b)
% Paso 2
izq2=inv(bTc)*inv(aTb)*noap
izq2=simplify(izq2)
der2=cTd
der2=simplify(der2)
ec2=izq2(1,4)==der2(1,4)
% Para q1_sol1
pz=T(3,4)
q1=0
ec2a=eval(ec2)
a1=- 2^(1/2)
b1=pz-3
q2_sol1=atan2(a1,-b1)
q2_sol2=atan2(-a1,b1)
%% Para la solucion 2 de q1
q1=-pi
ec2b=eval(ec2)
ec2b=vpa(ec2b)
a2=1.4142
b2=1.4142
q2_sol1a=atan2(a2,-b2)
q2_sol2a=atan2(-a2,b2)
ec3=izq2(3,4)==der2(3,4)
% Evaluando todas las soluciones anteriores
q1=0
q2=-2.3566
q3_sol1=eval(ec3)
q3_sol1=vpa(q3_sol1)
%
q1=0
q2=0.78
q3_sol2=eval(ec3)
q3_sol2=vpa(q3_sol2)
%
q1=-pi
q2=2.3562
q3_sol3=eval(ec3)
q3_sol3=vpa(q3_sol3)
%
q1=-pi
q2=-0.7854
q3_sol4=eval(ec3)
q3_sol4=vpa(q3_sol4)
%% Usando el toolbox.
Q=[0 pi/4 2] %Obtener la cinematica directa
T=ant.fkine(Q) % Se supone conocida siempre..
% Calcular la cinemática inversa
Qc=ant.ikine(T,'mask', [1 1 1 0 0 0])
Qcg=[rad2deg(Qc(1)),rad2deg(Qc(2)), Qc(3)]
% Validacion
L1=3
L(1)=Link([0 L1 0 pi/2 0])
L(2)=Link([0 0 0 -pi/2 0])
L(3)=Link([0 0 0 0 1])
L(3).qlim=[0 3]
ant1=SerialLink(L,'name','Diap')
Tc=ant.fkine(Qc)
error=T-Tc
ant1=ant
Qr=[0 0 0]
close all
figure
subplot(1, 2, 1);
ant.plot(Q);
title('Configuración 1');
subplot(1, 2, 2);
pause()
ant.plot(Qc);
title('Configuración 2');



