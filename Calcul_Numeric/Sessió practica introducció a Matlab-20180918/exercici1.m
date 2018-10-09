clear; close all; clc

n = input('nombre de files: ');
m = input('nombre de columnes: ');

A = round(10*rand(n,m))

A([1,n], [1,m])

[nf, nc] = size(A);
A([1,nf], [1,nc])

