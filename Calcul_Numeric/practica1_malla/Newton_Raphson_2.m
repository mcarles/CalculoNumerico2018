function [x, r, err] = Newton_Raphson_2(x0, jacobiana, residu, F, niter, tol)

J0 = jacobiana(F, x0);
f0 = residu(F, x0);
f1 = f0;
iter = 1;
Dx = zeros(length(x0), 1);
x1 = x0;
err = [-1];

fprintf('INICIO NEWTON_RAPHSON_2 \n')
if (iter-1 < niter)

    Dx = J0\-f0;
    x1 = x0 + Dx;
    f1 = residu(F,x1);

    err = [norm(x0-x1)/norm(x1)];
    %fprintf('iter = %d, error = %e \n',iter,err(iter))
    %x0
    J0 = jacobiana(F, x1); 
    iter = iter + 1;
end


while (iter < niter) && ( err(iter-1) > tol)
    if (iter == 2) 
        f0 = f1;
        x0 = x1;
    end
    Dx = J0\-f0;
    x1 = x0 + Dx;
    f1 = residu(F, x1);
    
    err = [err, norm(x0-x1)/norm(x1)];

    %fprintf('iter = %d, error = %e \n',iter,err(iter))
    %x0
    
    J0 = jacobiana(F, x1); f0 = f1; x0 = x1;
    iter = iter + 1;

end
    
if (iter < niter)
    fprintf('Hacen falta %d iteraciones para llegar al error %e con NEWTON_RAPHSON_2 \n',iter-1,err(iter-1));
else
    fprintf('Hemos hecho %d iteraciones y no ha convergido, error final %e \n', niter, err(iter-1))
end

x = x1;
r = f0;

end

