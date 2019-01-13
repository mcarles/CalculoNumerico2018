function d2S = calculaCurvaturesSplineNatural(x,y)

d2S = [];
h=x(2:end)-x(1:end-1);
t=y(2:end)-y(1:end-1);
la = h(2:end)./(h(2:end) + h(1:end-1)); %lambda
mu = h(1:end-1)./(h(2:end) + h(1:end-1)); %mu
d = 6./(h(2:end) + h(1:end-1)).*(t(2:end)./h(2:end) - t(1:end-1)./h(1:end-1));

d = d';

n = length(x)-1;
M = zeros(n-1);
M(1,1) = 2;
M(1,2) = la(1);
M(n-2,n-1) = mu(n-1);
M(n-1,n-1) = 2;
for i=2:n-2
   M(i,i) = 2;
   M(i,i-1) = mu(i);
   M(i,i+1) = la(i);
end
   M(n-1,n-2) = mu(n-1);


M;

d2S = M\d;

d2S = [0; d2S; 0];
end

