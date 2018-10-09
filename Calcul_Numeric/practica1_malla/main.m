clear; close all; clc

load malla.mat

dm = calculaDistorsioMalla(X,T);

F = @(y)(calculaDistorsioMalla([reshape(y,Nint,2);X(Nint+1:end,:)],T));

y =  reshape(X(1:Nint,:),2*Nint,1);

tol = 1e-10; maxIter = 50; 

% Falta fer servir el m�tode de Newton per minimitzar la F, amb aproximaci�
% inicial "y0", toler�ncia "tol" i n� m�xim d'iteracions = "maxIter"

[sol, residu, err] = Newton_Raphson(y, @numericalHessian, @numericalDerivative, F, maxIter, tol);



pos1 = [sol(1), sol(Nint +1)]
F(sol)

[sol2, residu2, err2] = Newton_Raphson_2(y, @numericalHessian, @numericalDerivative, F, maxIter, tol);


figure
plot(1:length(err), log(err), '*-r')
hold on;
plot(1:length(err2), log(err2), '*-')
hold on;

figure
plotMesh(X,T)
figure
plotMesh([reshape(sol,Nint,2);X(Nint+1:end,:)], T)
figure
plotMesh([reshape(sol2,Nint,2);X(Nint+1:end,:)], T)