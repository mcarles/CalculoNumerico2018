clear; close all; clc
f = @(x) sin(exp(2*x));
a = 0;
b = 2;
tol = 10.^-6;
Ie = integral(f,a,b);
pts =[a,b];

[Ia, x] = IntSimpsonAdaptativa(f,a,b,tol,pts); %nº intervals es length(x)-1 (llevat repeticions)

%Cal fer sort i unique per vitar repeticions
x = sort(x);
x = unique(x);

y = f(x);
x1 = linspace(a,b,500);

y1 = f(x1);
plot(x,0,'or');
hold on;
plot(x1,y1,'-b');
hold on;
plot(x,y,'k*');
grid on;
