%% RI Ejemplo final
clear
close all
L1=1.4
L2=0.95
L3=1.25
Le=0.4826
A(1)= Link([0 L1 0 -pi/2 0]); %Generar cada una de las articulaciones 
A(2)= Link([0 L2 0 pi/2 0]);%th,d,a,alpha, tipo art; 0=rot 1=pris
A(3)= Link([-pi/2 0 0 0 1]);
A(3).offset=L3
A(3).qlim = [0 2];
A(4)= Link([0 0 0 -pi/2 0]);
A(5)= Link([0 0 0 pi/2 0]);
A(6)= Link([0 0 0 0 0]);
Robot= SerialLink(A, 'name', 'Final'); %Unir articulaciones
Robot.tool=transl(0,0,Le)
figure
%Robot.teach
%% Cinematica directa simbólica
syms q1 q2 q3 q4 q5 q6
aTb=trotz(q1)*transl(0,0,L1)*transl(0,0,0)*trotx(-pi/2)% s0 a s1
bTc=trotz(q2)*transl(0,0,L2)*transl(0,0,0)*trotx(pi/2)% s1 a s2
cTd=trotz(-pi/2)*transl(0,0,q3+L3)*transl(0,0,0)*trotx(0)% s2 a s3
dTe=trotz(q4)*transl(0,0,0)*transl(0,0,0)*trotx(-pi/2)% s3 a s4
eTf=trotz(q5)*transl(0,0,0)*transl(0,0,0)*trotx(pi/2)% s4 a s5
fTg=trotz(q6)*transl(0,0,0)*transl(0,0,0)*trotx(0)% s5 a s6
gTtcp=transl(0,0,Le)
aTtcp=aTb*bTc*cTd*dTe*eTf*fTg*gTtcp
% Cálculo de cinematica directa mediante toolbox
qz=[0 0 0 0 0 0]
T=Robot.fkine(qz)
figure
Robot.plot(qz)
RPY = tr2rpy(T, 'xyz','deg')
%% Cinematica inversa
ME=Robot.isspherical
% Resolver la cinematica inversa mediante toolbox
Q=Robot.ikine6s(T)
% Trayectorias ecuaciones
% x = f(t)
t=0:0.1:45
x=0.5*cos(t)
y=0.5*sin(t)
z=sin(5*t)+1
figure
plot3(x,y,z,'.')
q1=Robot.ikine6s(T)





