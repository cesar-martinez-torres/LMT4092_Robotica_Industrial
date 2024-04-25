%% 
clear
close all
mdl_puma560
%p560.teach
%% Mov 1 Home a ready (MJ)
Home=qz
Ready=[0 0 -pi/2 0 0 0]
M=100
q1=jtraj(Home(1),Ready(1),M)
q2=jtraj(Home(2),Ready(2),M)
q3=jtraj(Home(3),Ready(3),M)
q4=jtraj(Home(4),Ready(4),M)
q5=jtraj(Home(5),Ready(5),M)
q6=jtraj(Home(6),Ready(6),M)
Q1=[q1 q2 q3 q4 q5 q6]
%% Mov 2 Ready a ApPL1 (MJ)
ApPL1=[0 18.9 -198.9 0 0 0]
ApPL1=deg2rad(ApPL1)
q1=jtraj(Ready(1),ApPL1(1),M)
q2=jtraj(Ready(2),ApPL1(2),M)
q3=jtraj(Ready(3),ApPL1(3),M)
q4=jtraj(Ready(4),ApPL1(4),M)
q5=jtraj(Ready(5),ApPL1(5),M)
q6=jtraj(Ready(6),ApPL1(6),M)
Q2=[q1 q2 q3 q4 q5 q6]
%% Plotear
tray=[Q1;Q2]
figure
p560.plot(tray,'trail','-')