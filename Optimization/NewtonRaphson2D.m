function [ xNR ] = NewtonRaphson2D( f, xguess, EaMax )
    
    delf = Gradient2D(f);
    H = Hessian2D(f);
    xNR = xguess;
    done = 0;
    while (~done)
        invH = inv(H(xNR(1,end), xNR(2,end)));
        xNR = [xNR, xNR(:, end) - invH * delf(xNR(1,end), xNR(2,end))];
        Ea = [ApproximateErrorOpenMethod(xNR(1, end), xNR(1,end-1)); 
        ApproximateErrorOpenMethod(xNR(2, end), xNR(2,end-1))];
        if (Ea(1,1) < EaMax && Ea(2,1) < EaMax)
            done = 1;
        end
    end
end

