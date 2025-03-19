%% "Armar" Robot
clear 
close all
% Cargar línea a línea la tabla de parámetros DH
% theta d a alpha tipo de articulación
L(1)= Link([0 0 2 0 0]); %Generar cada uno de los eslabones
L(2)= Link([0 0 2.5 0 0]);
L(3)= Link([0 0 1 0 0]);
RRR= SerialLink(L, 'name', 'Planar 3GDL'); % Armar el robot uniendo los eslabones
figure
RRR.plot([0 0 0]) % Dibujar el robot en la posición inicial, con todas las articulaciones en 0. Agregar los valores de las articulaciones de acuerdo a la cantidad de grados de libertad del robot
%figure
%RRR.teach