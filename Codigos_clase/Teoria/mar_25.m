%% Robot Cilindrico
clear 
close all
% Cargar línea a línea la tabla de parámetros DH
% theta d a alpha tipo de articulación
l1=1
l4=0.5
d2=4
d3=4
L(1)= Link([0 l1 0 0 0]); %Generar cada uno de los eslabones
L(2)= Link([pi/2 0 0 pi/2 1]);
L(2).qlim=[0 d2]; % Las articulaciones primsmaticas necesitan limites fisicos
L(3)= Link([0 0 0 0 1]);
L(3).qlim=[0 d3];
L(4)=Link([0 l4 0 0 0]);
cilin= SerialLink(L, 'name', 'Cilindrico'); % Armar el robot uniendo los eslabones
%figure
%cilin.plot([0 0 0 0]) % Dibujar el robot en la posición inicial, con todas las articulaciones en 0. Agregar los valores de las articulaciones de acuerdo a la cantidad de grados de libertad del robot
%figure
%cilin.teach
q=[pi/4 2.5 1.2 pi]
T=cilin.fkine(q)
rpy=tr2rpy(T)
figure
cilin.plot(q)