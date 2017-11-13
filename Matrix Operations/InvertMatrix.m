function [ Minverse ] = InvertMatrix( M )
%in: Square Matrix, M.  M is assumed to have an inverse.
%out: The inverse of M.
    sizeM = size(M);
    sizeM = sizeM(1);
    IdentityMatrix = zeros(sizeM, sizeM);
    for i = 1:sizeM
        IdentityMatrix(i, i) = 1;
    end
    Minverse = PerformGaussJordanElimination([M IdentityMatrix])
    Minverse = Minverse(:, sizeM+1:end);
end

