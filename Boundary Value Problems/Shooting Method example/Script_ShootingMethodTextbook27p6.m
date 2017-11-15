%Script_ShootingMethodTextbook27p6
clear
clc
close all

deltax = 0.001;
gammaSeries = SecantMethod(-1000, -900, @RootFindingProblem27p6, deltax);
correctGamma = gammaSeries(end)

[xseries, Yseries] = ODERungeKutta4(@IVP27p6, [0, 0.5], [200; correctGamma], 0.01);
Tseries = Yseries(1, :);
 
plot(xseries, Tseries)
xlabel('x');
ylabel('T');