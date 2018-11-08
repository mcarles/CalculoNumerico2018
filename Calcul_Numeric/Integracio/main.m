close all; clear; clc;
a = 0;
b = pi/2;
x = linspace(a,b,10);
w = pesos(x,15,a,b);

g = @(x) sin(x);


I = Integra(x, g, w)
