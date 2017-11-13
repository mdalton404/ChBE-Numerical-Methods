function [ Mout ] = ScaleRow( M, RowNumber, k )
%In: M is a matrix with arbitrary dimensions.  RowNumber is an integer
%between 1 and the number of rows in M. The variable k contains any number.
%Mout will be the same as M, but with the row specified by RowNumber scaled
%by k.
    Mout = M;
    Mout(RowNumber, :) = k * M(RowNumber, :);
end

