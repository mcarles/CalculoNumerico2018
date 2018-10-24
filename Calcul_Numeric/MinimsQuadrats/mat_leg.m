function [matriu_escalar_leg] = mat_leg(m, A, B)
%Calcula la matriu de productes escalars

matriu_escalar_leg = zeros(m+1);
for i=1:m+1
    P = @(x) legendreP(i-1, x).^2;
    matriu_escalar_leg(i,i) = integral(P, A, B);
end

end

