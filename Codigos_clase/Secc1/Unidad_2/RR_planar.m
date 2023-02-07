%% Animación Planar2
clear all
close all
%Dibujar robot en posición "home" articulaciones=0
figure('Name','Origen')
x1 = [0 5];
y1 = [0 0];
e1=plot(x1,y1,'-','Color','b','LineWidth',6)
e1.Color(4) = 0.25;
axis equal
grid on
hold on
x1 = [5 10];
y1 = [0 0];
e2=plot(x1,y1,'-','Color','k','LineWidth',6)
e2.Color(4) = 0.25;
W=SE2()
trplot(W, 'frame', 'W', 'color', 'k')
S1=SE2(5,0)
tranimate(S1,'cleanup')
trplot(S1, 'frame', 'S1', 'color', 'r')
S2=SE2(10,0)
tranimate(S2,'cleanup')
trplot(S2, 'frame', 'S2', 'color', 'g')
%pause()
%% q1 a 25 grados q2 a 0
figure('name','q1=25,q2=0')
aux1=SE2(0,0,25,'deg')
aux2=SE2(5,0,0,'deg')
auxs1=aux1*aux2
or=auxs1.t
x1 = [0 or(1)];
y1 = [0 or(2)];
e1=plot(x1,y1,'-','Color','b','LineWidth',6)
e1.Color(4) = 0.25;
axis equal
grid on 
hold on
aux3=SE2(0,0,0,'deg')
aux4=SE2(5,0,0,'deg')
auxs2=aux1*aux2*aux3*aux4
or2=auxs2.t
x1 = [or(1) or2(1)];
y1 = [or(2) or2(2)];
e2=plot(x1,y1,'-','Color','k','LineWidth',6)
e2.Color(4) = 0.25;
W=SE2()
trplot(W, 'frame', 'W', 'color', 'k')
S1=SE2(5,0)
tranimate(auxs1,'cleanup')
trplot(auxs1, 'frame', 'S1', 'color', 'r')
S2=SE2(10,0)
tranimate(auxs2,'cleanup')
trplot(auxs2, 'frame', 'S2', 'color', 'g')
%%
