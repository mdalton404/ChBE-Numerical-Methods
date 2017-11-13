function [ integral ] = integrateSimpson3o8 ( xseries, fseries )
    deltaX = xseries(4) - xseries(1);
    integral = 0;
    for i = 1:3:(length(xseries)-3)
        integral = integral + (deltaX / 8) * (fseries(i) + 3 * fseries(i + 1) + 3 * fseries(i + 2) + fseries(i + 3));
    end
end