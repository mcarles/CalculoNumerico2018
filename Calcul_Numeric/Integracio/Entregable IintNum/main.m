g = @(x) sin(exp(2*x));
f = @(x) x;
a = 0;
b = 2;
tol = 10.^-3;
Ie = integral(g,a,b)
[Ia,nint] = IntAdapt(g,a,b,tol,0)
