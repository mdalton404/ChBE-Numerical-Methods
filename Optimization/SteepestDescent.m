function [nextX] = SteepestDescent(xis, yis, x0, gradient, EaMax)
    E1 = EaMax + 1;
    E2 = EaMax + 1;
    nextX = x0;
    while (EaMax < E1 && EaMax < E2)
        step = OptimizeStep(xis, yis, x0, gradient);
        nextX = x0 - step(end) * fGradient(xis, yis, x0);
        E1 = abs((nextX(1) - x0(1)) / nextX(1));
        E2 = abs((nextX(2) - x0(2)) / nextX(2));
        x0 = nextX;
    end
end