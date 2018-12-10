clear; close all; clc;

%Constants
R = 0.00132;
g = [0; -9.81];
v0 = 100;
th = pi/4;
t = 10;
m = 20;

%Condicions inicials
XY = [0; 0];
V = v0*[cos(th); sin(th)];

alpha0 = [XY, V];
Z0 = Z(XY, V);

x = [0, t];

%Euler
[Y, eabs, err] = Euler(@F, x, Z0, m, R, g);
[Y2, eabs, err] = Euler(@F, x, Z0, 2*m, R, g);

for i = 1:length(Y(1,:))-1
    eabs = [eabs, norm( [Y(1, i), Y(2, i)] - [Y2(1, 2*i), Y2(2, 2*i)] ,2)];
    err = [err, eabs(i)/norm([Y2(1, 2*i), Y2(2, 2*i)])];
end

figure(1)
x = linspace(0, t, m+1);
plot(Y(1,:), Y(2, :), '*-');
grid on

figure(2)
plot([1:1:m], err, 'o-')
grid on




