function [ Mg ] = PerformGaussJordanElimination( M )
%In: M is a matrix with arbitrary dimensions, presumably an augmented matrix.
%Out: Mg will be the result of Gaussian Elimination, with the square matrix
%on the left converted to the identity matrix.
    [nRows, nColumns] = size(M);
    Mg = M;
    for i = 1:nRows
        if (Mg(i, i) == 0)
            Mg = MakePositionNonZero(Mg, i, i);
        end
        Mg = ScaleRow(Mg, i, 1/Mg(i,i));
        for j = (i+1):nRows
            Mg = AddScaledRow(Mg, j, i, -Mg(j, i));
        end
    end
    
    for i = nRows:-1:1
        for j = (i-1):-1:1
            Mg = AddScaledRow(Mg, j, i, -Mg(j, i));
        end
    end
end

function [Mout] = MakePositionNonZero(M, i, j)
    Mout = M;
    while (Mout(i, j) == 0)
        Mout = [Mout([1:i-1 i+1:end], :); Mout(i, :)];
    end
end
