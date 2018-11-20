clear; close all; clc
g = @(x) sin(exp(2*x));
f = @(x) x;
a = 0;
b = 2;
tol = 10.^-3;
Ie = integral(g,a,b)
pts =[a,b];
[Ia,nint, x] = IntAdapt(g,a,b,tol,1, pts);
x = sort(x);
x = unique(x);