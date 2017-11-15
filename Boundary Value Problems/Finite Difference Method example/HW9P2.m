clear
clc
close all

fprintf('Matthew Dalton mdalton31 hw9p2 \n')

h = 1;
D = 5000;
U = 100;
k = 2;
L = 100;
Cin = 100;

lamb1 = -0.0124;
lamb2 = 1;

c_analytical = @(x)(((U*Cin)/(((U - D*lamb1)*lamb2*exp(lamb2*L)) - ((U - D*lamb2)*lamb1*exp(lamb1*L)))) * (lamb2*exp(lamb2*L)*exp(lamb1*x) - lamb1*exp(lamb1*L)*exp(lamb2*x)));

sz = L / h + 3;

coefs = zeros(sz, sz);
consts = zeros(sz, 1);
consts(1,1) = U * Cin;

%first row
coefs(1,1:3) = [D / (2 * h), U, -D / (2 * h)];
%middle rows
for i = 2:(sz - 1)
    coefs(i, i-1:i+1) = [D / h^2 + U / (2 * h), -1 * (2 * D / h^2 + k), D / h^2 - U / (2 * h)];
end
%last row
coefs(end,end-2:end) = [-1 / (2 * h), 0, 1 / (2 * h)];
%solve
Avec = coefs \ consts;

%output
for i = -1:(sz-2)
    disp(['C_', num2str(i), ' = ', num2str(Avec(i+2,1)), ' M']);
end

%plot
plot(0:h:L, c_analytical(0:h:L))
hold on
plot(0:h:L, Avec(2:end-1))
title('Concentration vs. Distance')
xlabel('x')
ylabel('C')
legend('Analytical soln.', 'Finite difference soln.')