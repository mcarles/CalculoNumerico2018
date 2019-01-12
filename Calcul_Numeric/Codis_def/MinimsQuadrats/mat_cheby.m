function [matriu_escalar_cheby] = mat_cheby(m, A, B)
%Calcula la matriu de productes escalars

%base = @(grau,x)(chebyshevT(grau,x));  %Base polinomis Chebyshev
base = @(grau,x)(x.^grau);              %Base natural (1,x,x^2,etc)

matriu_escalar_cheby = zeros(m+1);
for i=1:m+1
    for j = 1:m+1
        P = @(x) base(i-1, x).*base(j-1,x);
        matriu_escalar_cheby(i,j) = integral(P, A, B);
    end
end

end

