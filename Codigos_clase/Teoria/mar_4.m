%% Robot Cartesiano 3GDL
clear   
close all
syms q1 q2 q3 % Todas prismaticas, limite 0 a 0.5m
l1=0.2
l2=0.3
l3=0.4
aTb=transl(q1,0,0)
bTc=transl(0,0,q2)
cTd=transl(0,(-1)*(l2+q3),0)
aTd=aTb*bTc*cTd
aTd=simplify(aTd) % eje 0 "teorico" hasta la brida del robot
% Agregar base "real" y PCH
base=transl(0,0,l1)
herr=transl(0,-l3,0)
T=base*aTd*herr
T=vpa(T)
