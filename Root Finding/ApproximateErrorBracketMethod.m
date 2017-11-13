function [ Ea ] = ApproximateErrorBracketMethod( xl, xu )

    Ea = abs((xu - xl) / (xu + xl)) * 100;
end

