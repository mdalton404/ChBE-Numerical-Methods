function [NPV] = CalculateNetPresentValue (cashFlow, interestRate, inflationRate)
    NPV = 0;
    for i = 1:length(cashFlow)
       NPV = NPV + (cashFlow(i) * (1 + inflationRate).^(i - 1)) / ((1 + interestRate).^(i - 1));
    end
end