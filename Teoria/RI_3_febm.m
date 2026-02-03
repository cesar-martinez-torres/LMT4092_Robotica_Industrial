%% Ejercicio 1.2
W=SE3()
cTb=transl(0,0,2)*troty(180,'deg')*trotz(90,'deg')
bTc=inv(cTb) % No solicitada por el ejercicio
% Segundo metodo
wTa=transl(0,1,1)
wTb=transl(-1,2,1)
wTc=transl(-1,2,3)*troty(180,'deg')*trotz(90,'deg')
cTw=inv(wTc)
cTb2=cTw*wTb

