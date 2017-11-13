function [ x1Series, x2Series ] = NewtonsMethod2NonlinearEquations( f1, f2, x1Guess, x2Guess, EaMax )
    xGuess = [x1Guess; x2Guess];
    xSeries = xGuess;
    JacobianFunction = Jacobian2D(f1, f2);
   
    done = 0;
    while (~done)
        JacobianNumerical = JacobianFunction(xGuess(1,1), xGuess(2, 1));
        xNextGuess = xGuess - inv(JacobianNumerical)*[f1(xGuess(1, 1), xGuess(2, 1)); f2(xGuess(1, 1), xGuess(2, 1))];
        xSeries = [xSeries xNextGuess];
        Ea = [ApproximateErrorOpenMethod(xSeries(1, end), xSeries(1,end-1)); ApproximateErrorOpenMethod(xSeries(2, end), xSeries(2,end-1))];
        if (Ea(1,1) < EaMax && Ea(2,1) < EaMax)
            done = 1;
        end
        xGuess = xNextGuess;
    end
    x1Series = xSeries(1, :);
    x2Series = xSeries(2, :);
end

