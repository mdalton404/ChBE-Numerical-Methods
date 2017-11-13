function [ integral ] = integrateSimpson1o3 ( xseries, fseries )
    deltaX = xseries(3) - xseries(1);
    integral = 0;
    for i = 1:2:(length(xseries)-2)
        integral = integral + ((deltaX / 6) * (fseries(i) + 4 * fseries(i + 1) + fseries(i + 2)));
    end
end