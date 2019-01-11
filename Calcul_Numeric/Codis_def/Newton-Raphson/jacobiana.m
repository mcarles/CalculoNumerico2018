function [res] = jacobiana(x)
    res = 15*x.^4 - 32*x.^3 - 36*x.^2 + 64*x + 12;
end

