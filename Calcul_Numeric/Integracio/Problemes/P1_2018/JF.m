function [J] = JF(X)
J = [2, 2, 1, 0; 1, X(4).^2, 0, 2*X(2)*X(4); 1, X(4).^4, 0, 4*X(2)*X(4).^3; 1, X(4).^2, 0, 6*X(2)*X(4).^5];
end

