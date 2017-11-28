function [ RejectNullHypothesis, significance ] = OneSampleTTest( SampleSet, mu0, SignificanceThreshold)
%performs 2-tail t-test on a sample set (any size) and a signle number mu0.
%User can specify significance threshold.  If you want a 1-tail t-test, cut
%the significance threshold in half.
    SetMean = mean(SampleSet);
    SetSD = StandardDeviation(SampleSet);
    n = length(SampleSet);
    t = (SetMean - mu0) / (SetSD / sqrt(n));
    significance = TDistCumulative(n-1, t);
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

