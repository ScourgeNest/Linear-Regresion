function [Y, InitialMatrix] = parse_data_set_file(file_path)

  % Deschid fisierul
  fid = fopen(file_path, 'r');
  % Citesc dimensiunile matricei
  % Pun in m si n dimensiunile matricei
  line = fgetl(fid);
  m = strsplit(line, ' ');
  % m{1} = numarul de linii
  % m{2} = numarul de coloane
  n = m{2};
  m = m{1};
  aux = str2num(m);
  m = aux;
  aux = str2num(n);
  n = aux;
  % Citesc matricea
  Y = zeros(m, 1);
  InitialMatrix = cell(m, n);
  for i = 1:m
    line = fgetl(fid);
    line = strsplit(line, ' ');
    Y(i) = str2num(line{1});
    for j = 2:n + 1
      if(j <= 16 || j == n - 1)
        % Daca este un string, il pun in matrice dupa ce il transform in numar
        InitialMatrix{i, j - 1} = str2num(line{j});
      else
        % Daca este un numar, il pun in matrice
        InitialMatrix{i, j - 1} = line{j};
      endif
    endfor
  endfor
  % Inchid fisierul
  fclose(fid);
  
endfunction