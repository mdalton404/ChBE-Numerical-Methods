function [ Yprime ] = FP3( t, Y )
Yprime = [1 / 6 * (Y(1,1) - 10) - 0.5 * Y(1,1);
          -1 / 6 * Y(2,1) + 0.5 * Y(1,1)];
end