%% Mayo 8
clear 
close all
mdl_puma560
%% Crear Waypoints
q_home=[0 0 0 0 0 0]
%%%%%%%%%%%%%%
q_apickg=[90 0 -180 0 0 0]
q_apick=deg2rad(q_apickg)
T_apick=p560.fkine(q_apick)
%%%%%%%%%%%%%%%%%
T_pick=T_apick.T
T_pick(3,4)=-0.6318
%%%%%%%%%%%%%%%%%%%
q_aplg=[-90 0 -180 0 0 0]
q_apl=deg2rad(q_aplg)
T_apl=p560.fkine(q_apl)
%%%%%%%%%%%%%%%%%%%
T_pl=T_apl.T
T_pl(3,4)=-0.6318
%% Crear trayectorias
V=50
% Movimiento 1
M1=jtraj(q_home,q_apick,V)
% Moimiento 2
M2_T=ctraj(T_apick.T,T_pick,V)
M2=p560.ikine6s(M2_T)
% Movimiento 3
M3_T=ctraj(T_pick,T_apick.T,V)
M3=p560.ikine6s(M3_T)
% Movimiento 4
M4=jtraj(q_apick,q_apl,V)
% Movimiento 5
M5_T=ctraj(T_apl.T,T_pl,V)
M5=p560.ikine6s(M5_T)
% Movimiento 6
M6_T=ctraj(T_pl,T_apl.T,V)
M6=p560.ikine6s(M6_T)
% Movimiento 7
M7=jtraj(q_apl,q_home,V)



%% Plotear trayectorias
M=[M1;M2;M3;M4;M5;M6;M7]
figure
p560.plot(M)


