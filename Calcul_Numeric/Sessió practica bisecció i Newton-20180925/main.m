clear; close all; clc

interv = [1,2];
x0 = 3;
niter = 15;
tol = 10^-6;
h = 10^-6;
xx = linspace(-1,4);
yy = myF(xx);

figure;
plot(xx,yy)
grid on
xlabel('x')
ylabel('y')


figure;

[biseccio_x, biseccio_r] = biseccio_iter(interv, niter, @myF, tol);
plot(1:length(log(biseccio_r)), log(biseccio_r),'o-')
hold on

[newton_x, newton_r] = newton_iter(x0, niter, @myF, @mydF, tol);
hold on
plot(1:length(log(newton_r)), log(newton_r),'r*-')

[newton_aprox_x, newton_aprox_r] = newton_iter_aprox(x0, niter, @myF, tol, h);
hold on
plot(1:length(log(newton_aprox_r)), log(newton_aprox_r),'g*-')

xlabel('iteraciones')
ylabel('log_1_0 errors')
grid on



