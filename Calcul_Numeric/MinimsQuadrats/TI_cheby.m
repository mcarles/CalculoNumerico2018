function [vec_TI_cheby] = TI_cheby(m, A, B, f)
%Calcula la matriu de productes escalars

vec_TI_cheby = zeros(m+1,1);

for i=1:m+1
    P = @(x) (chebyshevT(i-1, x).*f(x));
    vec_TI_cheby(i) = integral(P, A, B);
end

end

