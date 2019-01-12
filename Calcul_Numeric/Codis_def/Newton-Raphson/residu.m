function [res] = residu(x)
res = 3*x.^5 - 8*x.^4 - 12*x.^3 + 32*x.^2 + 12*x - 32;
end

