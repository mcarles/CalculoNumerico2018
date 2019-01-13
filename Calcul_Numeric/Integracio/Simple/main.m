close all; clear; clc;

a = 0;
b = 5;
I_exact = exp(-a) + exp(-b) + (sqrt(pi)/4)*(erf(b-4) - erf(a-4));

err_exact = [];

% Newton Cotes
for n = 1:14
    x = linspace(a,b,n+1);
    w = pesos(x,n+1,a,b);
    I = Integra(x, @F, w, -1, 1);

    err_exact = [err_exact, abs(I_exact- I)];

end

figure(1)
plot(log(1:14), log(err_exact), '*-')
xlabel("log(pts)")
ylabel("log(err)")

%Gauss-Legendre
err_exact_gauss = [];
for n = 1:14
    [z, w] = QuadraturaGauss(n+1);
    
    I_gauss = Integra(z, @F, w, a, b)   
    err_exact_gauss = [err_exact_gauss, abs(I_exact- I_gauss)];

end


figure(2)
plot(log(1:14), log(err_exact_gauss), 'o-')
xlabel("log(pts)")
ylabel("log(err)")

