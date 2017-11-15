function [ Yprime ] = IVP27p6( x, Y )
    T = Y(1);
    z = Y(2);
    
    Yprime = [z; 10^(-7)*(T+273)^4 + 4 *(150 - T)];

end
