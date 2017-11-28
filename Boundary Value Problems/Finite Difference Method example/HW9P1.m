clear
clc
close all

fprintf('Matthew Dalton mdalton31 hw9p1 \n')

h = .1;
A0 = 0.1;
Aend = 0;
D = 1.5e-6;
k = 5e-6;
L = 4;

sz = L / h - 1;

coefs = zeros(sz, sz);
consts = zeros(sz, 1);
consts(1,1) = -D * A0 / h^2;

%first row
coefs(1,1:2) = [-2 * D / h^2 - k, D / h^2];
%middle rows
for i = 2:(sz - 1)
    coefs(i, i-1:i+1) = [D / h^2, -2 * D / h^2 - k, D / h^2];
end
%last row
coefs(end,end-1:end) = [D / h^2, -2 * D / h^2 - k];
%solve
Avec = coefs \ consts;

%output
for i = 1:sz
    disp(['A_', num2str(i), ' = ', num2str(Avec(i,1)), ' M']);
end

%plot
plot(0:h:L, [A0; Avec; Aend])
title('Concentration vs. Distance')
xlabel('x')
ylabel('C')