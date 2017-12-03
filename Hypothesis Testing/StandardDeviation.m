function [ sigma ] = StandardDeviation( set )

    n = length(set);
    m = mean(set);
    sigma = 0;
    for i = 1:n
        sigma = sigma + (set(i) - m)^2 / (n-1);
    end
    sigma = sqrt(sigma);

end

