function [ Mout ] = AddScaledRow( M, rowa, rowb, k )
%Input: A matrix M, any dimensions. Integers, rowa, rowb, and k, all must
%be between 1 and the number of rows in M.
%Output: Mout will be the same as M, but with the row number rowa replaced
%by this row plus k * the row specified by rowb.
    Mout = M;
    Mout(rowa, :) = M(rowa, :) + k*M(rowb, :);
end

