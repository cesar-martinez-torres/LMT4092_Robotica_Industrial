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