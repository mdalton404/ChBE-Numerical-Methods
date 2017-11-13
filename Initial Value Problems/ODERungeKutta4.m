function [ tSolution, Ysolution ] = ODERungeKutta4( Yprime, tRange, Y0, h )
%fourth order Runge Kutta

tSolution = tRange(1):h:tRange(2);
[numberOfEquations, ~] = size(Y0);
Ysolution = zeros(numberOfEquations, length(tRange));
Ysolution(:, 1) = Y0;

for (i = 2:length(tSolution))
    ti = tSolution(i-1);
    Yi = Ysolution(:, i-1);
    k1 =  Yprime(ti, Yi);
    k2 = Yprime(ti + 1 / 2 * h, Yi + 1 / 2 * k1 * h);
    k3 = Yprime(ti + 1 / 2 * h, Yi + 1 / 2 * k2 * h);
    k4 = Yprime(ti + h, Yi + k3 * h);
    Ysolution(:, i) = Yi + 1/6*(k1 + 2 * k2 + 2 * k3 + k4) * h;
end

end

