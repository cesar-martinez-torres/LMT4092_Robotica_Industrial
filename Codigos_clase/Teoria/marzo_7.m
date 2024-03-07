%Anthropomorphic 6DOF
clear
close all
L1=10
L2=5
L3=10
L4=3
L(1)=Link([0 L1 0 -pi/2 0])
L(2)=Link([0 0 L2 0 0])
L(3)=Link([0 0 0 pi/2 0])
L(4)=Link([0 L3 0 -pi/2 0])
L(5)=Link([0 0 0 pi/2 0])
L(6)=Link([0 L4 0 0 0])
R6=SerialLink(L,'name','Antropomorfico')
R6.teach
%% 
zero=[pi/4 0 pi/4 -pi/8 pi/8 pi/6]
T0=R6.fkine(zero)
close all
R6.plot(zero)
angles=tr2rpy(T0,'deg')