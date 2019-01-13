function [x,Y] = Heun(f,npas,Y0,a,b)
 %Primer pas: RK orden 2
 %OJO! cada columna es una Yi enterita (la solucion final es la ultima columna 
 %de esta mierda)
 
 Y = Y0; %Valor inicial de la solucion, meter columnas pls
 h = (b-a)/npas;
 x = linspace(a,b,npas);
 for i = 2:npas
    Yim1 = Y(end); %Pongo el valor del paso i-1 aqui
    k1 = f(x(i), Yim1);
    k2 = f(x(i) + h, Yim1 + h*k1);
    Y = [Y, Yim1 + (h/2)*(k1 + k2)]; 
 end
end

