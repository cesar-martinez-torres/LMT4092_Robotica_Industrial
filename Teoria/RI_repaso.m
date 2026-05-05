%% Repaso final
mdl_irb140 % Carga robot

%% Jacobiana => Velocidad linear y angular del extremo del robot.
q = [0 pi/4 pi/4 0 pi/4 0];
qp = [0.1 0.2 0.3 0.4 0.5 0.6]';
J = irb140.jacob0(q,'rpy')
v = J(1:3,:)*qp
w = J(4:6,:)*qp

q0 = [0 0 0 0 0 0];
qf = [pi/4 -pi/6 pi/3 pi/4 -pi/4 pi/6];
t = 0:0.05:5;
[Q,Qp,Qpp] = jtraj(q0,qf,t);

vel_extremo = zeros(length(t),6);

for i = 1:length(t)
    J = irb140.jacob0(Q(i,:),'rpy');
    vel_extremo(i,:) = (J*Qp(i,:)')';
end

figure
subplot(3,1,1)
plot(t,Qp)
grid on
legend('q1p','q2p','q3p','q4p','q5p','q6p')

subplot(3,1,2)
plot(t,vel_extremo(:,1:3))
grid on
legend('vx','vy','vz')

subplot(3,1,3)
plot(t,vel_extremo(:,4:6))
grid on
legend('rollp','pitchp','yawp')

%% Singularidades
rangoJ = zeros(length(t),1);

for i = 1:length(t)
    J = irb140.jacob0(Q(i,:),'rpy');
    rangoJ(i) = rank(J);
end

figure
plot(t,rangoJ)
grid on

%% Trayectorias eje a eje y simultaneas
t_seg = 0:0.05:1;
Q_eje = [];
t_eje = [];
q_actual = q0;

for j = 1:6
    q_destino = q_actual;
    q_destino(j) = qf(j);
    [Qseg,Qpseg,Qppseg] = jtraj(q_actual,q_destino,t_seg);

    if j == 1
        Q_eje = Qseg;
        t_eje = t_seg;
    else
        Q_eje = [Q_eje; Qseg(2:end,:)];
        t_eje = [t_eje t_eje(end)+t_seg(2:end)];
    end

    q_actual = q_destino;
end

t_final_sim = [6 3 5 4 2.5 3.5];
t_sim = 0:0.05:max(t_final_sim);
Q_sim = zeros(length(t_sim),6);

for j = 1:6
    idx = t_sim <= t_final_sim(j);
    Qj = jtraj(q0(j),qf(j),t_sim(idx));
    Q_sim(idx,j) = Qj;
    Q_sim(~idx,j) = qf(j);
end

p_eje = zeros(length(t_eje),3);
p_sim = zeros(length(t_sim),3);

for i = 1:length(t_eje)
    T = irb140.fkine(Q_eje(i,:));
    p_eje(i,:) = T.t';
end

for i = 1:length(t_sim)
    T = irb140.fkine(Q_sim(i,:));
    p_sim(i,:) = T.t';
end

figure
subplot(2,2,1)
plot(t_eje,Q_eje)
grid on
legend('q1','q2','q3','q4','q5','q6')

subplot(2,2,2)
plot3(p_eje(:,1),p_eje(:,2),p_eje(:,3),'k','LineWidth',2)
hold on
plot3(p_eje(:,1),p_eje(:,2),p_eje(:,3),'.k')
for i = 1:10:length(t_eje)
    plot3([0 p_eje(i,1)],[0 p_eje(i,2)],[0 p_eje(i,3)],':k')
end
grid on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(2)

subplot(2,2,3)
plot(t_sim,Q_sim)
grid on
legend('q1','q2','q3','q4','q5','q6')

subplot(2,2,4)
plot3(p_sim(:,1),p_sim(:,2),p_sim(:,3),'k','LineWidth',2)
hold on
plot3(p_sim(:,1),p_sim(:,2),p_sim(:,3),'.k')
for i = 1:10:length(t_sim)
    plot3([0 p_sim(i,1)],[0 p_sim(i,2)],[0 p_sim(i,3)],':k')
end
grid on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(2)

%% Trayectorias coordinadas y continuas
t_coord = 0:0.05:6;
[Q_coord,Qp_coord,Qpp_coord] = jtraj(q0,qf,t_coord);
p_coord = zeros(length(t_coord),3);

for i = 1:length(t_coord)
    T = irb140.fkine(Q_coord(i,:));
    p_coord(i,:) = T.t';
end

T0 = irb140.fkine(q0);
Tf = irb140.fkine(qf);
T_cont = ctraj(T0,Tf,length(t_coord));
Q_cont = zeros(length(t_coord),6);
Q_cont(1,:) = q0;

for i = 2:length(t_coord)
    Q_cont(i,:) = irb140.ikine(T_cont(i),Q_cont(i-1,:),'mask',[1 1 1 1 1 1]);
end

p_cont = zeros(length(t_coord),3);

for i = 1:length(t_coord)
    T = irb140.fkine(Q_cont(i,:));
    p_cont(i,:) = T.t';
end

figure
subplot(2,2,1)
plot(t_coord,Q_coord)
grid on
legend('q1','q2','q3','q4','q5','q6')

subplot(2,2,2)
plot3(p_coord(:,1),p_coord(:,2),p_coord(:,3),'k','LineWidth',2)
hold on
plot3(p_coord(:,1),p_coord(:,2),p_coord(:,3),'.k')
for i = 1:10:length(t_coord)
    plot3([0 p_coord(i,1)],[0 p_coord(i,2)],[0 p_coord(i,3)],':k')
end
grid on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(2)

subplot(2,2,3)
plot(t_coord,Q_cont)
grid on
legend('q1','q2','q3','q4','q5','q6')

subplot(2,2,4)
plot3(p_cont(:,1),p_cont(:,2),p_cont(:,3),'k','LineWidth',2)
hold on
plot3(p_cont(:,1),p_cont(:,2),p_cont(:,3),'.k')
for i = 1:10:length(t_coord)
    plot3([0 p_cont(i,1)],[0 p_cont(i,2)],[0 p_cont(i,3)],':k')
end
grid on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
view(2)
