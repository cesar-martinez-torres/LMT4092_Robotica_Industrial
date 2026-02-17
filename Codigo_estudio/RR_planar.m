%% Animación Planar2
clear
close all

% Parametros editables de articulaciones (grados) y longitudes de eslabones
q1_deg = 25;
q2_deg = 25;
a1 = 5;
a2 = 3;
%Dibujar robot en posición "home" articulaciones=0
figure('Name','Origen')
x1 = [0 a1];
y1 = [0 0];
e1=plot(x1,y1,'-','Color','b','LineWidth',6)
e1.Color(4) = 0.25;
axis equal
grid on
hold on
x1 = [a1 a1+a2];
y1 = [0 0];
e2=plot(x1,y1,'-','Color','k','LineWidth',6)
e2.Color(4) = 0.25;
W=SE2()
trplot(W, 'frame', 'W', 'color', 'k')
S1=SE2(a1,0)
trplot(S1, 'frame', 'S1', 'color', 'r')
S2=SE2(a1+a2,0)
trplot(S2, 'frame', 'S2', 'color', 'g')
pause()
%% Animacion para q1, q2, a1 y a2 configurables
figure('name',sprintf('q1=%g,q2=%g', q1_deg, q2_deg))
aux1=SE2(0,0,q1_deg,'deg')
aux2=SE2(a1,0,0,'deg')
auxs1=aux1*aux2
or=auxs1.t
x1 = [0 or(1)];
y1 = [0 or(2)];
e1=plot(x1,y1,'-','Color','b','LineWidth',6)
e1.Color(4) = 0.25;
axis equal
grid on 
hold on
aux3=SE2(0,0,q2_deg,'deg')
aux4=SE2(a2,0,0,'deg')
auxs2=aux1*aux2*aux3*aux4
auxs2_rot=aux1*aux2*aux3
or2=auxs2.t
x1 = [or(1) or2(1)];
y1 = [or(2) or2(2)];
e2=plot(x1,y1,'-','Color','k','LineWidth',6)
e2.Color(4) = 0.25;
W=SE2()
trplot(W, 'frame', 'W', 'color', 'k')

% Una sola animacion en dos pasos: primero rotar y luego trasladar
tranimate(SE2(), aux1, 'cleanup')
tranimate(aux1, auxs1, 'cleanup')
trplot(auxs1, 'frame', 'S1', 'color', 'r')

% Siguiente eslabon en dos pasos: primero rotar q2 y luego trasladar
tranimate(auxs1, auxs2_rot, 'cleanup')
tranimate(auxs2_rot, auxs2, 'cleanup')
trplot(auxs2, 'frame', 'S2', 'color', 'g')
%%
