function [yp] = f(x,y)
    %Dada la edo y' = f(x,y) devuelve y' en x, y, y vector columna
    yp = y - x.^2 + 1;
end

