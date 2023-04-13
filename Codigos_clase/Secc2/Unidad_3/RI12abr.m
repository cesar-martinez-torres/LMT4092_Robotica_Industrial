%% RI 12 ABRIL Cinematica inversa matlab
mdl_puma560
T=p560.fkine([0 pi pi/2 0 pi/4 0])
cininv=p560.ikine(T)
T2=p560.fkine(cininv)
figure
p560.plot([0 pi pi/2 0 pi/4 0])
%%
clear 
close all
mdl_planar3
T=p3.fkine([0 0 0])
cininv=p3.ikine(T,'mask',[1 1 1 0 0 0],'ilimit',15000)
T2=p3.fkine(cininv)
error=T-T2
%% muñeca esferica
mdl_puma560
me=p560.isspherical
T=p560.fkine(qs)
cininv=p560.ikine6s(T)
T2=p560.fkine(cininv)
error=T-T2
figure
p560.plot(qs)
%% Jacobiana
jacobiana=p560.jacob0(qn)
jsingu(jacobiana)
