function [x, r, err] = Newton_Raphson_Num(x0, residu, niter, tol)

J0 = jacobiana_aprox(x0,residu,tol);
f0 = residu(x0);
iter = 0;
Dx = zeros(length(x0), 1);
x1 = zeros(length(x0), 1);
err = [norm(f0)];

fprintf('INICIO NEWTON_RAPHSON_NUM \n')

while (iter < niter) && (norm(f0) > tol)
    fprintf('iter = %d, error = %e \n',iter,err(iter+1))
    x0
    Dx = J0\-f0;
    x1 = x0 + Dx;
    
    J0 = jacobiana_aprox(x1,residu,tol); f0 = residu(x1); x0 = x1;
    err = [err, norm(f0)];
    iter = iter + 1;
end
fprintf('Hacen falta %d iteraciones para llegar al error %e con NEWTON_RAPHSON_NUM \n',iter,err(iter-1));
x = x1; 
r = f0;

end

