function [value, isterminal, direction] = myEvents(x, z)
    value = z(2);
    isterminal = 1;
    direction = -1;
end

