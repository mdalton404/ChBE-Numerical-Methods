function [ xGuesses ] = ParabolicInterpolationBracketing( listOf3Guesses, f, percentErrorTolerance )
%This approach to Parabolic Interpolation resembles a bracketing method,
%but, strictly speaking, it is not a bracketing method.  The new guess for any iteration could be outside the
%bracket.
    xGuesses = sort(listOf3Guesses);
    x1 = xGuesses(1);
    x2 = xGuesses(2);
    x3 = xGuesses(3);
    fx1 = f(x1);
    fx2 = f(x2);
    fx3 = f(x3);

    Ea = percentErrorTolerance + 1;
    while (Ea > percentErrorTolerance)
        newGuess = NewGuessParabolicInterpolation(x1, x2, x3, fx1, fx2, fx3);
        xGuesses = [xGuesses newGuess];
        if (newGuess > x2)
            x1 = x2;
            fx1 = fx2;
        else
            x3 = x2;
            fx3 = fx2;            
        end
        x2 = newGuess;
        fx2 = f(x2);
        Ea = ApproximateErrorBracketMethod(x1, x3);
    end
end

