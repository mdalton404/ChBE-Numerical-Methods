function [ HessianMatlabFunction ] = Hessian2D( f )
%f must depend on two variables
    syms x1 x2
    Hsymbolic = [diff(f(x1, x2), x1, 2) diff(diff(f(x1, x2), x1), x2) ; diff(diff(f(x1, x2), x2), x1) diff(f(x1, x2), x2, 2)];
    HessianMatlabFunction = matlabFunction(Hsymbolic, 'Vars', [x1 x2]);    
end

