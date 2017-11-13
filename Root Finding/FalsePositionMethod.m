function [ xLowSeries, xHighSeries, xrSeries ] = FalsePositionMethod( xGuessLow, xGuessHigh, f, EaMax )
    xLowSeries = [xGuessLow];
    xHighSeries = [xGuessHigh];
    Ea = EaMax+1;
    xrSeries = [xGuessLow];
    while (Ea > EaMax)
        xr = FalsePositionXr(xGuessLow, xGuessHigh, f);
        if f(xGuessLow)*f(xr) < 0
            xGuessHigh = xr;
        elseif f(xr)*f(xGuessLow) > 0
            xGuessLow = xr;
        elseif f(xr) == 0
            xGuessLow = xr;
            xGuessHigh = xr;
            xrSeries = [xrSeries xr];
            xLowSeries = [xLowSeries xGuessLow];
            xHighSeries = [xHighSeries xGuessHigh];
        end
        xLowSeries = [xLowSeries xGuessLow];
        xHighSeries = [xHighSeries xGuessHigh];
        xrSeries = [xrSeries xr];
        Ea = ApproximateErrorFalsePosition(xrSeries(end-1), xrSeries(end));
        xrold = xr;
    end
end

function [xr] = FalsePositionXr (xl, xu, f)
    xr = xu - (f(xu) * (xl - xu)) / (f(xl) - f(xu));
end

function [Ea] = ApproximateErrorFalsePosition(xrold, xr)
    Ea = abs((xr - xrold) / xr) * 100;
end