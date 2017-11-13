function [ tSolution, Ysolution ] = ODERungeKutta2( Yprime, tRange, Y0, h )
%Second order Runge Kutta
a1 = 1/2;
a2 = 1/2;
p1 = 1;
q11 = 1;

tSolution = tRange(1):h:tRange(2);
[numberOfEquations, ~] = size(Y0);
Ysolution = zeros(numberOfEquations, length(tRange));
Ysolution(:, 1) = Y0;

for (i = 2:length(tSolution))
    k1 =  Yprime(tSolution(i-1), Ysolution(:, i-1));
    k2 = Yprime(tSolution(i-1) + p1 * h, Ysolution(:, i-1) + q11 * k1 * h);
    Ysolution(:, i) = Ysolution(:, i-1) + h * (a1 * k1 + a2 * k2);
end

end

