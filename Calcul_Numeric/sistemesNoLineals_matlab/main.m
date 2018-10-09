clear; close all; clc

load malla.mat
plotMesh(X,T)

dm = calculaDistorsioMalla(X,T);

F = @(y)(calculaDistorsioMalla([reshape(y,Nint,2);X(Nint+1:end,:)],T));

y0 =  reshape(X(1:Nint,:),2*Nint,1);

tol = 1e-8; maxIter = 50; 

% Falta fer servir el mètode de Newton per minimitzar la F, amb aproximació
% inicial "y0", tolerància "tol" i nº màxim d'iteracions = "maxIter"
