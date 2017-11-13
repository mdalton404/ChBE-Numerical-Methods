function [ integral ] = integrateLeftHandRiemannSum( xseries, fseries )
    deltaX = xseries(2) - xseries(1);
    integral = 0;
    for i = 1:(length(xseries)-1)
        integral = integral + deltaX * fseries(i);
    end
end