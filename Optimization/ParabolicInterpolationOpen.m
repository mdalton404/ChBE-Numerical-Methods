function [ xGuesses ] = ParabolicInterpolationOpen( listOf3Guesses, f, percentErrorTolerance )

    xGuesses = listOf3Guesses;
    Ea = percentErrorTolerance + 1;
    xi = xGuesses(end-2);
    xip1 = xGuesses(end-1);
    xip2 = xGuesses(end);
    fxi = f(xi);
    fxip1 = f(xip1);
    fxip2 = f(xip2);

    while (Ea > percentErrorTolerance)
        newGuess = NewGuessParabolicInterpolation(xi, xip1, xip2, fxi, fxip1, fxip2);
        xGuesses = [xGuesses newGuess];
        xi = xip1;
        xip1 = xip2;
        xip2 = newGuess;
        fxi = fxip1;
        fxip1 = fxip2;
        fxip2 = f(xip2);
        Ea = ApproximateErrorOpenMethod(xip2, xip1);
    end

end

