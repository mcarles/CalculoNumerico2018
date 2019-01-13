clear; close all; clc;
a = 0; b = 1; Y0 = 1; npas = 12;
[x,Y] = Heun(@f,npas,Y0,a,b);
I = [a,b];
[x1,Y1] = Euler(@f,I,Y0,npas);
[x2,y2] = ode45(@f,I,Y0);
[x3,Y3] = EulerEnrere(@f,I,Y0,npas);

figure(1);
plot(x,Y,'r*-',x1,Y1,'-b*',x2,y2,'-ko',x3,Y3,'-*g');