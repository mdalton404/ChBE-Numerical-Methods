function [ JacobianMatlabFunction ] = Jacobian4eqs( f1, f2, f3, f4 )
    syms x1 x2 x3 x4
    JacobianSymbolic = [diff(f1(x1,x2,x3,x4),x1) diff(f1(x1,x2,x3,x4),x2) diff(f1(x1,x2,x3,x4),x3) diff(f1(x1,x2,x3,x4),x4) ; diff(f2(x1,x2,x3,x4),x1) diff(f2(x1,x2,x3,x4),x2) diff(f2(x1,x2,x3,x4),x3) diff(f2(x1,x2,x3,x4),x4) ; diff(f3(x1,x2,x3,x4),x1) diff(f3(x1,x2,x3,x4),x2) diff(f3(x1,x2,x3,x4),x3) diff(f3(x1,x2,x3,x4),x4) ; diff(f4(x1,x2,x3,x4),x1) diff(f4(x1,x2,x3,x4),x2) diff(f4(x1,x2,x3,x4),x3) diff(f4(x1,x2,x3,x4),x4) ]
    %JacobianSymbolic = [diff(f1(x, y), x) diff(f1xy(x, y), y); diff(f2xy(x, y), x) diff(f2xy(x, y), y)];
    JacobianMatlabFunction = @(xa,xb,xc,xd)double(subs(JacobianSymbolic, [x1 x2 x3 x4], [xa xb xc xd]));
end
