function [x, r, err] = Newton_Raphson(x0, jacobiana, residu, niter, tol)

J0 = jacobiana(x0);
f0 = residu(x0);
iter = 0;
Dx = zeros(length(x0), 1);
x1 = zeros(length(x0), 1);
err = [];
x = [x0];
r = [f0];

%err(i) = r^(i-1).

%fem primera iteracio fora per temes de vector
fprintf('INICIO NEWTON_RAPHSON \n')

    Dx = J0\-f0;
    x1 = x0 + Dx;
    
    err = [err, (norm(x1-x0)/norm(x1))];
    f0 = residu(x1); x0 = x1;
    x = [x, x0];
    r = [r, f0];
    iter = iter + 1;

while (iter < niter) && (err(iter) > tol)
    fprintf('iter = %d, error = %e \n',iter-1 ,err(iter))
    x0
    Dx = J0\-f0;
    x1 = x0 + Dx;
   
    err = [err, norm(x1-x0)/norm(x1)];
    f0 = residu(x1); x0 = x1;
    x = [x, x0];
    r = [r, f0];
    iter = iter + 1;
end

fprintf('Hacen falta %d iteraciones para llegar al error %e con NEWTON_RAPHSON \n',iter-1, err(iter));
end

