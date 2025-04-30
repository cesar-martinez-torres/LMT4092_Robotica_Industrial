% mdl_puma560
% p560.teach;
% n=10;
% x=zeros(n,1)
% y=zeros(n,1)
% z=zeros(n,1)
% 

%mdl_puma560; % Cargar el modelo Puma 560
% Definición del robot RRPRRR
L(1) = Link([0 0 0 1.5708]);
L(2) = Link([0 0 .8318 0]);
L(3) = Link([0 .45005 .0203 -1.5708]);
L(4) = Link([0 .4318 0 1.5708]);
L(5) = Link([0 0 0 -1.5708]);
L(6) = Link([0 0 0 0]);

% Crear el robot
puma = SerialLink(L, 'name', 'Puma560');


n = 5000; % Número de posiciones aleatorias a generar

% Rangos de ángulos articulares del robot Puma 560
q_min = puma.qlim(:, 1);
q_max = puma.qlim(:, 2);

% Generar posiciones aleatorias
q_rand = zeros(n, 6);
for i = 1:n
    % Generar ángulos articulares aleatorios dentro de los rangos permitidos
    q_rand(i, :) = q_min' + rand(1, 6).*(q_max' - q_min');
end

% Mostrar las coordenadas generadas
disp('Coordenadas generadas:');
disp(q_rand);

% Visualizar el espacio de trabajo
Q=[0 0 0 0 0 0]
figure;
puma.plot(Q);
hold on;

% Obtener las coordenadas x, y, z de las posiciones aleatorias
x = zeros(n, 1);
y = zeros(n, 1);
z = zeros(n, 1);

for i = 1:n
    T = puma.fkine(q_rand(i, :));
    coordinates = transl(T);
    x(i) = coordinates(1);
    y(i) = coordinates(2);
    z(i) = coordinates(3);
end

% Plotear los puntos en el espacio de trabajo
scatter3(x, y, z, 'r', 'filled');
title('Espacio de trabajo del robot puma modificado con Puntos Aleatorios');
hold off;
