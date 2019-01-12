function [Y] = Heun(f,npas,Y0,a,b)
 %Primer pas: RK orden 2
 Y = Y0; %Valor inicial de la solucion, meter columnas pls
 h = (b-a)/npas;
 x = linspace(a,b,npas);
 for i = 1:npas
    Yim1 = Y(end); %Pongo el valor del paso i-1 aqui
    k1 = f(x(i), Yim1);
    k2 = f(x(i) + h, Yim1 + h*k1);
    Y = [Y, Yim1 + (h/2)*(k1 + k2)]; 
 end
end

