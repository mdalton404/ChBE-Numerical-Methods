function [newGuessVector] =  SteepestAscent2DSingleOptimalStep (f, fGradient, xguess)
  syms t 
  
  x = xguess;
  xnew=x(:,end) + fGradient(x(1, end), x(2,end))*t;
  
  g = f(xnew(1,1), xnew(2, 1));
  gprime = diff(g, t);
  gprimet = @(x)double(subs(gprime, t, x));
  
  delfN = fGradient(xguess(1), xguess(2));
  tU = 0.01/sqrt(delfN(1,1)^2 + delfN(2,1)^2);
  gprime0 = gprimet(0);
  while gprime0*gprimet(tU) >= 0
      tU = tU * 2;
  end
  [xlseries, xuseries] = BisectionMethod(0, tU, gprimet, 0.001);
  stepSD = (xlseries(end)+xuseries(end))/2;
  newGuessVector = double(subs(xnew, t, stepSD));
end