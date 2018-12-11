function [Z, eabs, err] = Euler(F, x, Z, m)
    
    h = abs(x(2)-x(1))/(m+1);
    eabs = [];
    err = [];
    
    for i = 1:m
        K = Z(:, i);
%         if ( 0 == mod(i,2) ) 
%             eabs = [eabs, norm( K - Z(:, i/2) , 2)]; % Norma de X_(i) - X_(2*i)
%             err = [err, eabs(i/2)/norm(K,2)];
%         end
        Z = [Z, K + h.* F(x, K)];
    end
end
