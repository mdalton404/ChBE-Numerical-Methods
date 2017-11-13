function [ xseries ] = NewtonsMethod( xguess, f, fprime, EaMax )
    xseries = [xguess];
    Ea = EaMax + 1;
    while (Ea > EaMax)
        xseries = [xseries xseries(end) - f(xseries(end)) / fprime(xseries(end))];
        Ea = ApproximateErrorOpenMethod(xseries(end-1), xseries(end));
    end
end