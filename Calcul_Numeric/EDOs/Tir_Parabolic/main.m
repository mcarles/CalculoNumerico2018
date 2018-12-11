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

[Y, eabs, err] = Euler(@F, x, Z0, m);
figure(1)
x = linspace(0, t, m+1);
plot(Y(1,:), Y(2, :), '*-');
grid on


progerr = [];
for m = 1:200
    [Y1, eabs, err] = Euler(@F, x, Z0, m);
    [Y2, eabs, err] = Euler(@F, x, Z0, 2*m);

    for i = 1:length(Y1(1,:))-1
        eabs = [eabs, norm( [Y1(1, i), Y1(2, i)] - [Y2(1, 2*i), Y2(2, 2*i)] ,2)];
        err = [err, eabs(i)/norm([Y2(1, 2*i), Y2(2, 2*i)])];
    end
    
    progerr = [progerr, err(end)];
end



figure(2)
plot(log([1:1:length(progerr)]), log(progerr), 'o-')
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

