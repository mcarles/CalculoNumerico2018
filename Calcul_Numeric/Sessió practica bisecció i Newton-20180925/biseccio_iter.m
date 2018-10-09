function [vect_x,vect_r] = biseccio_iter(Ini,niter,f, cota_err)
% 
% [vect_x,vect_r] = biseccio_iter(Ini,niter,f)

i = 1;
vect_x = zeros(1); 
vect_r = zeros(1); 
x0 = Ini(1); f0 = f(x0); 
a =  Ini(2); fa = f(a); 
error = cota_err +1 ;

if f0*fa > 0 
    error('Interval inicial inadequat')
end

fprintf('INICIO BISECCION \n')

while (error > cota_err && i < niter)
    
    fprintf('i = %d, x = %f, error = %e \n',i,x0,error)
    x1 = (x0 + a)/2; 
    f1 = f(x1); 
    
    
    vect_x = [vect_x, x0]; 
    error = abs((x1-x0)/x1);
    vect_r = [vect_r, error];
    
    if f1*f0 < 0
        a = x0; fa = f0; 
    end
    
    x0 = x1; f0 = f1; i = i+1;
    
end
fprintf('Hacen falta %d iteraciones para llegar al error %e con BISECCION \n',i-1,error);

end