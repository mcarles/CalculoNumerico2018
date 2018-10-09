function [vect_x, vect_r] = newton_iter(x0, niter, f, df, cota_err)
% 
% [vect_x,vect_r] = newton_iter(x0,niter,f,df)

i = 1;
vect_x = zeros(1); 
vect_r = zeros(1); 

f0 = f(x0);
df0 = df(x0);

error = cota_err + 1 ;

fprintf('INICIO NEWTON \n')

while (error > cota_err && i < niter)
    
    fprintf('i = %d, x = %f, error = %e \n',i,x0,error)
    x1 = x0 - (f0/df0);
    f1 = f(x1);
    df1 = df(x1);
    
    vect_x = [vect_x, x0];
    error = abs((x1-x0)/x1);
    vect_r = [vect_r, error];
    
    x0 = x1; f0 = f1; df0 = df1; i = i+1;
end
fprintf('Hacen falta %d iteraciones para llegar al error %e con NEWTON \n',i-1,error);

end

