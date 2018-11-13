clear;     % Esborra variables i funcions de la memoria
close all; % Tanca totes les figures que hi ha obertes
clc        % Esborra les instruccions de la finestra de comandes 

%% Operacions basiques amb vectors
% Definim dos vectors fila 
x1 = [1,-5,7,4]; 
x2 = [1,0,-3,2]; 
% Els podem sumar,  
res1 = x1+x2
% multiplicar un vector fila per un vector columna (producte escalar), 
res2 = x1*x2'
% multiplicar un vector columna per un vector fila (matriu), 
res3 = x1'*x2
% multiplicar component a component ...
res4 = x1.*x2
% Pero no els podem multiplicar entre ells
% x1*x2
% Tambe podem sumar un escalar a totes les components
res5 = x1+2
% o aplicar-los una funcio
res6 = exp(x2)


%% Operador \ (mldivide)
z1 = [0,1,0,2]; 
z2 = 0:2:6; 
z1./z2
z1.\z2

%% Matrius i vectors
A = rand(3); 
b = rand(3,1); 
v1 = A*b
v2 = b'*A
% Podem fer servir \ per resoldre sistemes d'equacions
v3 = A\b
A*v3 - b