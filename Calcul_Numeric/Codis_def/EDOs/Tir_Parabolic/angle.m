function diff = angle(th)
    %Esta funcion resuelve el PVI respecto la condicion inicial que estamos
    %intentando encontrar (el angulo theta en este caso)
    XY = [0, 0];
    V = 100*[cos(th), sin(th)];
    IC = [XY, V];
    tspan = [0, 100];
    options = odeset('Events', 'myEvents');
    [x2,z2] = ode45(@F, tspan, IC, options);
    
    diff = z2(end, 1) - 500;
end

