%% Robot Antropomorfico
clear 
close all
% Cargar línea a línea la tabla de parámetros DH
% theta d a alpha tipo de articulación
l1=4
l2=2
l3=2
L(1)= Link([0 l1 0 pi/2 0]); %Generar cada uno de los eslabones
L(2)= Link([0 0 l2 0 0]);
L(3)= Link([0 0 l3 0 0]);
quiz= SerialLink(L, 'name', 'Antropomorfico'); % Armar el robot uniendo los eslabones
%figure
%cilin.plot([0 0 0 0]) % Dibujar el robot en la posición inicial, con todas las articulaciones en 0. Agregar los valores de las articulaciones de acuerdo a la cantidad de grados de libertad del robot
%figure
%cilin.teach
Q=[0 0 0]
T=quiz.fkine(Q)
angr=tr2rpy(T,'xyz')
ang=rad2deg(angr)
figure
quiz.plot(Q)