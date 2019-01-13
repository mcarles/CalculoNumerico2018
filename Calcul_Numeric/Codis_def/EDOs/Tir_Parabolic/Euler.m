function [Z] = Euler(F, x, Z, m)
    %F es la edo, x es la variable en la que se evaluan las soluciones (el tiempo
    %en los problemas de fisica, vaya), Z es la condicion inicial, m el nº
    %de pasos
    h = abs(x(2)-x(1))/m;
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
