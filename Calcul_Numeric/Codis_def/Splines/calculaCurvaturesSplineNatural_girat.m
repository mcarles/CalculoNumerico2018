function d2S = calculaCurvaturesSplineNatural_girat(x,y)

d2S = [];
h=x(2:end)-x(1:end-1);
t=y(2:end)-y(1:end-1);
la = h(3:end)./(h(3:end) + h(2:end-1)); %lambda
mu = h(1:end-2)./(h(2:end-1) + h(1:end-2)); %mu
d = 6./(h(2:end) + h(1:end-1)).*(t(2:end)./h(2:end) - t(1:end-1)./h(1:end-1));

d = d';


M = diag(la, -1) + diag( zeros(1, length(x) -2 ) +2 ) + diag(mu, 1);

d2S = M\d;

d2S = [0; d2S; 0];
end

