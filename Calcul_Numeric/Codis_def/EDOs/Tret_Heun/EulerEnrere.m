function [x,Y] = EulerEnrere(f,I,vi,n)
%f es la edo, I es el intervalo [t0, tfinal], vi es el valor inicial, n el
%nº pasos.
%OJO! cada columna es una Yi enterita (la solucion final es la ultima columna 
%de esta mierda)
Y = vi;
h = (I(2) - I(1))/n;
x = linspace(I(1),I(2),n);
for i = 2:n
   Yi = Y(:,end);
   impl = @(y) y - Yi - h*f(x(i),y); %esto es la funcion de la que hay que sacar yi+1
   Yim1 = fsolve(impl, Yi);
   Y = [Y, Yim1]; 
end
end

