clear; close all; clc
rx = linspace(-1,1, 100);
ry = F(rx);
figure
plot(rx, ry, 'r-')
hold on;
labels = ["Funcion Runge"];

for n = 2:2:8
x = linspace(-1,1,n+1);
xd = [];

x01 = [0:1/20:1];
h=x(2:end)-x(1:end-1);
    for i=1:length(x)-1
        xs = x(i)+x01*h(i); %valors de x a l'interval
        xd = [xd xs];
    end

y = F(x);
yd = F(xd);

P = polyfit(x, y, length(x)-1);
Y = polyval(P,xd);

plot(xd, Y, '-')
hold on;

labeli = ['Polyval n+1 = ', num2str(i+1)];
labels = [labels labeli]
end
legend(labels)

for n = 2:2:8
    x = linspace(-1,1,n+1);
    y = F(x);
    plot(x,y, 'bo');
end

