%% Robot Diap
clear 
close all
% Cargar línea a línea la tabla de parámetros DH
% theta d a alpha tipo de articulación

L(1)= Link([0 l1 0 0 0]); %Generar cada uno de los eslabones
L(2)= Link([pi/2 0 0 pi/2 1]);
L(2).qlim=[0 d2]; % Las articulaciones primsmaticas necesitan limites fisicos
L(3)= Link([0 0 0 0 1]);
L(3).qlim=[0 d3];
L(4)=Link([0 l4 0 0 0]);
cilin= SerialLink(L, 'name', 'Cilindrico'); % Armar el robot uniendo los eslabones
