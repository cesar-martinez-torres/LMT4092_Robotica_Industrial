% Rotation 
clear
close all
% W=SE3()
% r=rotz(90,'deg')
% t=[0,0,0]
% A=SE3(r,t)
% r=rotz(-90,'deg')
% t=[0,0,0]
% B=SE3(r,t)
% figure 
% tranimate(W,A)
% pause()
% figure
% tranimate(W,B)
% T para robot pincher X diap 60
syms q1
r=rotz(q1)
t=[0,0,0]
A1=SE3(r,t)
t=[0,0,42]
r=rotz(0)
A2=SE3(r,t)
aTb=A1*A2
%%%%%%%%%%%%%%%%
syms q2
r=roty(q2)
t=[0,0,0]
B1=SE3(r,t)
t=[0,0,105]
r=rotz(0)
B2=SE3(r,t)
bTc=B1*B2
%%%%%%%%%%%%%%%%%%%%
syms q3
r=roty(q3)
t=[0,0,0]
C1=SE3(r,t)
t=[0,0,105]
r=rotz(0)
C2=SE3(r,t)
cTd=C1*C2
%%%%%%%%%%%%%%%%%%%%
syms q4
r=roty(q4)
t=[0,0,0]
D1=SE3(r,t)
t=[0,0,105]
r=rotz(0)
D2=SE3(r,t)
dTe=D1*D2 % Llegamos al PCH O TCP
% Calcular la T de la base a la punta
aTe=aTb*bTc*cTd*dTe
aTe=simplify(aTe)