function [ delFmatlabFunction ] = Gradient2D( f )
    syms x1 x2
    delFsymbolic = [diff(f(x1, x2), x1); diff(f(x1, x2), x2)];
    delFmatlabFunction = matlabFunction(delFsymbolic, 'Vars', [x1 x2]);
end

