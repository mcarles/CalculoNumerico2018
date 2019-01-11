clear; close all; clc

x0 = [1];
niter = 20;
tol = 0.5*10^-5;

%jacobiana es f', residu es f, x0 vector columna

[x,r, err] = Newton_Raphson(x0, @jacobiana, @residu, niter, tol);

%la versio modificada consisteix en fer servir sempre la jacobiana del punt
%inicial en comptes d'anar actualitzant
[x_mod,r_mod, err_mod] = Newton_Raphson_Mod(x0, @jacobiana, @residu, niter, tol);

%versio aproximant la jacobiana numericament
[x_num, r_num, err_num] = Newton_Raphson_Num(x0, @residu, niter, tol);

figure;
plot(0:(length(err)-1), log(err), '*-')
hold on;
plot(0:(length(err_mod)-1), log(err_mod), 'o-r')
hold on;
plot(0:(length(err_num)-1), log(err_num), '*-g')
xlabel('iteraciones')
ylabel('log_1_0 norma')
grid on;

%les iteracions estan bé!
%err(i+1) = r^i = abs(x^(i+1) - x^i)/abs(x^(i+1)) és l'error de x^i 
%(cal fer una iteracio més per calcular-lo ja que depen del seguent punt).

