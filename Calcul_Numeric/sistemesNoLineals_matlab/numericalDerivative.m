function [dK] = numericalDerivative(F,X)
% 
% [dK] = numericalDerivative(F,X)
% Aquesta funcio aproxima numericament el gradient de la funci? F en el punt X
                
    n=length(X);
    
    dK=zeros(n,1);
    
    eps3 = 4.64e-6 ; %(1e-16)^(1/3)
    typ  = 0.5 ;
    ex   = eps3*max([  abs(X)  typ*ones(n,1) ],[],2);
    temp = X +  ex ;
    ex   = temp - X;

    for i=1:n
        xi_ini = X(i);

        X(i)=xi_ini-ex(i);
        [K_min] = F(X);

        X(i)=xi_ini+ex(i);
        [K_plus] = F(X);

        dK(i)=(K_plus-K_min)./(2*ex(i));

        X(i) = xi_ini;
    end

end