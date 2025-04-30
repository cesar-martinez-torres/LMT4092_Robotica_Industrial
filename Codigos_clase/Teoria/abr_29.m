%% Desacoplo Cinematico
% El robot tiene muñeca esferica => Aplicar metodo
L(1) = Link([0 0       0      pi/2 0]);
L(2) = Link([0 0       0.4318 0    0]);
L(3) = Link([0 0.15005 0.0203 -pi/2 0]);
L(4) = Link([0 0.4318  0      pi/2 0]);
L(5) = Link([0 0       0     -pi/2 0]);
L(6) = Link([0 0       0      0    0]);
puma = SerialLink(L, 'name', 'Puma560');
% Si es muñeca esferica (Verificar codigo)
me=puma.isspherical
syms q1 q2 q3 q4 q5 q6
syms nx ox ax px ny oy ay py nz oz az pz
noap=[nx ox ax px;ny oy ay py; nz oz az pz; 0 0 0 1]
AtB=trotz(q1)*transl(0,0,0)*transl(0,0,0)*trotx(1.5708)
BtC=trotz(q2)*transl(0,0,0)*transl(0.4318,0,0)*trotx(0)
CtD=trotz(q3)*transl(0,0,0.15005)*transl(0.0203,0,0)*trotx(-1.5708)
DtE=trotz(q4)*transl(0,0,0.4318)*transl(0,0,0)*trotx(1.5708)
EtF=trotz(q5)*transl(0,0,0)*transl(0,0,0)*trotx(-1.5708)
FtG=trotz(q6)*transl(0,0,0)*transl(0,0,0)*trotx(0)
%% Calcular matrics izq y derecha
izq1=inv(AtB)*noap
izq1=simplify(izq1)
der1=BtC*CtD
der1=simplify(der1)
ec1x=izq1(1,4)==der1(1,4)
ec1y=izq1(2,4)==der1(2,4)
ec1z=izq1(3,4)==der1(3,4)
ec1z=vpa(ec1z,10)
%% Para q2
izq2=inv(BtC)*inv(AtB)*noap
izq2=simplify(izq2)
der2=CtD
der2=simplify(der2)
ec2x=izq2(1,4)==der2(1,4)
ec2y=izq2(2,4)==der2(2,4)
ec2z=izq2(3,4)==der2(3,4)
