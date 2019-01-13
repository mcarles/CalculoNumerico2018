function Iaprox = compostaSimpson(f,a,b,m)
    x = linspace(a,b,m+1); h=(b-a)/m;
    Iaprox = 0;
    for i =1:m/2
        Iaprox = Iaprox + feval(f,x(2*i-1)) + 4 * feval(f, x(2*i) ) + feval(f,x(2*i+1));
    end
    Iaprox = Iaprox * h/3;
end

