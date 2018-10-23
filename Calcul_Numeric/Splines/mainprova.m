close all; clear; clc
x = [0,1,3,4,5,7]; y = [1,1.25,2,0.5,0,0.4];

d2S = calculaCurvaturesSplineNatural(x,y)
d2S2 = calculaCurvaturesSplineNatural_correc(x,y)