function [vec_TI_leg] = TI_leg(m, A, B, f)
%Calcula la matriu de productes escalars

vec_TI_leg = zeros(m+1,1);

for i=1:m+1
    P = @(x) (legendreP(i-1, x).*f(x));
    vec_TI_leg(i) = integral(P, A, B);
end

end

