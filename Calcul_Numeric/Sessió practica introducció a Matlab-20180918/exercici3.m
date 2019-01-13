clear; close all; clc

n = input('n = ')

x = linspace(1,n,n)
y = aproxima_pi(x)

figure; % Obre una figura nova
plot(x,y) 


