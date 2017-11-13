function [ ErrorEstimate ] = ApproximateErrorOpenMethod( CurrentGuess, PreviousGuess )
    ErrorEstimate = abs((CurrentGuess - PreviousGuess) / CurrentGuess) * 100;
end