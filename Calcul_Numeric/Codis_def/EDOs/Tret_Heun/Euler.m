function [x,Y] = Euler(f,I,vi,n)
    %vi = valor inicial, h = longitud de paso, n = nº puntos
    %OJO! cada columna es una Yi enterita (la solucion final es la ultima columna 
    %de esta mierda)
    x = linspace(I(1),I(2),n);
    h = x(2) - x(1);
    Y = vi;
    for i = 2:n
       Y = [Y, Y(:,i-1) + h*f(x(i), Y(:,i-1))]; 
    end
end

