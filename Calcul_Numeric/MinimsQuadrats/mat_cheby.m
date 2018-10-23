function [scalar_cheby] = mat_cheby(m, A, B)
%Calcula la matriu de productes escalars

syms x;
P = chebyshevT(m, x);

scalar_cheby = zeros(m);
for i=1:m
    scalar_cheby(i,i) = integral(P(i)*P(i), A, B)
end
end

