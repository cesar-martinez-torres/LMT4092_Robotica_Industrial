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
%% "Armar" Robot
clear 
close all
% Cargar línea a línea la tabla de parámetros DH
% theta d a alpha tipo de articulación
L(1)= Link([0 0 2 0 0]); %Generar cada uno de los eslabones
L(2)= Link([0 0 2.5 0 0]);
L(3)= Link([0 0 1 0 0]);
RRR= SerialLink(L, 'name', 'Planar 3GDL'); % Armar el robot uniendo los eslabones
%figure
%RRR.plot([0 0 0]) % Dibujar el robot en la posición inicial, con todas las articulaciones en 0. Agregar los valores de las articulaciones de acuerdo a la cantidad de grados de libertad del robot
figure
RRR.teach



