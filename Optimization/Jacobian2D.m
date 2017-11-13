function [ JacobianMatlabFunction ] = Jacobian2D( f1xy, f2xy )
    syms x y
    JacobianSymbolic = [diff(f1xy(x, y), x) diff(f1xy(x, y), y); diff(f2xy(x, y), x) diff(f2xy(x, y), y)];
    JacobianMatlabFunction = @(xi,yi)double(subs(JacobianSymbolic, [x y], [xi yi]));
end

