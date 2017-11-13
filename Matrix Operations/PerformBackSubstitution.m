function [ xSolution ] = PerformBackSubstitution( UDMatrix )
%In: Upper diagonal augmented matrix for a linear system (number of columns should be one more than the number of rows)
%Out: The x values that solve the linear system, as a column vector

    [nRows, ~] = size(UDMatrix);
    xSolution = zeros(nRows, 1);
    for i = nRows:-1:1
        xSolution(i, 1) = (UDMatrix(i, end) - UDMatrix(i, i:end-1) * xSolution(i:end, 1)) / UDMatrix(i, i);
    end
end

