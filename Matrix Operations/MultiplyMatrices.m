function [ Mout ] = MultiplyMatrices( M1, M2 )
%In: M1 and M2 must be conformal matrices.  
%Out The product of the two input matrices.
    dim1 = size(M1);
    dim2 = size(M2);
    Mout = zeros(dim1(1), dim2(2));
    
    for i = 1:dim1(1)
        for j = 1:dim2(2)
            sum = 0;
            for k = 1:dim1(2)
                sum = sum + M1(i, k)*M2(k, j);
            end
            Mout(i,j) = sum;
        end
    end
end

