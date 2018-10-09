clear; close all; clc

x0 = [1;1;1];
niter = 20;
tol = 10^-6;

[x,r, err] = Newton_Raphson(x0, @jacobiana, @residu, niter, tol);

[x_mod,r_mod, err_mod] = Newton_Raphson_Mod(x0, @jacobiana, @residu, niter, tol);

[x_num, r_num, err_num] = Newton_Raphson_Num(x0, @residu, niter, tol);

figure;
plot(1:length(err), log(err), '*-')
hold on;
plot(1:length(err_mod), log(err_mod), 'o-r')
hold on;
plot(1:length(err_num), log(err_num), '*-g')
xlabel('iteraciones')
ylabel('log_1_0 norma')
grid on;

