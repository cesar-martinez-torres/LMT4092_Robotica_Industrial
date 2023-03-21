

% Create a serial link object for the RRR robot
L(1) = Link([0 0 2 0 0]);
L(2) = Link([0 0 3 0 0]);
L(3) = Link([0 0 1.5 0 0]);
robot = SerialLink(L, 'name', 'RRR');

% Define the range of joint angles for each revolute joint
q1 = linspace(-pi, pi, 10);
q2 = linspace(-pi, pi, 10);
q3 = linspace(-pi, pi, 10);

% Compute the end effector position for each combination of joint angles
counter = 1;
for i = 1:10
    for j = 1:10
        for k = 1:10
            T = robot.fkine([q1(i), q2(j), q3(k)]);
            T=T.T
            x(counter) = T(1,4);
            y(counter) = T(2,4);
            counter = counter + 1;
        end
    end
end

% Plot the workspace of the RRR robot
figure
plot(x, y, '.')
xlabel('x')
ylabel('y')
axis equal
