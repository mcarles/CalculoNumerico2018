function [pes] = pesos(x, n, a, b)
    M(1,:) = ones(1,length(x));
    pes = zeros(length(x),1);
    d = [abs(b-a)];
    
    for i = 2:n
       d(i) = (abs(b.^i-a.^i))./i;
    end
    
    for i = 2:n
       M = [M; x.^(i-1)]; 
    end    
    pes = M\d';
end

