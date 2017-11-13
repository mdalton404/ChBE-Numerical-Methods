function [ x3 ] = NewGuessParabolicInterpolation( x0, x1, x2, y0, y1, y2 )

    M = [x0^2, x0, 1; x1^2, x1, 1; x2^2, x2, 1];
    B = [y0; y1; y2];
    abcVector = M\B;
    a = abcVector(1);
    b = abcVector(2);
    c = abcVector(3);
    x3 = -b/(2*a);
end

