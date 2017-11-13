function [ xLowSeries, xHighSeries ] = BisectionMethod( xGuessLow, xGuessHigh, f, EaMax )

    xLowSeries = [xGuessLow];
    xHighSeries = [xGuessHigh];
    Ea = EaMax + 1;
    while (Ea > EaMax)
        xr = (xGuessLow + xGuessHigh) / 2;
        if f(xGuessLow)*f(xr) < 0
            xGuessHigh = xr;
        elseif f(xr)*f(xGuessLow) > 0
            xGuessLow = xr;
        elseif f(xr) == 0
            xGuessLow = xr;
            xGuessHigh = xr;
        end
        xLowSeries = [xLowSeries xGuessLow];
        xHighSeries = [xHighSeries xGuessHigh];
        Ea = ApproximateErrorBracketMethod(xGuessLow, xGuessHigh);
    end
end