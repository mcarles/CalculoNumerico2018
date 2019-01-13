function [value, isterminal, direction] = myEvents(x, z)
    value = z(2); %La coordenada de la solucion que quieres mirar que cumpla el evento
    isterminal = 1; %Si la funcion da 0
    direction = -1; %Y es decreciente (poner +1 para creciente, 0 para cualquier 0)
                    %Entonces parara.
end

