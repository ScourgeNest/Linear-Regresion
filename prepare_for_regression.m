function [FeatureMatrix] = prepare_for_regression(InitialMatrix)

  % Punem in m si n dimensiunile matricei InitialMatrix
  [m,n] = size(InitialMatrix);
  InitialMatrix_numbers = reshape(InitialMatrix,m,n);
  FeatureMatrix = zeros(m, n + 1);
  % Parcurgem matricea InitialMatrix si in functie de valoarea fiecarui element
  % punem in FeatureMatrix 0 sau 1 sau valoarea elementului
  % La fel cum este prezentat in enuntul temei
  for i = 1 : m
    for j = 1 : n
      if strcmp(InitialMatrix{i,j}, 'no')
        FeatureMatrix(i,j) = 0;
      elseif strcmp(InitialMatrix{i,j}, 'yes')
        FeatureMatrix(i,j) = 1;
      elseif strcmp(InitialMatrix{i,j}, 'furnished')
        if j == n - 1
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,j + 1) = 0;
          FeatureMatrix(i,j + 2) = str2num(InitialMatrix{i,j + 1});
          break;
        endif
        FeatureMatrix(i,j) = 0;
        FeatureMatrix(i,j + 1) = 0;
      elseif strcmp(InitialMatrix{i,j}, 'unfurnished')
        if j == n - 1
          FeatureMatrix(i,j) = 0;
          FeatureMatrix(i,j + 1) = 1;
          FeatureMatrix(i,j + 2) = str2num(InitialMatrix{i,j + 1});
          break;
        endif
        FeatureMatrix(i,j) = 0;
        FeatureMatrix(i,j + 1) = 1;
      elseif strcmp(InitialMatrix{i,j}, 'semi-furnished')
        if j == n - 1
          FeatureMatrix(i,j) = 1;
          FeatureMatrix(i,j + 1) = 0;
          FeatureMatrix(i,j + 2) = str2num(InitialMatrix{i,j + 1});
          break;
        endif
        FeatureMatrix(i,j) = 1;
        FeatureMatrix(i,j + 1) = 0;
      else
          FeatureMatrix(i,j) = InitialMatrix{i,j};
      endif
    endfor
  endfor
  
endfunction