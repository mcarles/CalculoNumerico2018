function [res] = jacobiana(x)
res = [6, 2*sin(x(2)*x(3))*x(3), 2*sin(x(2)*x(3))*x(2);
x(1)/(sqrt(x(1).^2 + sin(x(3)) + 1.06)), 9, cos(x(3))/(2*sqrt(x(1).^2 + sin(x(3)) + 1.06));
3*x(2)*exp(x(2)*x(1)), 3*x(1)*exp(x(2)*x(1)), 60];
end

