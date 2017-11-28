function [ prob ] = TDist( nu, t )

prob = gamma((nu+1)/2)/(sqrt(nu*pi)*gamma(nu/2))*(1+t.^2/nu).^(-(nu+1)/2);

end

