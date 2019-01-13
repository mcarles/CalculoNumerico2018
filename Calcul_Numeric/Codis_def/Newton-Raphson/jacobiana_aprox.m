function [res] = jacobiana_aprox(x0, f, h)
    res = zeros(length(x0), 1);
    aprox = zeros(length(x0), 1);
        
        e = zeros(length(x0), 1);
        e(1) = h;
        aprox = (f(x0 + e) - f(x0))/h;
        res = aprox;
    
    for j = 2:length(x0)
        e = zeros(length(x0), 1);
        e(j) = h;
        aprox = (f(x0 + e) - f(x0))/h;
        res = [res, aprox];
    end
end

