function Iaprox = compostaGauss(f,a,b,m,n)
    [z,w] = QuadraturaGauss(n+1);
    x = linspace(a, b, m+1);
    Iaprox = 0;
    m
    for i = 1:m
        Iaprox = Iaprox + Integra_Gauss(z, f, w, x(i), x(i+1))
    end
    
end

