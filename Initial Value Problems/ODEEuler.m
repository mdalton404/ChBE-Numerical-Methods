function [ tSolution, Ysolution ] = ODEEuler( Yprime, tRange, Y0, h )

tSolution = tRange(1):h:tRange(2);
[numberOfEquations, ~] = size(Y0);
Ysolution = zeros(numberOfEquations, length(tSolution));
Ysolution(:, 1) = Y0;

for (i = 2:length(tSolution))
    Ysolution(:, i) = Ysolution(:, i-1) + h * Yprime(tSolution(i-1), Ysolution(:, i-1));
end

end

