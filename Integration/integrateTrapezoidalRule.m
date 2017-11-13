function [ integral ] = integrateTrapezoidalRule( xseries, fseries )
    % Mx
    M = [ones(length(xseries), 1), transpose(xseries)]
    b = transpose
end