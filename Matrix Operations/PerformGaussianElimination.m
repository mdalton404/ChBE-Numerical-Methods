function [ Mud ] = PerformGaussianElimination( M )
%In: M is an augmented matrix corresponding to a linear system.
%Out: Mud will be an upper diagonal matrix, obtained by Guassian
%elimination.

Mud = M;
[nRows, ~] = size(M);
    for i = 1:nRows
        Mud = PivotRow(Mud, i);
        for j = (i + 1):nRows
            Mud = AddScaledRow(Mud, j, i, -Mud(j, i) / Mud(i, i));
        end
    end
end

function [Mout] = PivotRow(M, row)
    Mout = M;
    ColumnOfInterest = Mout(row:end, row);
    [~, MaxPosition] = max(abs(ColumnOfInterest));
    Mout = SwapRows(Mout, row, row + MaxPosition - 1);
end