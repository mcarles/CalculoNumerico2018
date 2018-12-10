function [dY] = F(x, Z, R, g)
    dY = [-1; -2; -3; -4];
    dY(1) = Z(3);
    dY(2) = Z(4);
    dY(3) = -R*norm([Z(3), Z(4)], 2)*Z(3) + g(1);
    dY(4) = -R*norm([Z(3), Z(4)], 2)*Z(4) + g(2);
    
end

