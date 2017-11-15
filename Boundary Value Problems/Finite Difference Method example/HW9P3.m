clear
clc
close all

fprintf('Matthew Dalton mdalton31 hw9p3 \n')

%%% PART A %%%
tRange = [0, 10];
tStep = 0.1;
Y0 = [10; 25];

[ts45, Ys45] = ode45(@FP3, tRange, Y0);
[tsRK, YsRK] = ODERungeKutta4(@FP3, tRange, Y0, tStep);
[tsM, YsM] = ODEMidpoint(@FP3, tRange, Y0, tStep);
[tsE, YsE] = ODEEuler(@FP3, tRange, Y0, tStep);

figure('Name', 'Figure 3a')
plot(ts45, Ys45(:, 1))
hold on
plot(ts45, Ys45(:, 2))
plot(tsRK, YsRK(1, :))
plot(tsRK, YsRK(2, :))
plot(tsM, YsM(1, :))
plot(tsM, YsM(2, :))
plot(tsE, YsE(1, :))
plot(tsE, YsE(2, :))
title('Concentrations in the Reactor')
legend('ode45 C_A_,_1', 'ode45 C_B_,_1', 'RK C_A_,_1', 'RK C_B_,_1', 'Midpoint C_A_,_1', 'Midpoint C_B_,_1', 'Euler C_A_,_1', 'Euler C_B_,_1')
xlabel('t')
ylabel('C')



%%% PART B %%%
clear
tmax = 10;
h = 0.1;
Tend = 350;

sz = tmax / h + 1;

coefs = zeros(sz, sz);
consts = zeros(sz, 1);

%set consts column vector
consts(1,1) = 0;
consts(2:end-1) = zeros(size(consts(2:end-1))) + 370;
consts(end, 1) = 370 - (10 / h^2 + 6 / h) * Tend;

%first row
coefs(1,1:3) = [-1 / (2 * h), 0, 1 / (2 * h)];
%middle rows
for i = 2:(sz-1)
    coefs(i, i-1:i+1) = [10 / h^2 - 6 / h, 1 - 20 / h^2, 10 / h^2 + 6 / h];
end
%last row
coefs(end,end-2:end) = [10 / h^2 - 6 / h, 1 - 20 / h^2, 0];
%solve 
Avec = coefs \ consts;

%output
for i = -1:(sz-2)
    disp(['T_', num2str(i), ' = ', num2str(Avec(i+2,1)), ' M']);
end

%plot
figure('Name', 'Figure 3b')
plot(0:h:tmax, [Avec(2:end); Tend])
title('Reactor Temperature Profile')
xlabel('t')
ylabel('T')


