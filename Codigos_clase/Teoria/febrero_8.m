%% DH
a1=10;
a2=10;
a3=3;
R(1)= Link([0 0 a1 0 0]);
R(2)= Link([0 0 a2 0 0]);
R(3)= Link([0 0 a3 0 0]);
Robot1= SerialLink(R, 'name', 'Robot 1'); %Unir articulaciones
figure
Robot1.teach
Qd=[15 9 30]
Qr=deg2rad(Qd)
Total=Robot1.fkine(Qr)
ang=tr2rpy(Total.T,'deg')
figure
Robot1.plot(Qr)