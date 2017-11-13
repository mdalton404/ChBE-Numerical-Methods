function [ topt ] = OptimizeStep( DataSet, linedef, delf )

    g = @(t)ftprime(DataSet, linedef, delf, t);
    
    tseries = SecantMethod(0, 0.00001, g, 0.01);
    topt = tseries(end);
    
end

