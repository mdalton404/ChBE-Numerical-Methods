function [h] = RootFindingProblem27p6 (gamma)
	[~, Yseries] = ODERungeKutta4(@IVP27p6, [0, 0.5], [200; gamma], 0.01);
	h = Yseries(1, end) - 100;
end