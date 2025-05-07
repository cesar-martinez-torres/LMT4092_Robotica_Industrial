close all
clear
mdl_puma560
W=SE3()
Q=[0 0 pi/2 pi/4 pi/2 pi/4]
ca=qz
[T,ALL]=p560.fkine(ca)
M=transl(ALL(3))'
o=transl(W)'
d6=0.4318
P=transl(ALL(6))'
orp=P
R=ALL(6).R
Vp=[R(1,3);R(2,3);R(3,3)]
orm=orp-d6*(Vp)
figure
%p560.plot(ca)
hold on
trplot(W,'frame','WORLD','color','m')
trplot(ALL(1),'frame','0-1','color','r')
trplot(ALL(2),'frame','1-2','color','g')
trplot(ALL(3),'frame','2-3','color','b')
trplot(ALL(4),'frame','3-4','color','k')
trplot(ALL(5),'frame','4-5','color','y')
trplot(ALL(6),'frame','5-6','color','c')
plot_point3(M,'Marker', 'o', 'Label', 'M', 'Color', 'k')
plot_point3(P,'Marker', 'o', 'Label', 'P', 'Color', 'k')

plot3DLine(o, M, 'LineWidth', 3, 'Color', 'r')
plot3DLine(o, P, 'LineWidth', 3, 'Color', 'b')
plot3DLine(M, P, 'LineWidth', 3, 'Color', 'k')



