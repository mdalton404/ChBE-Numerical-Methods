function [ x1Series, x2Series, x3Series, x4Series ] = NewtonsMethod4NonlinearEquations( f1, f2, f3, f4, x1Guess, x2Guess, x3Guess, x4Guess, EaMax )
    xGuess = [x1Guess; x2Guess; x3Guess; x4Guess];
    xSeries = xGuess;
    JacobianFunction = Jacobian4eqs(f1, f2, f3, f4);
   
    done = 0;
    while (~done)
        JacobianNumerical = JacobianFunction(xGuess(1,1), xGuess(2, 1), xGuess(3,1), xGuess(4,1));
        fk = [f1(xGuess(1,1), xGuess(2,1), xGuess(3,1), xGuess(4,1)); f2(xGuess(1,1), xGuess(2,1), xGuess(3,1), xGuess(4,1)) ; f3(xGuess(1,1), xGuess(2,1), xGuess(3,1), xGuess(4,1)) ; f4(xGuess(1,1), xGuess(2,1), xGuess(3,1), xGuess(4,1)) ]
        xNextGuess = xGuess - inv(JacobianNumerical)*fk;
        xSeries = [xSeries xNextGuess];
        Ea = [ApproximateErrorOpenMethod(xSeries(1, end), xSeries(1,end-1)); ApproximateErrorOpenMethod(xSeries(2, end), xSeries(2,end-1)); ApproximateErrorOpenMethod(xSeries(3, end), xSeries(3,end-1)); ApproximateErrorOpenMethod(xSeries(4, end), xSeries(4,end-1))];
        if (Ea(1,1) < EaMax && Ea(2,1) < EaMax && Ea(3,1) < EaMax && Ea(4,1) < EaMax)
            done = 1;
        end
        xGuess = xNextGuess;
    end
    x1Series = xSeries(1, :);
    x2Series = xSeries(2, :);
    x3Series = xSeries(3, :);
    x4Series = xSeries(4, :);

end

