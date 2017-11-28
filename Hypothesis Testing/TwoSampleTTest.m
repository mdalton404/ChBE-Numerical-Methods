function [ RejectNullHypothesis, significance ] = TwoSampleTTest( SampleSet1, SampleSet2, SignificanceThreshold)
%performs 2-tail t-test on two sample sets (any size)
%User can specify significance threshold.  If you want a 1-tail t-test, cut
%the significance threshold in half.
    SetMean1 = mean(SampleSet1)
    SetMean2 = mean(SampleSet2)
    SetSD1 = StandardDeviation(SampleSet1);
    SetSD2 = StandardDeviation(SampleSet2);
    n1 = length(SampleSet1)
    n2 = length(SampleSet2)
    [SEM12 nu] = StandardError(n1, n2, SetSD1, SetSD2);
    t = (SetMean1 - SetMean2) / SEM12
    significance = TDistCumulative(nu, t);
    if significance > 0.5
        significance = 1 - significance;
    end
    significance = 2 * significance;
    if (significance < SignificanceThreshold)
        RejectNullHypothesis = 1;
    else
        RejectNullHypothesis = 0;
    end
end

function [SEM, nu] = StandardError(n1, n2, s1, s2)
    SEM = sqrt(s1^2/n1 + s2^2/n2);
    nu = (s1^2/n1 + s2^2/n2)^2 / ((s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1));
end