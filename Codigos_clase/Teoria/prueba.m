%% Código de prueba para las funciones personalizadas
x=[1;2;3]
y=[4;5;6]
A=transl(0,0,0)
figure
plot_point3(x)
hold on
plot_point3(y)
trplot(A)
plot3DLine(x,y)