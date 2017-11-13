clear %clear contents of variables from memory
clc   %clear the Matlab console window
% clf   %clear the active figure window
% close all %close all figure windows

%define a linear system as a matrix problem
A = [2500 3000 1500; 1800 4000 1200; 2200 3500 1300]
b = [112; 116.4; 113.6]*10^6
inv(A)*b %inv is a built-in function
A\b  %This commend does the same calculation as the line abolve, but is less susceptable to numerical error. 

B = [3 -2 2; 1 2 -3; 4 1 2]
det(B) %det is a built-in function

M = [3 2 1 1; 2 3 1 12; 1 1 4 12] %M is an augmented matrix

A = [3 2 1; 2 3 1; 1 1 4];
b = [1; 12; 12];
M = [A b] %This may be a better way of defining an augmented matrix.
A\b
inv(A)*b

%Performing Gaussian elimination to solve Example 9.12 in the text (and lecture notes). I wrote the functions that perform the row operaions. 
A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
b = [7.85; -19.3; 71.4];
%M1 = ScaleRow([A b], 1, 1/3)
M1 = ScaleRow([A [1 0 0; 0 1 0; 0 0 1]], 1, 1/3) %Uncomment this line to perform matrix inversion on A.
M2 = AddScaledRow(AddScaledRow(M1, 2, 1, -0.1), 3, 1, -0.3)
M3 = ScaleRow(M2, 2, 1/M2(2, 2))
M4 = AddScaledRow(M3, 3, 2, -M3(3, 2))
M5 = ScaleRow(M4, 3, 1/M4(3, 3))
M6 = AddScaledRow(AddScaledRow(M5, 2, 3, -M5(2, 3)), 1, 3, -M5(1, 3))
M7 = AddScaledRow(M6, 1, 2, -M6(1, 2))
%Using Matlab's built-in capibilities to solve the same problem:
AInverseMatlabBuiltin = inv(A)
% A\b

%I wrote the function below to perform Gaussian Elimination automatically
GaussJordanSolution = PerformGaussJordanElimination([A b]);
GaussJordanSolution = GaussJordanSolution(:, end)

UDMatrix = PerformGaussianElimination([A b]);
GaussianEliminationSolution = PerformBackSubstitution(UDMatrix)

% Below I use Gaussian elimination to perform matrix inversion. 
% IdentityMatrix = [1 0 0; 0 1 0; 0 0 1];
% PerformGaussJordanElimination([A IdentityMatrix])
% AInverse = InvertMatrix(A)
% inv(A)
% AInverse * b