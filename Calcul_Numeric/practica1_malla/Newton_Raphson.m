function [x, r, err] = Newton_Raphson(x0, jacobiana, residu, F, niter, tol)

J0 = jacobiana(F, x0);
f0 = residu(F, x0); 
iter = 0;
Dx = zeros(length(x0), 1);
x1 = zeros(length(x0), 1);
err = [norm(f0)];

fprintf('INICIO NEWTON_RAPHSON \n')

while (iter < niter) && (err(iter + 1) > tol)
    %fprintf('iter = %d, error = %e \n',iter,err(iter+1))
    %x0
    Dx = J0\-f0;
    x1 = x0 + Dx;
    f1 = residu(F, x1);
    err = [err, norm(f1-f0)];
    J0 = jacobiana(F, x1); f0 = f1; x0 = x1;
    
    iter = iter + 1;
end
if (iter < niter)
    fprintf('Hacen falta %d iteraciones para llegar al error %e con NEWTON_RAPHSON \n', iter-1 ,err(iter-1));
else
    fprintf('Hemos hecho %d iteraciones y no ha convergido, error final %e \n', niter, err(iter-1))
end


x = x1; 
r = f0;

end

