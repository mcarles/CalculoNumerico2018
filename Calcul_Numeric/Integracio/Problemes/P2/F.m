function res = F(x)
 if (x >= 0) 
    res = (-1/3).*x.^7 + x.^5 + 5*x + 1;
 else
    res = x.^2 + 1;
 end
end

