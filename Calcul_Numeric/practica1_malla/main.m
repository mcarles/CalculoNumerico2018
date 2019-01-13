clear; close all; clc

load malla.mat

dm = calculaDistorsioMalla(X,T)

F = @(y)(calculaDistorsioMalla([reshape(y,Nint,2);X(Nint+1:end,:)],T));

y0 =  reshape(X(1:Nint,:),2*Nint,1);

tol = 1e-8; maxIter = 50; 

% Falta fer servir el m�tode de Newton per minimitzar la F, amb aproximaci�
% inicial "y0", toler�ncia "tol" i n� m�xim d'iteracions = "maxIter"

%[sol, residu, err] = Newton_Raphson(y0, @numericalHessian, @numericalDerivative, F, maxIter, tol);


[sol2, residu2, err2] = Newton_Raphson_2(y0, @numericalHessian, @numericalDerivative, F, maxIter, tol);

pos1 = [sol2(1), sol2(Nint +1)]
F(sol2)

figure
%plot(1:length(err), log(err), 'o-r')
%hold on;
plot(1:length(err2), log(err2), '*-')
hold on;
xlabel("Iteracions");
ylabel("error log_1_0");
grid on;

figure
plotMesh(X,T)
figure
plotMesh([reshape(sol2,Nint,2);X(Nint+1:end,:)], T)


tol = 1e-10;
%[sol, residu, err] = Newton_Raphson(y0, @numericalHessian, @numericalDerivative, F, maxIter, tol);
[sol2, residu2, err2] = Newton_Raphson_2(y0, @numericalHessian, @numericalDerivative, F, maxIter, tol);

figure
%plot(1:length(err), log(err), 'o-r')
%hold on;
plot(1:length(err2), log(err2), '*-')
hold on;
xlabel("Iteracions");
ylabel("error log_1_0");
grid on;