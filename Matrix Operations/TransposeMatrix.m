function [ Mout ] = TransposeMatrix( M )
%In: M is a matrix with arbitrary dimensions.
%Out: Mout will be the transpoer of M.
    dimM = size(M);
    Mout = zeros(dimM(2), dimM(1));
    
    for i = 1:dimM(1)
        for j = 1:dimM(2)
            Mout(j, i) = M(i,j);
        end
    end
end

