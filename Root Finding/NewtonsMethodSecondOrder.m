function [ xseries ] = NewtonsMethodSecondOrder( xguess, f, fPrime, fDoublePrime, EaMax )
    xseries = [xguess];
    Ea = EaMax + 1;
    while (Ea > EaMax)
        xk = xseries(end);
        a = 1/2 * fDoublePrime(xk);
        b = fPrime(xk) - xk * fDoublePrime(xk);
        c = 1/2 * fDoublePrime(xk) * (xk ^ 2) - fPrime(xk) * xk + f(xk); 
        nextxs = [(-1 * b + sqrt(b ^ 2 - 4 * a * c)) / (2 * a), ...
                  (-1 * b - sqrt(b ^ 2 - 4 * a * c)) / (2 * a)];
        if (abs(diff(abs(nextxs - xk))) < eps)
            % if equally far choose larger root guess
            nextx = max(nextxs);
        else
            % choose guess that is closer to closest to previous 
            [~, minNdx] = min(abs(nextxs - xk));
            nextx = nextxs(minNdx);
        end  
        xseries = [xseries, nextx];
        Ea = abs((xseries(end) - xseries(end-1)) / xseries(end)) * 100;     
    end
        
end