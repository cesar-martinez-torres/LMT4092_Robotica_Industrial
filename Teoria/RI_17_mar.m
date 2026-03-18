%% Robot diapositiva 28
clear
close all
l1=2
l4=1
L(1)=Link([0 l1 0 0 0]);
L(2)=Link([pi/2 0 0 pi/2 1]);
L(3)=Link([0 0 0 0 1]);
L(4)=Link([0 l4 0 0 0]);
L(2).qlim=[0,2];
L(3).qlim=[0,2];
diap28= SerialLink(L, 'name', 'Diapo 28'); % Armar el robot uniendo los eslabones
figure
diap28.plot([pi/2 0.5 1 0])
Q=[pi/2 0.5 1 0];
aTe=diap28.fkine(Q)
rpy=tr2rpy(aTe)
[T,ALL] = diap28.fkine(Q) 