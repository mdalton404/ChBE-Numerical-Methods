function [ owed ] = LoanBalance ( borrowed, intRate, payment, term)
    owed = borrowed;
    for i = 1:term
        owed = owed * (1 + intRate) - payment;
    end
end