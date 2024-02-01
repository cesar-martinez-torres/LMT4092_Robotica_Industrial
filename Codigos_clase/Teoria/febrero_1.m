% Rotation 
clear
close all
W=SE3()
r=rotz(90,'deg')
t=[0,0,0]
A=SE3(r,t)
r=rotz(-90,'deg')
t=[0,0,0]
B=SE3(r,t)
figure 
tranimate(W,A)
pause()
figure
tranimate(W,B)
