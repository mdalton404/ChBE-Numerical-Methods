function [ Mout ] = SwapRows( M, rowa, rowb )
%In: M is a matrix with arbitrary dimensions.  The variables rowa and rowb
%each contain integers between 1 and the number of rows in M.
%Out: Mout will be the same as M, but with the rows specified by rowa and
%rowb swapped.
    Mout = M;
    Mout(rowa, :) = M(rowb, :);
    Mout(rowb, :) = M(rowa, :);
end