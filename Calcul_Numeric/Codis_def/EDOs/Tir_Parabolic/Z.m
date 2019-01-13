function [z] = Z(XY, V)
    %Esto solo escribi las condiciones iniciales en columna
    z = [-1; -2; -3; -4];
    z(1) = XY(1);
    z(2) = XY(2);
    z(3) = V(1);
    z(4) = V(2);
end

