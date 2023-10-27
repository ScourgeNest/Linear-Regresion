function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)

  % Initializam Theta cu 0
  Theta = zeros(n,1);
  Theta = double(Theta);
  % Initializam aux cu 0
  aux = zeros(n,1);
  i = 0;
  while (1)
    i++;
    % Calculam gradientul
    gradient =  (1 / m) * FeatureMatrix' * (FeatureMatrix * aux - Y);
    % Actualizam aux
    aux = aux - alpha * gradient;
    if(i == iter)
      break;
    endif
  endwhile
  % Theta va fi vectorul de ponderi
  Theta = [0, aux']';
  
endfunction