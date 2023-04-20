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
figure
Robot.teach
