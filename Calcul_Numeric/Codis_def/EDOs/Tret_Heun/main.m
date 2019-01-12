clear; close all; clc;
a = 0; b = 1; Y0 = 1; npas = 12;
Y = Heun(@f,npas,Y0,a,b);