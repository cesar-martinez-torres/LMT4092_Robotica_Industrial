%% RI S1 16 marzo
clear
close all
l1=5
A(1)= Link([0 l1 0 pi/2 0]); %Generar cada una de las articulaciones 
A(2)= Link([0 0 0 -pi/2 0]);%th,d,a,alpha, tipo art; 0=rot 1=pris
A(3)= Link([0 0 0 0 1]);
A(3).qlim = [0 5];
Robot= SerialLink(A, 'name', 'Esferico'); %Unir articulaciones
figure
Robot.teach
% Paso 1
syms q1 q2 q3
aAb=trotz(q1)*transl(0,0,l1)*transl(0,0,0)*trotx(pi/2)
bAc=trotz(q2)*transl(0,0,0)*transl(0,0,0)*trotx(-pi/2)
cAd=trotz(0)*transl(0,0,q3)*transl(0,0,0)*trotx(0)
syms nx ny nz ox oy oz ax ay az px py pz
noap=[nx ox ax px;ny oy ay py;nz oz az pz;0 0 0 1]
noap==aAb*bAc*cAd
%paso 1
p1izq=inv(aAb)*noap
p1izq=simplify(p1izq)
p1der=bAc*cAd
p1izq==p1der
ec1=p1izq(3,4)==p1der(3,4)
q1_sol=solve(ec1)
q1_sol=isolate(ec1,q1)
% VER TABLA
q1_sol=0 % Simplificando
%paso 2
p2izq=inv(bAc)*inv(aAb)*noap
p2izq=simplify(p2izq)
p2der=cAd
p2izq==p2der
ec2=p2izq(1,4)==p2der(1,4) %para q2
q1=q1_sol
ec2=eval(ec2)
q2_sol=solve(ec2)
q2_sol=isolate(ec2,q2)
% Ver tabla
q2_sol=0
ec3=p2izq(3,4)==p2der(3,4) %para q3
q2=0
sol_q3=eval(ec3)











