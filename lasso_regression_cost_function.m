function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  
  % Functia de cost pentru regresia lasso
  Theta = Theta(2:end, 1);
  functie = FeatureMatrix * Theta;

  m = length(Y);
  % Folosim formula din enuntul temei
  Error = (1/m) * sum((Y - functie).^2) + lambda * norm(Theta, 1);

endfunction