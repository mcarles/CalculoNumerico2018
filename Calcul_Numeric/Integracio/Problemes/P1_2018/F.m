function [Y] = F(X)
Y = [1;1;1;1];
Y(1) = 2*X(1) + 2*X(2) + X(3) - 2;
Y(2) = X(1) + X(2)*X(4).^2 -1/3;
Y(3) = X(1) + X(2)*X(4).^4 -1/5;
Y(4) = X(1) + X(2)*X(4).^6 -1/7;
end

