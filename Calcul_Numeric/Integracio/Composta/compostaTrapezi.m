function Iaprox=compostaTrapezi(f,a,b,m)

x = linspace(a,b,m+1); h=(b-a)/m;

fxint = feval(f,x(2:end-1)); %funcio als punts interiors

Iaprox = feval(f,a)*h/2 + sum(fxint)*h + feval(f,b)*h/2;
