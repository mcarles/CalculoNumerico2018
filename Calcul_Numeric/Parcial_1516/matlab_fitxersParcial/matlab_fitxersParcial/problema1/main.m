x0 = 0.5;
residu = @(x) distancia(x)-500;

niter = 100;
tol =10e-6;

[x1, r, err] = Newton_Raphson_Num(x0, residu, niter, tol)
x0 = 1;
[x2, r, err] = Newton_Raphson_Num(x0, residu, niter, tol)

distancia(x1)
distancia(x2)
v = [0.25, 0.5, 0.75, 1];
for i = 1:length(v)
distancia(v(i))
end