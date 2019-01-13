close all; clear; clc;
a1 = -3;
b1 = 0;
a2 = b1;
b2 = 2;
m = 2;
[z1,w1] = QuadraturaGauss(m);
m = 2;
[z2,w2] = QuadraturaGauss(m);
I1 = Integra(z1, @F, w1, a1, b1);
I2 = Integra(z2, @F, w2, a2, b2);
I = I1 + I2
%I1 = compostaSimpson(@F,a1,b2,100)
Ie1 = integral(@F, a1, b1);
Ie2 = integral(@F, a2, b2);
Ie = Ie1 + Ie2
%INTEGRAL DE MATLAB VA MAL A TROZOS!!!!