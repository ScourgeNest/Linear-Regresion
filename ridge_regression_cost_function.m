function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)

  % Functia de cost pentru regresia liniara cu regularizare
  Theta = Theta(2:end, 1);
  functie = FeatureMatrix * Theta;

  m = length(Y);
  % Folosim formula din enuntul temei
  Error = (1/(2 * m)) * sum((functie - Y).^2) + lambda * sum(Theta.^2);

endfunction