%% RI 9 febrero
%DH RRR Planar
close all
clear 
a1=5;
a2=5;
a3=2;
R(1)= Link([0 2 a1 0 0]); %Generar cada una de las articulaciones 
R(2)= Link([0 3 a2 pi/2 0]);
R(3)= Link([0 4 a3 0 0]);
Robot1= SerialLink(R, 'name', 'Robot 1'); %Unir articulaciones
Robot1.teach
%% Evaluando la cinematica directa
syms q1 q2 q3
c1=[q1 q2 q3]
conf1=Robot1.fkine(c1,'deg')
