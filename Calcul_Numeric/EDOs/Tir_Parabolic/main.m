clear; close all; clc;

%Constants
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

[Y] = Euler(@F, x, Z0, m);
figure(1)
x = linspace(0, t, m+1);
plot(Y(1,:), Y(2, :), '*-');
grid on

x = [0, t];
[Yerr1] = Euler(@F, x, Z0, 200);
[Yerr2] = Euler(@F, x, Z0, 400);

eabs = norm([Yerr1(1,end) - Yerr2(1,end), Yerr1(2,end) - Yerr2(2,end)] , 2)
err = eabs/norm([Yerr2(1, end), Yerr2(2, end)], 2)

progerr = [];
for m = 1:200
    [Y1] = Euler(@F, x, Z0, m);
    [Y2] = Euler(@F, x, Z0, 2*m);
    
    eabs = norm([Y1(1,end) - Y2(1,end), Y1(2,end) - Y2(2,end)] , 2);
    err = eabs/norm([Y2(1, end), Y2(2, end)], 2);
    
    progerr = [progerr, err];
end

progerr(end)

figure(2)
plot(log10([1:1:length(progerr)]), log10(progerr), 'x-')
xlabel('log10(Intervals)')
ylabel('log10(r)')
grid on


tspan = [0, 100];
IC = [XY', V'];
options = odeset('Events', 'myEvents');
[x2,z2] = ode45(@F, tspan, IC, options);

figure(3)
plot(x2, z2(:, 2), '*-');
grid on


TH = fzero(@angle, th);
XY = [0, 0];
V = v0*[cos(TH), sin(TH)];
IC = [XY, V];
[x3,z3] = ode45(@F, tspan, IC, options);

figure(4)
plot(z3(:,1), z3(:, 2), '*-');
grid on

