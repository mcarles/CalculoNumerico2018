clear; close all; clc

rx = linspace(-1,1, 101);
ry = F(rx);
figure(1)
plot(rx, ry, 'r-')
hold on;
labels = ["Funcion Runge"];

%Interpolacio
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
labels = [labels labeli];
end
legend(labels)

% for n = 2:2:8
%     x = linspace(-1,1,n+1);
%     y = F(x);
%     plot(x,y, 'bo');
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Minims quadrats
n = 100;
x = linspace(-1,1,n+1);

figure(2)
plot(rx, ry, 'r-')
hold on;
labels = ["Funcion Runge"];

for m = 2:2:8
y = F(x);

P = polyfit(x, y, m);
Y = polyval(P,x);

plot(x, Y, '-')
hold on;

labeli = ['Polyval m = ', num2str(m)];
labels = [labels labeli];
end
legend(labels)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Chebyschev
n = 100;
x = linspace(-1,1,n+1);

figure(3)
plot(rx, ry, 'r-')
hold on;
labels = ["Funcion Runge"];

for m = 2:2:8
MChev = mat_cheby(m, -1, 1);
TIChev = TI_cheby(m, -1, 1, @F);

C = MChev\TIChev;
C = fliplr(C');

Y = polyval(C, x);

plot(x, Y, '-')
hold on;

labeli = ['Chebyshev m = ', num2str(m)];
labels = [labels labeli];
end
legend(labels)

%Legendre
n = 100;
x = linspace(-1,1,n+1);

figure(4)
plot(rx, ry, 'r-')
hold on;
labels = ["Funcion Runge"];

for m = 2:2:8
MLeg = mat_leg(m, -1, 1);
TILeg = TI_leg(m, -1, 1, @F);

C = MLeg\TILeg;
C = fliplr(C');

Y = polyval(C, x);

plot(x, Y, '-')
hold on;

labeli = ['Legendre m = ', num2str(m)];
labels = [labels labeli];
end
legend(labels)

