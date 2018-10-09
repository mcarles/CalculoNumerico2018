function [H] = numericalHessian(F,X)
%
% [H] = numericalHessian(F,X)
% Aquesta funcio aproxima numericament la Hessiana de la funci? F en el punt X
                
    n=length(X);
    
    H=zeros(n,n);
    
    eps3 = 1e-4;
    typ  = 0.5 ;
    ex   = eps3*max([  abs(X)  typ*ones(n,1) ],[],2);
    temp = X +  ex ;
    ex   = temp - X;

    [f] = F(X);
    
    for i=1:n
        % Diagonal (i,i)
        xi_ini = X(i);
        X(i)=xi_ini-ex(i);
        [fMx] = F(X);
        X(i)=xi_ini+ex(i);
        [fPx] = F(X);
        H(i,i)=(fPx-2*f+fMx)/(ex(i)*ex(i));
        X(i) = xi_ini;
        
        % Upper and lower (i,j) 
        for j=1:(i-1)

            xi_ini = X(i);
            xj_ini = X(j);

            X(i)=xi_ini-ex(i);
            X(j)=xj_ini-ex(j);
            [fMxMy] = F(X);
            
            X(i)=xi_ini+ex(i);
            X(j)=xj_ini-ex(j);
            [fPxMy] = F(X);
            
            X(i)=xi_ini-ex(i);
            X(j)=xj_ini+ex(j);
            [fMxPy] = F(X);
            
            X(i)=xi_ini+ex(i);
            X(j)=xj_ini+ex(j);
            [fPxPy] = F(X);

            H(i,j)=(fPxPy - fPxMy - fMxPy + fMxMy)/(4*ex(i)*ex(j));
            H(j,i) = H(i,j);
            
            X(i) = xi_ini;
            X(j) = xj_ini;
        end
    end

end