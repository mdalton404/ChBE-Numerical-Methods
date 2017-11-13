function [xOptSeries, firstx1, firstx2] = GoldenSectionSearch( xGuessLow, xGuessHigh, f, EaMax )
    xLower = xGuessLow;
    xUpper = xGuessHigh;
    R = (sqrt(5) - 1)/2; %Golden Ratio
    x1 = xLower + R*(xUpper - xLower);
    x2 = xUpper - R*(xUpper - xLower);
    firstx1 = x1; % record firstx1 and firstx2
    firstx2 = x2;
    f1 = f(x1);
    f2 = f(x2);
    if f1 > f2
        xOptSeries = x1;
        Ea = ApproximateErrorGoldenSectionSearch(xLower, x1, xUpper);
    else
        xOptSeries = x2;
        Ea = ApproximateErrorGoldenSectionSearch(xLower, x2, xUpper);
    end
    firstIter = true;
    while (Ea > EaMax)
        if f1 > f2
            xLower = x2;
            x2 = x1;
            f2 = f1;
            x1 = xLower + R*(xUpper - xLower);
            f1 = f(x1);
            if (firstIter)
                firstx2 = x2; % record first iteration x2 if changed
                firstx1 = x1;
            end
%           x2ReuseTest = x2 - (xUpper - R*(xUpper - xLower);
        else
            xUpper = x1;
            x1 = x2;
            f1 = f2;
            x2 = xUpper - R*(xUpper - xLower);
            f2 = f(x2);
            if(firstIter)
                firstx1 = x1; % record first iteration x1 if changed
                firstx2 = x2;
            end
%           x1ReuseTest = x1 - (xLower + R*(xUpper - xLower))
        end
        
        if f1 > f2
            xOptSeries = [xOptSeries x1];
            Ea = ApproximateErrorGoldenSectionSearch(xLower, x1, xUpper);
        else
            xOptSeries = [xOptSeries x2];
            Ea = ApproximateErrorGoldenSectionSearch(xLower, x2, xUpper);
        end
        
        firstIter = false;
    end
end

function [ Ea ] = ApproximateErrorGoldenSectionSearch( xL, xOpt, xU )
    R = (sqrt(5) - 1)/2; %Golden Ratio
    Ea = (1 - R) * abs((xU - xL)/xOpt) * 100;
end