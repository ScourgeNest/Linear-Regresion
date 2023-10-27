function [Y, InitialMatrix] = parse_csv_file(file_path)
  
  % Deschidem fisierul
  fid = fopen(file_path, 'r');

  % Citim dimensiunile matricei
  dim = dlmread (file_path, ',');
  frewind(fid);

  % Punem in m si n dimensiunile matricei
  m = size(dim, 1);
  n = size(dim, 2);
  % Citim datele din fisier
  data = textscan(fid, '%s', 'Delimiter', ',');

  % Construim matricea
  matrix = reshape(data{1}, n, m)';
  Y = zeros(m - 1, 1);
  % Initializam matricea
  InitialMatrix = cell(m - 1, n - 1);

  % Punem in Y valorile din prima coloana
  for i = 2:m
    Y(i - 1) = str2num(matrix{i, 1});
  endfor

  % Punem in InitialMatrix valorile din matrice
  for i = 2:m
    for j = 2:n
      if j <= 5 || j == n - 2
        InitialMatrix{i - 1, j - 1} = str2num(matrix{i, j});
      else
        InitialMatrix{i - 1, j - 1} = matrix{i, j};
      endif
    endfor
  endfor
  
  % Inchidem fisierul
  fclose(fid);

endfunction