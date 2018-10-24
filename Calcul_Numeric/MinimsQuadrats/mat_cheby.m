function [matriu_escalar_cheby] = mat_cheby(m, A, B)
%Calcula la matriu de productes escalars

matriu_escalar_cheby = zeros(m+1);
for i=1:m+1
    P = @(x) chebyshevT(i-1, x).^2;
    matriu_escalar_cheby(i,i) = integral(P, A, B);
end

end

