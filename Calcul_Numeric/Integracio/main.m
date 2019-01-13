close all; clear; clc;


%% Cas 1
m = 19;
a = 0;
b = 5;
I_exact = exp(-a) + exp(-b) + (sqrt(pi)/4)*(erf(b-4) - erf(a-4));

err_exact = [];

% Newton Cotes
for n = 1:m
    x = linspace(a,b,n+1);
    w = pesos(x,n+1,a,b);
    I = Integra(x, @F, w, -1, 1);

    err_exact = [err_exact, abs(I_exact- I)];

end

figure(1)
plot(log(1:m), log(err_exact), '*-r')
xlabel("log(pts)")
ylabel("log(err)")
grid on;
hold on;

%Gauss-Legendre
err_exact_gauss = [];
for n = 0:m
    [z, w] = QuadraturaGauss(n+1);
    
    I_gauss = Integra(z, @F, w, a, b);   
    err_exact_gauss = [err_exact_gauss, abs(I_exact- I_gauss)];

end

plot(log(1:m+1), log(err_exact_gauss), 'o-')
xlabel("log(pts)")
ylabel("log(err)")
grid on;

%% Cas 2
m = 19;
a = -4;
b = 4;
I_exact_2 = atan(4) - atan(-4);

err_exact_2 = [];

% Newton Cotes
for n = 1:m
    x = linspace(a,b,n+1);
    w = pesos(x,n+1,a,b);
    I = Integra(x, @G, w, -1, 1);

    err_exact_2 = [err_exact_2, abs(I_exact_2- I)];

end

figure(2)
plot(log(1:m), log(err_exact_2), '*-r')
xlabel("log(pts)")
ylabel("log(err)")
grid on;
hold on;

%Gauss-Legendre
err_exact_gauss_2 = [];
for n = 0:m
    [z, w] = QuadraturaGauss(n+1);
    
    I_gauss_2 = Integra(z, @G, w, a, b);   
    err_exact_gauss_2 = [err_exact_gauss_2, abs(I_exact_2- I_gauss_2)];

end

plot(log(1:m+1), log(err_exact_gauss_2), 'o-')
xlabel("log(pts)")
ylabel("log(err)")
grid on;


%% Cas 3
m = 14;
a = 0;
b = pi/2;

I_exact_3 = integral(@H, a, b);

err_exact_3 = [];

% Newton Cotes
for n = 1:m
    x = linspace(a,b,n+1);
    x(1) = [];
    x(n) = [];
    w = pesos(x,n+1,a,b);
    
    I = Integra(x, @H, w, -1, 1);

    err_exact_3 = [err_exact_3, abs(I_exact_3- I)];

end

figure(3)
plot(log(1:m), log(err_exact_3), '*-r')
xlabel("log(pts)")
ylabel("log(err)")
grid on;
hold on;

%Gauss-Legendre
err_exact_gauss_3 = [];
for n = 0:m
    [z, w] = QuadraturaGauss(n+1)
    
    I_gauss_3 = Integra(z, @H, w, a, b);   
    err_exact_gauss_3 = [err_exact_gauss_3, abs(I_exact_3 - I_gauss_3)];

end

plot(log(1:m+1), log(err_exact_gauss_3), 'o-')
xlabel("log(pts)")
ylabel("log(err)")
grid on;
