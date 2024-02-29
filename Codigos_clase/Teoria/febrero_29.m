%% RRP
clear
close all
L1=10
L(1)=Link([0 L1 0 -pi/2 0])
L(2)=Link([0 0 0 pi/2 0])
L(3)=Link([0 0 0 0 1])
L(3).qlim=[0 5]
robot=SerialLink(L,'name','29feb')
Qg=[90 90 3]
Qr=[deg2rad(Qg(1)) deg2rad(Qg(2)) Qg(3)]
T=robot.fkine(Qr)
figure
robot.plot(Qr)