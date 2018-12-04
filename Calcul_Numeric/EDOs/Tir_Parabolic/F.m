function [dY] = F(x, @Z)
    dY(1) = Z(2);
    dY(2) = -Z(1);

end

