clear; close all; clc

% 2a) Escriu una funcio de matlab que permeti evaluar f(x) = x⁵ - 4x⁴ + 7x³ - 21x² + 6x + 18
% 2b) Dibuixeu la gràfica de f per x en [-1,4]

A = [1 -4 7 -21 6 18]; %coeficients de f

x1 = linspace(-1,4);
f = inline('x.^5-4*x.^4+7*x.^3-21*x.^2 +6*x.+18');
y1 = f(x1);