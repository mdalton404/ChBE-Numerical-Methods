function [ CumulativeProbability ] = TDistCumulative( nu, t )

    tseries = -10:0.001:t;
    uSeries = tseries;
    for i = 1:length(tseries)
        uSeries(i) = TDist(nu, tseries(i));
    end
    CumulativeProbability = trapz(tseries, uSeries);

end

