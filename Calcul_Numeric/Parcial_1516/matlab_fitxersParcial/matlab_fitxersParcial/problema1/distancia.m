function res = distancia(theta)
% Funcio que, donat un angle de tir theta, calcula la distancia a la que el projectil toca terra
% res = distancia(theta)

v0 = 100; 

options = odeset('Events',@criteriParada);
[t,Y]=ode45(@f, [0, 20], [0, 0, v0*cos(theta), v0*sin(theta)], options); 
res = Y(end,1);




function dydt = f(t,y)
% 
% dydt = f(t,y)

R = 0.00132;
modv = sqrt(y(3)^2 + y(4)^2);
dydt = [y(3); y(4); -R*modv*y(3); -R*modv*y(4)-9.8];




function [value,isterminal,direction] = criteriParada(t,y)
% 
% [value,isterminal,direction] = criteriParada(t,y)

value = y(2);       % detecta cuando este valor es 0
isterminal = 1;     % la integraci?n se detiene cuando "value" es 0    
direction =  -1;    % detecta el valor 0 s?lo si la funci?n est? decreciendo