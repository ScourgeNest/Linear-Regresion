function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  
  % Functia de cost pentru regresia liniara
  Theta = Theta(2:end, 1);
  functie = FeatureMatrix * Theta;

  m = length(Y);
  % Folosim formula din enuntul temei
  Error = (1/(2*m)) * sum((functie - Y).^2);

endfunction