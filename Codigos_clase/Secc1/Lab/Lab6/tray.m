clear
close all

% Definir matrices de transformación homogénea para el punto de inicio y fin
mdl_puma560
T_start = p560.fkine(qs).T;
T_end = p560.fkine(qn).T;

% Crear una trayectoria interpolada entre las matrices de transformación
traj = ctraj(T_start, T_end, 50);

% Graficar la trayectoria como matrices de transformación homogénea
figure;
hold on;
for i = 1:size(traj, 3)
    T_i = SE3(traj(:,:,i));
    T_i.plot('rgb', 'frame', 'arrow', 'width', 0.3);
end
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Trayectoria generada con ctraj - Marcos de referencia');
grid on;

% Extraer los vectores de posición de los marcos de referencia de los SE3
positions = zeros(size(traj,3),3);
for i = 1:size(traj, 3)
    T_i = SE3(traj(:,:,i));
    positions(i,:) = T_i.t;
end

% Graficar la trayectoria como puntos
figure;
plot3(positions(:,1), positions(:,2), positions(:,3), 'k.', 'MarkerSize', 10);
hold on;
text(positions(1,1), positions(1,2), positions(1,3), 'Primer punto', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');
text(positions(end,1), positions(end,2), positions(end,3), 'Ultimo punto', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Trayectoria generada con ctraj - Puntos');
grid on;
