function [ xseries ] = SecantMethod( x0, x1, f, EaMax )
    xseries = [x0 x1];
    Ea = EaMax + 1;
    while (Ea > EaMax)
        xk = xseries(end-1);
        xkminus1 = xseries(end);
        xkplus1 = xk - (f(xk)*(xkminus1 - xk))/ (f(xkminus1)- f(xk));
        xseries = [xseries xkplus1];
        Ea = abs((xseries(end) - xseries(end-1)) / xseries(end)) * 100;
    end
end