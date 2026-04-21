%% Cinematica inversa 6gdl + muñeca esferica (P560)
mdl_puma560
%figure
%p560.teach
T=p560.fkine(qn)
% Verificar que el robot tenga muñeca esferica
me=p560.isspherical
p=T.t
px=p(1)
py=p(2)
pz=p(3)
d6=p560.d(6)
R=T.R
a=[R(1,3);R(2,3);R(3,3)]
m=p-(d6*a)
%% Resolviendo para Posicion.
syms q1 q2 q3 nx ny nz ox oy oz ax ay az px py pz 
T=[nx ox ax px; ny oy ay py;nz oz az pz;0 0 0 1];
aTb=trotz(q1)*transl(0,0,0)*transl(0,0,0)*trotx(pi/2)
bTc=trotz(q2)*transl(0,0,0)*transl(0.4318,0,0)*trotx(0)
cTd=trotz(q3)*transl(0,0,0.15005)*transl(0.0203,0,0)*trotx(-pi/2)
d4=p560.d(4)
dTe=transl(0,0,d4)
izq1=inv(aTb)*T
izq1=simplify(izq1)
der1=bTc*cTd*dTe
der1=simplify(der1)
ec1=izq1(3,4)==der1(3,4)
% Usando ec 5 de la tabla
a=-py
b=px
c=der1(3,4)
raiz=sqrt(a^2+b^2+c^2)
q1sol1=atan2(raiz,c)+atan2(b,a)
q1sol2=atan2(-raiz,c)+atan2(b,a)
% Paso 2
izq2=inv(bTc)*izq1
izq2=simplify(izq2)
der2=cTd*dTe
