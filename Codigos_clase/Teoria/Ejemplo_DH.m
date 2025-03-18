%% "Armar" Robot
clear 
close all
% Cargar línea a líne la tabla de parámetros DH
% theta d a alpha tipo de articulación
L(1)= Link([0 2.5 0 pi/2 0]); %Generar cada uno de los eslabones
L(2)= Link([0 0 3 0 0]);
L(3)= Link([0 0 1.5 0 0]);
RRR= SerialLink(L, 'name', 'Nombre');
figure
RRR.teach