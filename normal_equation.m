function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  
  % Punem in m si n dimensiunile matricei FeatureMatrix
  [m n] = size(FeatureMatrix);
  % Initializam x cu 0
  x = zeros(n, 1);
  % Initializam matricea A si vectorul b
  A = FeatureMatrix' * FeatureMatrix;
  b = FeatureMatrix' * Y;
  Theta = zeros(n + 1, 1);
  % Verificam daca matricea A este pozitiv definita
  if any(eig(A) < 0)
    return;
  endif
  % Aplicam metoda gradientului conjugat prezenta in enuntul temei
  r = b - A * x;
  v = r;
  tol = tol^2;
  k = 1;
  while k <= iter && r' * r > tol
    alpha = (r' * r) / (v' * A * v);
    x = x + alpha * v;
    r_new = r - alpha * A * v;
    beta = (r_new' * r_new) / (r' * r);
    v = r_new + beta * v;
    r = r_new;
    k++;
  endwhile

  Theta(2:end,:) = x;
  
endfunction
