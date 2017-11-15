
function [ tSolution, Ysolution ] = ODEMidpoint( Yprime, tRange, Y0, h )
tSolution = tRange(1):h:tRange(2);
[numberOfEquations, ~] = size(Y0);
Ysolution = zeros(numberOfEquations, length(tRange));
Ysolution(:, 1) = Y0;

for (i = 2:length(tSolution))
    y12 = Ysolution(:, i-1) + h / 2 * Yprime(tSolution(i-1), Ysolution(:, i-1));
    Ysolution(:, i) = Ysolution(:, i-1) + h * Yprime(tSolution(i-1) + h / 2, y12);
end

end

