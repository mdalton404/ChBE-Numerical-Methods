function [ CumulativeProbability ] = ZDistCumulative( z )

    zseries = -10:0.001:z;
    uSeries = zseries;
    for i = 1:length(zseries)
        uSeries(i) = ZDist(zseries(i));
    end
    CumulativeProbability = trapz(zseries, uSeries);

end

