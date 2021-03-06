function [matriu_escalar_leg] = mat_leg(m, A, B)
%Calcula la matriu de productes escalars
%base = @(grau,x)(legendreP(grau,x));
base = @(grau,x)(x.^grau);

matriu_escalar_leg = zeros(m+1);
for i=1:m+1
    for j = 1:m+1
        P = @(x) base(i-1, x).*base(j-1,x);
        matriu_escalar_leg(i,j) = integral(P, A, B);
    end
end

end

